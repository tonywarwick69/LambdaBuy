
package com.lambdabuy.supplier.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lambdabuy.bean.MailInfo;
import com.lambdabuy.dao.CartDAO;
import com.lambdabuy.dao.SupplierDAO;
import com.lambdabuy.dao.UserDAO;
import com.lambdabuy.entity.Cart;
import com.lambdabuy.entity.Supplier;
import com.lambdabuy.entity.User;
import com.lambdabuy.service.CookieService;
import com.lambdabuy.service.MailService;

@Controller
public class AccountSupplierController {
	@Autowired
	private JdbcUserDetailsManager jdbcUserDetailsManager;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	UserDAO dao;

	@Autowired
	HttpSession session;

	@Autowired
	CookieService cookie;

	@Autowired
	ServletContext app;
	
	@Autowired
	MailService mailer;	
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	SupplierDAO sdao;
	
	@Autowired
	CartDAO cdao;
	
	@GetMapping(value= {"/supplier/login","/supplier"})
	public String login(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		//Cookie ckemail = cookie.read("useremail");
		if (ckid != null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();
			//String email=ckemail.getValue();
			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
			//model.addAttribute("email",email);
		}
		return "supplier/login/login";
	}
	@PostMapping("/supplier/login")
	public String login(Model model,
			@RequestParam("id") String id,
			//@RequestParam("email") String email,
			@RequestParam("pw") String pw,
			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {
		User user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Sai tài khoản hoặc mật khẩu");
		} else if (bCryptPasswordEncoder.matches(pw.toString(), user.getPassword())==false) {
			model.addAttribute("message", "Sai mật khẩu");
		} else if (!user.getActivated()) {
			model.addAttribute("message", "Tài khoản chưa được kích hoạt!");
		}else if (user.getRole()!=3) {
			model.addAttribute("message", "Không có quyền!");
		
		} else {// thanh cong
			model.addAttribute("message", "Login successfully!");
			session.setAttribute("user", user);
			// ghi nho tk
			if (rm == true) {
				cookie.create("userid", user.getId(), 30);
				//cookie.create("useremail", user.getEmail(), 30);
				cookie.create("pass", user.getPassword(), 30);
			} else {
				cookie.delete("userid");
				//cookie.delete("email");
				cookie.delete("pass");
			}
			//Quay lai trang bao ve(neu co)
			String backUrl = (String) session.getAttribute("back-url-supplier");
			if(backUrl != null) {
				return "redirect:" + backUrl;
			}
			return "redirect:/supplier/product/index";
		}
		return "supplier/login/login";
	}

	
	@RequestMapping("/supplier/logout")
	public String logout(Model model) {
		session.removeAttribute("user");
		return "redirect:/supplier/login";
	}
	

	
	@GetMapping("/supplier/profile")
	public String edit(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);

		return "supplier/account/edit";
	}

	@PostMapping("/supplier/profile")
	public String edit(Model model, @ModelAttribute("form") User user,BindingResult errors,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException, MessagingException {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây!");
			return "supplier/account/edit";
		} 
		if(!file.isEmpty()) {
			String dir = app.getRealPath("/static/images/suppliers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		user.setPassword(user.getPassword());
		dao.update(user);
		session.setAttribute("user", user);

		model.addAttribute("message", "Cập nhật thành công!");

		return "supplier/account/edit";
	}
	
	@GetMapping("/supplier/change")
	public String change(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);
		return "supplier/account/change";
	}

	@PostMapping("/supplier/change")
	public String change(Model model, 
			@ModelAttribute("form") User users,
			@RequestParam("id") String id, 
			@RequestParam("pw") String pw,
			@RequestParam("pw1") String pw1, 
			@RequestParam("pw2") String pw2) {
		if (!pw1.equals(pw2)) {
			model.addAttribute("message", "Xác nhận mật khẩu không trùng khớp!");
		} else {
			User user = dao.findById(id);
			if (user == null) {
				model.addAttribute("message", "Sai tài khoản!");
			} else if (bCryptPasswordEncoder.matches(pw, user.getPassword())==false) {
				model.addAttribute("message", "Mật khẩu hiện tại không đúng!");
			} else {
				user.setPassword(bCryptPasswordEncoder.encode(pw1));
				dao.update(user);

				model.addAttribute("message", "Thay đổi mật khẩu thành công!");
			}
		}
		return "supplier/account/change";
	}
	
	@GetMapping("/supplier/register")
	public String register(Model model) {
		User user = new User();
		model.addAttribute("form", user);

		return "account/registerForSupplier";
	}

	@PostMapping("/supplier/register")
	public String register(Model model, @Validated @ModelAttribute("form") User user, BindingResult errors, //đọc dữ liệu từ form gửi lên
			@RequestParam("photo_file") MultipartFile file)
			throws IllegalStateException, IOException, MessagingException {
	
		//String encodedPassword = bCryptPasswordEncoder.encode(user.getPassword());
		if (errors.hasErrors()) {
			model.addAttribute("message", "Error");
			return "account/registerForSupplier";
		} else {
			User user2 = dao.findById(user.getId());
			if (user2 != null) {
				model.addAttribute("message", "Tên đăng nhập đã được sử dụng!");
				return "account/registerForSupplier";
			}
		}
		String photo="";
		if (file.isEmpty()) {
			//user.setPhoto("user.png");
			photo="user.png";
		} else {
			String dir = app.getRealPath("/static/images/customers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			//user.setPhoto(f.getName());
			photo=f.getName();
		}
		//user.setActivated(false);
		//user.setRole(2);
		boolean activated= false;
		int role=3;
		String password= bCryptPasswordEncoder.encode(user.getPassword());
		User user2= new User(user.getId(),password,user.getFullname(),user.getTelephone(),user.getEmail(),photo,activated,role,user.getBirthDay());
		dao.create(user2);
		Supplier supplier = new Supplier(user.getEmail(),user.getTelephone(),user);
		sdao.create(supplier);
		Cart cart = new Cart("",user);
		cdao.create(cart);
		model.addAttribute("message", "Đăng ký thành công. Vui lòng kiểm tra mail để kích hoạt tài khoản!");
		
		String from = "windmotor2022@gmail.com";
		String to = user.getEmail();
		String subject = "Welcome!";
		String url = request.getRequestURL().toString().replace("register", "activate/" + user.getId());
		String body = "Lambda Buy shop xin chào! Vui lòng nhấn vào <a href='" + url + "'>Activate</a> để kích hoạt tài khoản.";
		MailInfo mail = new MailInfo(from, to, subject, body);
		mailer.send(mail);

		return "account/registerForSupplier";
	}
	@GetMapping("/supplier/activate/{id}")
	public String activate(Model model,@PathVariable("id") String id) {
		User user = dao.findById(id);
		user.setActivated(true);
		dao.update(user);
		
		return "redirect:/supplier/";
	}

}
