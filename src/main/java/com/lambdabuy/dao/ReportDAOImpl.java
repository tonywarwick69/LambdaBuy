package com.lambdabuy.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lambdabuy.entity.Order;

@Transactional
@Repository
public class ReportDAOImpl implements ReportDAO {
	
	@Autowired
	SessionFactory factory;
	
	
	
	@Override
	public List<Object[]> inventory() {
		String hql = "SELECT p.category.name,SUM(p.quantity),SUM(p.unitPrice*p.quantity),MIN(p.unitPrice),MAX(p.unitPrice),AVG(p.unitPrice) FROM Product p GROUP BY p.category.name";

		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		List<Object[]> list=query.getResultList();
		return list;

	}

	@Override
	public List<Object[]> revenueByCategory() {
		String hql = "SELECT d.product.category.name,SUM(d.quantity),SUM(d.unitPrice*d.quantity),MIN(d.unitPrice),MAX(d.unitPrice),AVG(d.unitPrice) FROM OrderDetail d GROUP BY d.product.category.name";

		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		List<Object[]> list=query.getResultList();
		return list;

	}

	@Override
	public List<Object[]> revenueByCustomer() {
		String hql = "SELECT d.order.user.id,SUM(d.quantity),SUM(d.unitPrice*d.quantity),MIN(d.unitPrice),MAX(d.unitPrice),AVG(d.unitPrice) FROM OrderDetail d GROUP BY d.order.user.id";

		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByYear() {
		String hql = "SELECT YEAR(d.order.orderDate),SUM(d.quantity),SUM(d.unitPrice*d.quantity),MIN(d.unitPrice),MAX(d.unitPrice),AVG(d.unitPrice) FROM OrderDetail d GROUP BY YEAR(d.order.orderDate) ORDER BY YEAR(d.order.orderDate) DESC";

		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}


	@Override
	public List<Object[]> revenueByMonth() {
		String hql = "SELECT MONTH(d.order.orderDate),YEAR(d.order.orderDate),SUM(d.quantity),SUM(d.unitPrice*d.quantity),MIN(d.unitPrice),MAX(d.unitPrice),AVG(d.unitPrice) FROM OrderDetail d "
				+ "GROUP BY MONTH(d.order.orderDate), YEAR(d.order.orderDate) ORDER BY MONTH(d.order.orderDate),YEAR(d.order.orderDate) DESC";

		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}
	/*
	@Override
	public List<Object[]> listProductByCategory(Integer id) {
		// TODO Auto-generated method stub
		//(c.name) AS Category_Name,
		String hql="SELECT p.name,SUM(p.quantity) FROM Product p WHERE p.category.id =:pid GROUP BY p.name ";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("pid",id);
		List<Object[]> list=query.getResultList();
		return list;
	}
	*/

	@Override
	public List<Object[]> revenueBySupplier() {
		String hql = "SELECT p.supplier.name, SUM(o.amount) FROM OrderDetail d JOIN Order o "
				+ " ON d.order.id=o.id"
				+ " JOIN Product p"
				+ " ON d.product.id=p.id"
				+ " GROUP BY p.supplier.id";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> productBySupplier(Integer supplierId) {
		// TODO Auto-generated method stub
		String hql="SELECT p.name,SUM(p.quantity),p.unitPrice,p.discount FROM Product p WHERE p.supplier.id=:sid GROUP BY p.name ";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("sid", supplierId);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> productByBrand(Integer brandid) {
		// TODO Auto-generated method stub
		String hql="SELECT p.name,SUM(p.quantity),p.unitPrice,p.discount FROM Product p WHERE p.brand.id=:bid GROUP BY p.name ";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("bid", brandid);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> productByCategory(Integer categoryId) {
		// TODO Auto-generated method stub
		String hql="SELECT p.name,SUM(p.quantity),p.unitPrice,p.discount FROM Product p WHERE p.category.id=:cid GROUP BY p.name ";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("cid", categoryId);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByCategoryId(Integer id) {
		// TODO Auto-generated method stub
		String hql="SELECT p.name,SUM(d.quantity),SUM(o.amount),c.name"
				+ " FROM Order o JOIN OrderDetail d ON o.id=d.order.id"
				+ " JOIN Product p ON d.product.id=p.id"
				+ " JOIN Category c ON p.category.id=c.id"
				+ " WHERE c.id=:cid GROUP BY p.name";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("cid", id);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByCustomerId(String userId) {
		String hql="SELECT p.name,SUM(d.quantity),SUM(o.amount),u.fullname"
				+ " FROM User u JOIN Order o ON u.id=o.user.id"
				+ " JOIN OrderDetail d ON o.id=d.order.id"
				+ " JOIN Product p ON d.product.id=p.id"
				+ " WHERE u.id=:uid GROUP BY p.name";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("uid", userId);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueBySupplierId(Integer id) {
		// TODO Auto-generated method stub
		String hql="SELECT p.name,SUM(d.quantity),SUM(o.amount),s.name"
				+ " FROM Order o JOIN OrderDetail d ON o.id=d.order.id"
				+ " JOIN Product p ON d.product.id=p.id"
				+ " JOIN Supplier s ON p.supplier.id=s.id"
				+ " WHERE s.id=:sid GROUP BY p.name";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("sid", id);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByBrandId(Integer id) {
		// TODO Auto-generated method stub
		String hql="SELECT p.name,SUM(d.quantity),SUM(o.amount),b.name"
				+ " FROM Order o JOIN OrderDetail d ON o.id=d.order.id"
				+ " JOIN Product p ON d.product.id=p.id"
				+ " JOIN Brand b ON p.brand.id=b.id"
				+ " WHERE b.id=:bid GROUP BY p.name";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("bid", id);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueBySupplierMY( int month, int year) {
		// TODO Auto-generated method stub
		String hql="SELECT s.name,SUM(o.amount),SUM(d.quantity)"
				+ " FROM Order o JOIN OrderDetail d ON o.id=d.order.id"
				+ " JOIN Product p ON d.product.id=p.id"
				+ " JOIN Supplier s ON p.supplier.id=s.id"
				+ " WHERE Month(o.orderDate)=:month AND Year(o.orderDate)=:year"
				+ " GROUP BY s.name";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("month", month);
		query.setParameter("year", year);
		List<Object[]> list=query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByMonthYearX(int month, int year) {
		// TODO Auto-generated method stub
				String hql="SELECT Week(o.orderDate),SUM(o.amount),SUM(d.quantity)"
						+ " FROM Order o JOIN OrderDetail d ON o.id=d.order.id"
						+ " JOIN Product p ON d.product.id=p.id"
						+ " WHERE Month(o.orderDate)=:month AND Year(o.orderDate)=:year"
						+ " GROUP BY Week(o.orderDate)";
				Session session=factory.getCurrentSession();
				TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
				query.setParameter("month", month);
				query.setParameter("year", year);
				List<Object[]> list=query.getResultList();
				return list;
	}

	@Override
	public List<Object[]> revenueByYearX(int year) {
		// TODO Auto-generated method stub
		String hql="SELECT Month(o.orderDate),SUM(o.amount),SUM(d.quantity)"
				+ " FROM Order o JOIN OrderDetail d ON o.id=d.order.id"
				+ " JOIN Product p ON d.product.id=p.id"
				+ " WHERE Year(o.orderDate)=:year"
				+ " GROUP BY Month(o.orderDate)";
		Session session=factory.getCurrentSession();
		TypedQuery<Object[]> query=session.createQuery(hql,Object[].class);
		query.setParameter("year", year);
		List<Object[]> list=query.getResultList();
		return list;
	}
	

}
