package com.lambdabuy.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lambdabuy.bean.MailInfo;
import com.lambdabuy.dao.CartDAO;
import com.lambdabuy.dao.CartItemDAO;
import com.lambdabuy.dao.OrderDAO;
import com.lambdabuy.dao.OrderDetailDAO;
import com.lambdabuy.dao.ProductDAO;
import com.lambdabuy.dao.UserDAO;
import com.lambdabuy.entity.Cart;
import com.lambdabuy.entity.CartItem;
import com.lambdabuy.entity.Order;
import com.lambdabuy.entity.OrderDetail;
import com.lambdabuy.entity.Product;
import com.lambdabuy.entity.User;
import com.lambdabuy.service.MailService;



@Controller
public class OrderController {
	DecimalFormat df = new DecimalFormat( "#,###,###,##0.00" );
	
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	HttpSession session;
	
	//@Autowired
	//CartService cart;
	
	@Autowired
	CartItemDAO itemdao;
	
	@Autowired
	OrderDAO odao;
	
	@Autowired
	OrderDetailDAO ddao;
	
	@Autowired
	CartDAO cdao;
	
	@Autowired
	MailService mailer;

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	UserDAO udao;

	//Tạo form đặt hàng từ trang giỏ hàng của User
	@GetMapping("/order/checkout")
	public String showForm(@ModelAttribute("order") Order order,Model model) {
		User user = (User) session.getAttribute("user");
		//Cart cart = (Cart)session.getAttribute("cart");
		//CartItem items =(CartItem)session.getAttribute("items");
		List<CartItem> items=new ArrayList<>();
		order.setOrderDate(new Date());
		order.setUser(user);
		//delcare totalQuantity and totalUnitPrice to calculate totalPrice 
		
		double price1Item=0;
		double discountAmount=0;
		double totalPrice=0;
		Cart findCart = cdao.findCartByUserId(user.getId());
		if(findCart!=null) {
			 items= itemdao.findCartIdInCartItem(findCart.getId());
			if(items!=null) {
				for(CartItem ci: items) {
					List<Product> findProduct = pdao.findByIds(String.valueOf(ci.getProduct().getId()));
					//totalQuantity+=ci.getQuantity();
					for(Product pros:findProduct) {
						if(ci.getProduct().getId().equals(pros.getId())) {
							if(pros.getDiscount()==0)
								price1Item=pros.getUnitPrice()*ci.getQuantity();
							else {
								discountAmount=pros.getUnitPrice()*ci.getQuantity()*pros.getDiscount();
								price1Item=(pros.getUnitPrice()*ci.getQuantity())-discountAmount;
							}
							totalPrice+=price1Item;
								//double discountAmount=pros.getUnitPrice()*ci.getQuantity()*pros.getDiscount();
							
						} 	
						
					}
				}
			}
		}
		//double totalPrice=price1Item;
		String shipAddress=findCart.getShipAddress();
		//amount là tổng tiền phải trả
		order.setAmount(totalPrice);
		//set status=1 (Đang xử lý) 
		order.setStatus(1);
		model.addAttribute("items",items);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("shipAddress",shipAddress);
		return "order/checkout";

	}
	//Chức năng đặt hàng (tạo hóa đơn hàng mới)
	@PostMapping("/order/checkout")
	public String purchase(Model model, 
			@ModelAttribute("order") Order order){
		User user = (User) session.getAttribute("user");
		List<CartItem> items = new  ArrayList<>();
		List<OrderDetail> details = new  ArrayList<>();
		//List<Product> listProduct = pdao.findAll();
		Cart findCart = cdao.findCartByUserId(user.getId());
		if(findCart!=null) {
			 items= itemdao.findCartIdInCartItem(findCart.getId());
			if(items!=null) {
				for(CartItem ci: items) {
					List<Product> findProduct = pdao.findByIds(String.valueOf(ci.getProduct().getId()));
					for(Product calUnitprice:findProduct) {
						OrderDetail detail =new OrderDetail();
						detail.setOrder(order);
						detail.setProduct(calUnitprice);
						detail.setUnitPrice(calUnitprice.getUnitPrice());
						detail.setQuantity(ci.getQuantity());
						detail.setDiscount(calUnitprice.getDiscount());
						details.add(detail);
						
						Product product = new Product();
						product.setId(calUnitprice.getId());
						product.setName(calUnitprice.getName());
						product.setUnitPrice(calUnitprice.getUnitPrice());
						product.setImage(calUnitprice.getImage());
						product.setProductDate(calUnitprice.getProductDate());
						product.setAvailable(calUnitprice.getAvailable());
						product.setQuantity(calUnitprice.getQuantity()-ci.getQuantity());
						product.setDescription(calUnitprice.getDescription());
						product.setDiscount(calUnitprice.getDiscount());
						product.setViewCount(calUnitprice.getViewCount());
						product.setSpecial(calUnitprice.getSpecial());
						product.setCategory(calUnitprice.getCategory());
						product.setBrand(calUnitprice.getBrand());
						product.setSupplier(calUnitprice.getSupplier());
						pdao.update(product);
					}
					
				}
			}
		}
		/*
			for(Product product:list) {
				OrderDetail detail =new OrderDetail();
				detail.setOrder(order);
				detail.setProduct(product);
				detail.setUnitPrice(product.getUnitPrice());
				detail.setQuantity(product.getQuantity());
				detail.setDiscount(product.getDiscount());
				details.add(detail);
					
			}
			*/
		odao.create(order, details);
		model.addAttribute("message", "Đặt hàng thành công!");
		for(CartItem ci: items) {
			itemdao.delete(ci.getId());
		}
		return "redirect:/order/list";

	}
	
	//Hiển thị danh sách đơn hàng đã mua của user
	@GetMapping("/order/list")
	public String list(Model model) {
		User user = (User) session.getAttribute("user");
		List<Order> orders = odao.findByUser(user);
		model.addAttribute("orders", orders);
		return "order/list";
	}
	//Chi tiết hóa đơn của đơn hàng đó khi bấm vào
	@GetMapping("/order/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Order order = odao.findById(id);
		List<OrderDetail> details = ddao.findByOrder(order);
		model.addAttribute("order", order);
		model.addAttribute("details", details);
		return "order/detail";
	}
	
	@GetMapping("/order/items")
	public String items(Model model) {
		User user = (User) session.getAttribute("user");
		List<Product> list = odao.findItemsByUser(user);
		model.addAttribute("list", list);
		return "product/list_order_item";
	}
	//Hướng dẫn thanh toán và chuyển khoản qua MOMO
	@RequestMapping("/order/guide")
	public String index() {
		
		return "order/guide";
	}
	
	//@ResponseBody
	//Tạo và gửi email yêu cầu hủy đơn hàng đến email của shop: windmotor2022@gmail.com
	@RequestMapping("/order/cancel/{id}")
	public String cancelOrder(@PathVariable("id") Integer id,Model model,HttpServletRequest req) {
			//send mail
			User user = (User) session.getAttribute("user");
			Date sendDate = new Date();
			try {
				Order order= odao.findById(id);
				String status = order.getStatus()==1?"Đang xử lý":order.getStatus()==2?"Đã thanh toán và đang giao hàng":order.getStatus()==3?"Đang giao hàng":order.getStatus()==4?"Đã giao hàng và thanh toán":order.getStatus()==5?"Hủy đơn hàng":"ERROR";
				//List<OrderDetail> findByOrder = ddao.findByOrder(order);
				String from=user.getEmail();
				String to ="windmotor2022@gmail.com";
				String subject = "Yêu cầu hủy đơn hàng từ khách hàng"+user.getId();
				String body ="<hr><h3> Khách hàng "+ user.getId()+
						" đã gửi yêu cầu Hủy bỏ đơn hàng số: "+order.getId()+"</h3><br/>"
						+"<h4>Ngày đặt hàng:</h4> "+order.getOrderDate()+"<br/>"
						+"<h4>Số điện thoại:</h4> "+order.getTelephone()+"<br/>"
						+"<h4>Địa chỉ nhận hàng:</h4> "+order.getAddress()+"<br/>"
						+"<h4>Trạng thái đơn hàng:</h4> "+ status+"<br/>"
						+"<h4>Thành tiền:</h4> "+df.format(order.getAmount())+"<br/>"
						+"<p>Yêu cầu được gửi lúc "+sendDate+"</p>";
				MailInfo mail =new MailInfo(from,to,subject,body);
				mailer.send(mail);
				//model.addAttribute("message","Gửi yêu cầu hủy đơn hàng thành công!");
			} catch (Exception e) {
				e.printStackTrace();
				//model.addAttribute("message","ERROR: Gửi yêu cầu hủy đơn hàng thất bại!");
			}
			return "redirect:/order/list";
	}
	 
}




