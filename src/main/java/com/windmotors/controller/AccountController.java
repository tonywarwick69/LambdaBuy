
package com.windmotors.controller;

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
		if (ckid != null) { 
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();

			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}
		return "account/login";
	}

	@PostMapping("/account/login")
	public String login(Model model, 
			@RequestParam("id") String id, 
			@RequestParam("pw") String pw, @RequestParam(value = "rm", defaultValue = "false") boolean rm) { 
		
		User user = dao.findById(id); 
		if (user == null) { 
			model.addAttribute("message", "Sai t??n ????ng nh???p ho???c m???t kh???u!");
		} else if (!pw.equals(user.getPassword())) { 
			model.addAttribute("message", "Sai m???t kh???u!"); 

			
		} else if (!user.getActivated()) {
			model.addAttribute("message", "T??i kho???n ch??a ???????c k??ch ho???t!");
		}else if (user.getAdmin()==1) {
			model.addAttribute("message", "B???n kh??ng c?? quy???n!");
		} else {
			model.addAttribute("message", "????ng nh???p th??nh c??ng!");
			session.setAttribute("user", user); 
			
			if (rm == true) { 
				cookie.create("pass", user.getPassword(), 30); 
			} else { 
				cookie.delete("userid");
				cookie.delete("pass");
			}
			
			String backUrl = (String) session.getAttribute("back-url");
			if (backUrl != null) {
				return "redirect:" + backUrl;
			}
			return "redirect:/home";
		}
		return "account/login";
	}

	@RequestMapping("/account/logout") 
	public String logout(Model model) { 
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
	public String register(Model model, @Validated @ModelAttribute("form") User user, BindingResult errors, //?????c d??? li???u t??? form g???i l??n

			@RequestParam("photo_file") MultipartFile file)
			throws IllegalStateException, IOException, MessagingException {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Error");
			return "account/register";
		} else {
			User user2 = dao.findById(user.getId());
			if (user2 != null) {
				model.addAttribute("message", "T??n ????ng nh???p ???? ???????c s??? d???ng!");
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
		user.setAdmin(2);
		dao.create(user); 
		model.addAttribute("message", "????ng k?? th??nh c??ng. Vui l??ng ki???m tra mail ????? k??ch ho???t t??i kho???n!");


		String from = "windmotor2022@gmail.com";
		String to = user.getEmail();
		String subject = "Welcome!";
		String url = request.getRequestURL().toString().replace("register", "activate/" + user.getId());
		String body = "Wind Motors shop xin ch??o! Vui l??ng nh???n v??o <a href='" + url + "'>Activate</a> ????? k??ch ho???t t??i kho???n.";
		MailInfo mail = new MailInfo(from, to, subject, body);
		mailer.send(mail);

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
			model.addAttribute("message", "T??n t??i kho???n kh??ng ????ng!");
		} else if (!email.equals(user.getEmail())) {
			model.addAttribute("message", "Email kh??ng ????ng!");
		} else {
			String from = "windmotor2022@gmail.com";
			String to = user.getEmail();
			String subject = "Qu??n m???t kh???u!";
			String body = "<a href='http://localhost:8080/account/recover'>B???m v??o ????y ????? thi???t l???p m???t kh???u m???i</a>";//"Wind Motors shop xin ch??o! M???t kh???u c???a b???n l??: " + user.getPassword();
			MailInfo mail = new MailInfo(from, to, subject, body);
			mailer.send(mail);
			model.addAttribute("message", "M???t kh???u ???? ???????c g???i ?????n mail c???a b???n!");

			
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
			model.addAttribute("message", "X??c nh???n m???t kh???u kh??ng tr??ng kh???p!");
		} else {
			User user = dao.findById(id);
			if (user == null) {
				model.addAttribute("message", "Sai t??n t??i kho???n ho???c m???t kh???u!");
			
				  } else if (!pw.equals(user.getPassword())) { model.addAttribute("message",
				 "M???t kh???u hi???n t???i kh??ng ????ng!");
				
			} else {
				user.setPassword(pw1);
				dao.update(user);

				model.addAttribute("message", "Thay ?????i m???t kh???u th??nh c??ng!");
			}
		}
		return "account/change";
	}

	@GetMapping("/account/recover")
	public String recover(Model model) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("form", user);

		return "account/recover";
	}
//
	@PostMapping("/account/recover")
	public String recover(Model model,
			@ModelAttribute("form") User users,
			@RequestParam("id") String id, 
			@RequestParam("pw1") String pw1,
			@RequestParam("pw2") String pw2) {
		if (!pw1.equals(pw2)) {
			model.addAttribute("message", "M???t kh???u kh??ng kh???p!");
		} else {
			User user = dao.findById(id);
			if (user == null) {
				model.addAttribute("message", "Sai t??n t??i kho???n ho???c m???t kh???u");
			}else if (pw1.isEmpty() && pw2.isEmpty()) {
				model.addAttribute("message", "Vui l??ng ??i???n th??ng tin m???t kh???u m???i!");
			}else {
				user.setPassword(pw1);
				dao.update(user);

				model.addAttribute("message", "Thay ?????i m???t kh???u th??nh c??ng!");
			}
		}
		return "account/recover";
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
			model.addAttribute("message", "Vui l??ng s???a c??c l???i sau ????y!");
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
		model.addAttribute("message", "C???p nh???t t??i kho???n th??nh c??ng!");


		return "account/edit";
	}

}
