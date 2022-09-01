package com.estore.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.windmotors.bean.MailInfo;
import com.windmotors.dao.UserDAO;
import com.windmotors.entity.Order;
import com.windmotors.entity.User;
import com.windmotors.service.CookieService;
import com.windmotors.service.MailService;

@Controller
public class AccountController {

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

	@GetMapping("/account/login")
	public String login(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if (ckid != null) { //nếu userid khác null
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();

			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}
		return "account/login";
	}

	@PostMapping("/account/login")
	public String login(Model model, // nhận thông tin từ form người dùng
			@RequestParam("id") String id, // form người dùng nhập 3 cái
			@RequestParam("pw") String pw, @RequestParam(value = "rm", defaultValue = "false") boolean rm) { 
		// khi người dùng chưa tích chọn thì mặc định sẽ là false
		User user = dao.findById(id); // lấy id user ra
		if (user == null) { // nếu user này ko có trong database
			model.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu!");
		} else if (!pw.equals(user.getPassword())) { // nếu mà đúng username rồi => tiếp tục check mật khẩu
			model.addAttribute("message", "Sai mật khẩu!"); // nếu mà pass nhập vào ko giống trong database => Sai mật khẩu
			// nếu đúng username, mật khẩu => check kích hoạt chưa ?
		} else if (!user.getActivated()) {
			model.addAttribute("message", "Tài khoản chưa được kích hoạt!");
		}else if (user.getAdmin()) {
			model.addAttribute("message", "Bạn không có quyền!");
		} else {// đăng nhập thành công
			model.addAttribute("message", "Đăng nhập thành công!");
			session.setAttribute("user", user); // cất user vào trong session
			
			//xử lý người ta có check vào ko
			// Ghi nhớ tài khoản bằng cookie khi check vào checkbox nhớ tài khoản
			if (rm == true) { // nếu người dùng check vào thì tạo cookie ra để gửi về client
				cookie.create("userid", user.getId(), 30); //lưu 30 ngày
				cookie.create("pass", user.getPassword(), 30); //lưu 30 ngày
			} else { // trong trường hợp ko tích vào thì xóa cookie đi
				cookie.delete("userid");
				cookie.delete("pass");
			}

			// Quay lai trang bao ve(neu co)
			String backUrl = (String) session.getAttribute("back-url");
			if (backUrl != null) {
				return "redirect:" + backUrl;
			}
			return "redirect:/home";
		}
		return "account/login";
	}

	@RequestMapping("/account/logout") //khi đăng nhập thì bỏ user vào session
	public String logout(Model model) { //khi đăng xuất thì xóa user khỏi session => trở về trang chủ
		session.removeAttribute("user");
		return "redirect:/home";
	}

	@GetMapping("/account/register")
	public String register(Model model) {
		User user = new User();
		model.addAttribute("form", user);

		return "account/register";
	}

	@PostMapping("/account/register")
	public String register(Model model, @Validated @ModelAttribute("form") User user, BindingResult errors, //đọc dữ liệu từ form gửi lên
			//khi đăng ký submit nguyên form lên , có đầy đủ thông tin khách hàng
			//nhận thông tin KH bằng cái Customer user
			//nếu gặp lỗi thì hiển thị ra @ModelAttribute
			@RequestParam("photo_file") MultipartFile file)
			throws IllegalStateException, IOException, MessagingException {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Error");
			return "account/register";
		} else {
			User user2 = dao.findById(user.getId());
			if (user2 != null) {
				model.addAttribute("message", "Tên đăng nhập đã được sử dụng!");
				return "account/register";
			}
		}

		if (file.isEmpty()) {
			user.setPhoto("user.png");
		} else {
			String dir = app.getRealPath("/static/images/customers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		user.setActivated(false);
		user.setAdmin(false);
		dao.create(user); //insert vào database
		model.addAttribute("message", "Đăng kí thành công.Vui lòng kiểm tra email để kích hoạt tài khoản!");

		
		  String from = "windmotor2022@gmail.com"; String to = user.getEmail(); String
		  subject = "Welcome!"; String url =
		  request.getRequestURL().toString().replace("register", "activate/" +
		  user.getId()); String body =
		  "WindMotors shop xin chào! Vui lòng nhấn vào <a href='" + url +
		  "'>Activate</a> để kích hoạt tài khoản."; MailInfo mail = new MailInfo(from, to, subject, body); mailer.send(mail);
		 

		return "account/register";
	}

	@GetMapping("/account/activate/{id}")
	public String activate(Model model, @PathVariable("id") String id) {
		User user = dao.findById(id);
		user.setActivated(true);
		dao.update(user);

		return "redirect:/account/login";
	}

	@GetMapping("/account/forgot")
	public String forgot(Model model) {
		return "account/forgot";
	}

	@PostMapping("/account/forgot")
	public String forgot(Model model, 
			@RequestParam("id") String id, 
			@RequestParam("email") String email)
			throws MessagingException {
		User user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Tên tài khoản không đúng!");
		} else if (!email.equals(user.getEmail())) {
			model.addAttribute("message", "Email không đúng!");
		} else {
			String from = "windmotor2022@gmail.com";
			String to = user.getEmail();
			String subject = "Forgot Password!";
			String body = "Your password is: " + user.getPassword();
			MailInfo mail = new MailInfo(from, to, subject, body);
			mailer.send(mail);

			model.addAttribute("message", "Mật khẩu được gửi tới email của bạn!");
			
		}
		return "account/forgot";
	}

	@GetMapping("/account/change")
	public String change(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);

		return "account/change";
	}

	@PostMapping("/account/change")
	public String change(Model model,
			@ModelAttribute("form") User users,
			@RequestParam("id") String id, 
			@RequestParam("pw") String pw,
			@RequestParam("pw1") String pw1,
			@RequestParam("pw2") String pw2) {
		if (!pw1.equals(pw2)) {
			model.addAttribute("message", "Mật khẩu không khớp!");
		} else {
			User user = dao.findById(id);
			if (user == null) {
				model.addAttribute("message", "Sai tên tài khoản hoặc mật khẩu");
			} else if (!pw.equals(user.getPassword())) {
				model.addAttribute("message", "Sai mật khẩu!");
			}else if (pw1.isEmpty() && pw2.isEmpty()) {
				model.addAttribute("message", "Vui lòng điền thông tin mật khẩu mới!");
			}else {
				user.setPassword(pw1);
				dao.update(user);

				model.addAttribute("message", "Thay đổi mật khẩu thành công!");
			}
		}
		return "account/change";
	}

	@GetMapping("/account/edit")
	public String edit(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);

		return "account/edit";
	}

	@PostMapping("/account/edit")
	public String edit(Model model, @ModelAttribute("form") User user,BindingResult errors,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException, MessagingException {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây!");
			return "account/edit";
		} 
		if(!file.isEmpty()) {
			String dir = app.getRealPath("/static/images/customers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		dao.update(user);
		session.setAttribute("user", user);

		model.addAttribute("message", "Cập nhật thành công!");

		return "account/edit";
	}

}
