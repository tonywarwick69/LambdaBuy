package com.lambdabuy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lambdabuy.dao.ReportDAO;

@Controller
public class InventoryReport {
	@Autowired
	ReportDAO dao;
	
	@RequestMapping("/admin/inventory/index")
	public String index(Model model) {
		model.addAttribute("data", dao.inventory());
		return "admin/report/inventory";
	}
	///admin/revenue/time
	@RequestMapping("/admin/revenue/time")
	public String revenueByTime(Model model) {
		//model.addAttribute("data", dao.revenueByCategory());
		return "admin/report/revenue-by-time";
	}
	
	//revenueBySupplierMY
	@RequestMapping("/admin/revenue/revenueBySupplierMY/{month}/{year}")
	public String revenueBySupplierMY(Model model,@PathVariable("month") int month, @PathVariable("year") int year) {
		model.addAttribute("month",month);
		model.addAttribute("year",year);
		model.addAttribute("data", dao.revenueBySupplierMY(month,year));
		return "admin/report/revenue-by-supplierMY";
	}
	//revenueByMonthYearX
	@RequestMapping("/admin/revenue/revenueByMonthYearX/{month}/{year}")
	public String revenueByMonthYearX(Model model,@PathVariable("month") int month, @PathVariable("year") int year) {
		model.addAttribute("month",month);
		model.addAttribute("year",year);
		model.addAttribute("data", dao.revenueByMonthYearX(month,year));
		return "admin/report/revenue-by-MonthYearX";
	}
	
	//revenueByYearX
		@RequestMapping("/admin/revenue/revenueByYearX/{year}")
		public String revenueByMonthYearX(Model model, @PathVariable("year") int year) {
			model.addAttribute("year",year);
			model.addAttribute("data", dao.revenueByYearX(year));
			return "admin/report/revenue-by-YearX";
		}
		
	
	@RequestMapping("/admin/revenue/category")
	public String revenueByCategory(Model model) {
		model.addAttribute("data", dao.revenueByCategory());
		return "admin/report/revenue";
	}
	
	@RequestMapping("/admin/revenue/customer")
	public String revenueByCustomer(Model model) {
		model.addAttribute("data", dao.revenueByCustomer());
		return "admin/report/revenue-by-customer";
	}
	
	@RequestMapping("/admin/revenue/year")
	public String revenueByYear(Model model) {
		model.addAttribute("data", dao.revenueByYear());
		return "admin/report/revenue-by-year";
	}
	
	@RequestMapping("/admin/revenue/month")
	public String revenueByMonth(Model model) {
		model.addAttribute("data", dao.revenueByMonth());
		return "admin/report/revenue-by-month";
	}
	
	@RequestMapping("/admin/revenue/revenueByCategoryId/{id}")
	public String revenueByCategoryId(Model model,@PathVariable("id") Integer id) {
		model.addAttribute("categoryId",id);
		model.addAttribute("data", dao.revenueByCategoryId(id));
		return "admin/report/revenue-by-categoryId";
	}
	
	//revenueByCustomerId
	@RequestMapping("/admin/revenue/revenueByCustomerId/{id}")
	public String revenueByCustomerId(Model model,@PathVariable("id") String userid) {
		model.addAttribute("userId",userid);
		model.addAttribute("data", dao.revenueByCustomerId(userid));
		return "admin/report/revenue-by-customerId";
	}
	
	//revenueBySupplierId
	@RequestMapping("/admin/revenue/revenueBySupplierId/{id}")
	public String revenueBySupplierId(Model model,@PathVariable("id") Integer id) {
		model.addAttribute("supplierId",id);
		model.addAttribute("data", dao.revenueBySupplierId(id));
		return "admin/report/revenue-by-supplierId";
	}
	
	//revenueByBrandId
	@RequestMapping("/admin/revenue/revenueByBrandId/{id}")
	public String revenueByBrandId(Model model,@PathVariable("id") Integer id) {
		model.addAttribute("brandId",id);
		model.addAttribute("data", dao.revenueByBrandId(id));
		return "admin/report/revenue-by-brandId";
	}
	
	@RequestMapping("/admin/revenue/supplier")
	public String revenueBySupplier(Model model) {
		model.addAttribute("data", dao.revenueBySupplier());
		return "admin/report/revenue-by-supplier";
	}
	
	@RequestMapping("/admin/inventory/productBySupplier/{sid}")
	public String productBySupplier(Model model, @PathVariable("sid") Integer supplierId) {
		model.addAttribute("supplierId",supplierId);
		model.addAttribute("data", dao.productBySupplier(supplierId));
		return "admin/report/productBySupplierId";
	}
	
	@RequestMapping("/admin/inventory/productByBrand/{bid}")
	public String productByBrand(Model model, @PathVariable("bid") Integer brandid) {
		model.addAttribute("brandId",brandid);
		model.addAttribute("data", dao.productByBrand(brandid));
		return "admin/report/productByBrand";
	}
	
	@RequestMapping("/admin/inventory/productByCategory/{cid}")
	public String productByCategory(Model model, @PathVariable("cid") Integer categoryId) {
		model.addAttribute("categoryId",categoryId);
		model.addAttribute("data", dao.productByCategory(categoryId));
		return "admin/report/productByCategory";
	}
	
	
}
