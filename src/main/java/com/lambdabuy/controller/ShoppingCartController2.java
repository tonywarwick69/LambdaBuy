package com.lambdabuy.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lambdabuy.dao.CartDAO;
import com.lambdabuy.dao.CartItemDAO;
import com.lambdabuy.dao.ProductDAO;
import com.lambdabuy.dao.UserDAO;
import com.lambdabuy.entity.Cart;
import com.lambdabuy.entity.CartItem;
import com.lambdabuy.entity.Category;
import com.lambdabuy.entity.Product;
import com.lambdabuy.entity.User;
import com.lambdabuy.service.CookieService;

@Controller
public class ShoppingCartController2 {
	@Autowired
	CartDAO cdao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	CartItemDAO itemdao;
	
	@Autowired
	CookieService cookie;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ProductDAO pdao;
	//Hiện thị giỏ hàng theo userId đang đăng nhập
	@RequestMapping("/cart/view-cart-by-userid/{uid}")
	public String viewCartByUserId(Model model, @PathVariable("uid") String userId) {
		Cart findCart = cdao.findCartByUserId(userId);
		List<CartItem> list =itemdao.findCartItemsByCartId(findCart.getId());
		model.addAttribute("findCart", findCart);
		model.addAttribute("list",list);
		return "cart/cartitem-list-by-user";
	}
	//Thêm hàng vào giỏ hàng
	@RequestMapping(value={"/cart/add-to-cart","/cart/add-to-cart/{id}"})
	public String addToCart(Model model, 
			@PathVariable("id") int id) {
		User user = (User) session.getAttribute("user");
		Product pro = pdao.findById(id);
		//String userId=request.getUserPrincipal().getName();
		//Assign current logged in user with the unique only cartID that user owned
		Cart findCartByUser = cdao.findCartByUserId(user.getId());
		int quantity=1;
		List<CartItem> searchPro = itemdao.findSameCartIdAndProductInCartItem(findCartByUser.getId(), id);
		 if(itemdao.findCartIdInCartItem(findCartByUser.getId())!=null) {
			 if(searchPro.size()<=0) {
				 CartItem item= new CartItem(quantity,findCartByUser,pro);
				 itemdao.create(item);
			 } else {
				 
					for(CartItem items:searchPro) {
					  if(!searchPro.isEmpty() && findCartByUser.getId()==items.getCart().getId() ) {					
							if(items.getProduct().getId()==id ) {
								items.setQuantity(items.getQuantity()+quantity);
								itemdao.update(items);
							}
						} 
			 }
				
			}
		 }
		return "redirect:/home"; 
		
	}
	/*
	@RequestMapping(value={"/cart/update-to-cart","/cart/update-to-cart/{id}"})
	public String updateToCart(Model model, 
			@PathVariable("id") int id) {
		User user = (User) session.getAttribute("user");
		Product pro = pdao.findById(id);
		//String userId=request.getUserPrincipal().getName();
		Cart findCartByUser = cdao.findCartByUserId(user.getId());
		int quantity=1;
		//CartItem item= new CartItem(quantity,findCartByUser,pro);
		//itemdao.create(item);
		if( itemdao.findCartIdInCartItem(findCartByUser.getId())!=null) {
			List<CartItem> searchPro = itemdao.findSameProductInCartItem(id);
			for(CartItem items:searchPro) {
				if(items.getProduct().getId()==id ) {
					items.setQuantity(items.getQuantity()+quantity);
					itemdao.update(items);
					model.addAttribute("message", "Thêm hàng vào giỏ thành công!");
				}
			}
		}
		return "redirect:/home"; 
	}
	*/
	/*
	@RequestMapping("/cart/edit-info/{id}")
	public String updateCartInfoForm(Model model, @PathVariable("id") Integer id) {
		//User user = (User)session.getAttribute("user");
		Cart entity = cdao.findById(id);
		model.addAttribute("entity",entity);
		model.addAttribute("list",cdao.findAll());
		//cdao.update(entity);
		//model.addAttribute("message", "Cập nhật thành công!");
		return "cart/cartitem-list-by-user";
	}
	*/
	//Cập nhật thông tin giao hàng
	@GetMapping("/cart/update-info")
	public String login(Model model) {
		Cookie ccid = cookie.read("cartId");
		Cookie acid = cookie.read("shipAddress");
		Cookie cuid = cookie.read("userId");
		if (ccid != null) { 
			String cid = ccid.getValue();
			String aid = acid.getValue();
			String uid = cuid.getValue();
			
			model.addAttribute("cid",cid);
			model.addAttribute("aid", aid);
			model.addAttribute("uid", uid);
		
		}
		return "cart/cartitem-list-by-user";
	}
	
	@PostMapping("/cart/update-info/{id}")
	public String update(Model model,@PathVariable("id") int id,
			@RequestParam("shipAddress") String shipAddress) {
		//User user = (User) session.getAttribute("user");
		Cart updateCart = cdao.findById(id);
		if(updateCart!=null) {
			updateCart.setId(updateCart.getId());
			updateCart.setShipAddress(shipAddress);
			updateCart.setUser(updateCart.getUser());
			cdao.update(updateCart);
			model.addAttribute("message", "Cập nhật thành công!");
		}
		
		
		return "redirect:/cart/view-cart-by-userid/"+updateCart.getUser().getId();
	}
	
	//Xóa hàng trong giỏ hàng
	@RequestMapping(value = {"/cart/delete","/cart/delete/{id}"})
	public String delete(RedirectAttributes model, 
			@RequestParam(value="id", required = false) Integer id1, 
			@PathVariable(value="id", required = false) Integer id2) {
		User user = (User) session.getAttribute("user");
		if(id1 != null) {
			itemdao.delete(id1);
		}else {
			itemdao.delete(id2);
		}
		
		model.addAttribute("message", "Xóa thành công!");
		return "redirect:redirect:/cart/view-cart-by-userid/"+user.getId();
	}
	//Chỉnh sửa số lượng hàng mua trong giỏ hàng
	@GetMapping("/cart/item/update")
	public String updateItem(Model model) {
		Cookie quantity = cookie.read("quantity");
	
		if (quantity != null) { 
			String qid = quantity.getValue();
			model.addAttribute("${i.quantity}",qid);

		}
		return "cart/cartitem-list-by-user";
	}
	
	@PostMapping("/cart/item/update/{id}")
	public String updateItem(Model model,@PathVariable("id") int id,
			@RequestParam("quantity") int quantity) {
		User user = (User) session.getAttribute("user");
		CartItem updateItem = itemdao.findById(id);
		if(updateItem!=null) {
			updateItem.setId(updateItem.getId());
			updateItem.setQuantity(quantity);
			updateItem.setCart(updateItem.getCart());
			updateItem.setProduct(updateItem.getProduct());
			itemdao.update(updateItem);
			model.addAttribute("message", "Cập nhật thành công!");
		}
		
		
		return "redirect:/cart/view-cart-by-userid/"+user.getId();
	}
	
}
