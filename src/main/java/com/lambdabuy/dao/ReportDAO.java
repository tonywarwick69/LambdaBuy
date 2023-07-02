package com.lambdabuy.dao;

import java.util.List;

public interface ReportDAO {
	public List<Object[]> inventory();
	public List<Object[]> revenueByCategory();
	public List<Object[]> revenueByCustomer();
	public List<Object[]> revenueByYear();
	public List<Object[]> revenueByMonth();
	//public List<Object[]> listProductByCategory(Integer id);
	public List<Object[]> revenueBySupplier();
	public List<Object[]> productBySupplier(Integer id);
	public List<Object[]> productByBrand(Integer id);
	public List<Object[]> productByCategory(Integer id);
	
	public List<Object[]> revenueByCategoryId(Integer id);
	public List<Object[]> revenueByCustomerId(String userId);
	public List<Object[]> revenueBySupplierId(Integer id);
	public List<Object[]> revenueByBrandId(Integer id);
	
	public List<Object[]> revenueBySupplierMY(int month,int year);
	public List<Object[]> revenueByMonthYearX(int month, int year);
	public List<Object[]> revenueByYearX(int year);

	
}
