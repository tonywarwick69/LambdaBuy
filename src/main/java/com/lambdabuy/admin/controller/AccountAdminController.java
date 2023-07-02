package com.lambdabuy.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.Servlet;
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
import com.lambdabuy.dao.UserDAO;
import com.lambdabuy.entity.User;
import com.lambdabuy.service.CookieService;
import com.lambdabuy.service.MailService;

@Controller
public class AccountAdminController {
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
	//Cookie: tính năng nhớ các field mà user đã nhập trước đó

	@Autowired
	ServletContext app;
	
	@Autowired
	MailService mailer;	
	
	@Autowired
	HttpServletRequest request;
	//Tạo form login với userid và pass
	@GetMapping(value= {"/admin/login","/admin"})
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
		return "admin/login/login";
	}
	//Xử lý login
	@PostMapping("/admin/login")
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
		}else if (user.getRole()!=1 && user.getRole()!=4) {
			model.addAttribute("message", "Không có quyền!");
		/*} else if(!email.equals(user.getEmail())) {
			model.addAttribute("message","Nhập sai email!");*/
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
			String backUrl = (String) session.getAttribute("back-url-admin");
			if(backUrl != null) {
				return "redirect:" + backUrl;
			}
			return "redirect:/admin/home/index";
		}
		return "admin/login/login";
	}

	//Xóa user khỏi session và redirect tới trang login
	@RequestMapping("/admin/logout")
	public String logout(Model model) {
		session.removeAttribute("user");
		return "redirect:/admin/login";
	}
	//Kích hoạt tài khoản
	@GetMapping("/admin/account/activate/{id}")
	public String activate(Model model,@PathVariable("id") String id) {
		User user = dao.findById(id);
		user.setActivated(true);
		dao.update(user);
		
		return "redirect:/admin/account/login";
	}
	//Tạo form chỉnh sửa thông tin cá nhân
	@GetMapping("/admin/profile")
	public String edit(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);

		return "admin/account/edit";
	}
	//Chỉnh sửa thông tin cá nhân
	@PostMapping("/admin/profile")
	public String edit(Model model, @ModelAttribute("form") User user,BindingResult errors,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException, MessagingException {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây!");
			return "admin/account/edit";
		} 
		if(!file.isEmpty()) {
			String dir = app.getRealPath("/static/images/admin");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		user.setPassword(user.getPassword());
		dao.update(user);
		session.setAttribute("user", user);

		model.addAttribute("message", "Cập nhật thành công!");

		return "admin/account/edit";
	}
	//Tạo form thay đổi mật khẩu
	@GetMapping("/admin/change")
	public String change(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);
		return "admin/account/change";
	}
	//Thay đổi mật khẩu
	@PostMapping("/admin/change")
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
			} else if (bCryptPasswordEncoder.matches(pw.toString(), user.getPassword())==false) {
				model.addAttribute("message", "Mật khẩu hiện tại không đúng!");
			} else {
				user.setPassword(bCryptPasswordEncoder.encode(pw1));
				dao.update(user);

				model.addAttribute("message", "Thay đổi mật khẩu thành công!");
			}
		}
		return "admin/account/change";
	}
	

	
}








