package com.lambdabuy.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lambdabuy.entity.Category;
import com.lambdabuy.entity.OrderDetail;
import com.lambdabuy.entity.Product;



@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO{

	@Autowired
	SessionFactory factory;
	
	@Override
	public Product findById(Integer id) {
		Session session=factory.getCurrentSession();
		Product entity=session.find(Product.class, id);
		return entity;
	}

	@Override
	public List<Product> findAll() {
		String hql="FROM Product";
		Session session=factory.getCurrentSession();
		TypedQuery<Product> query=session.createQuery(hql,Product.class);
		List<Product> list=query.getResultList();
		return list;
	}

	@Override
	public Product create(Product entity) {
		Session session=factory.getCurrentSession();
		session.save(entity);
		return null;
	}

	@Override
	public void update(Product entity) {
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}
	

	@Override
	public Product delete(Integer id) {
		Session session=factory.getCurrentSession();
		Product entity=session.find(Product.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public List<Product> findByCategoryId(Integer categoryId) {
		String hql="FROM Product p WHERE p.category.id=:cid";
		Session session=factory.getCurrentSession();
		TypedQuery<Product> query=session.createQuery(hql,Product.class);
		query.setParameter("cid", categoryId);
		List<Product> list=query.getResultList();
		return list;
	}

	@Override
	public List<Product> findByKeywords(String keywords) {
		String hql="FROM Product p WHERE p.name LIKE :kw OR p.category.name LIKE :kw OR p.category.name LIKE :kw OR p.brand.name LIKE :kw "
				+ "OR p.supplier.name LIKE :kw ";
		Session session=factory.getCurrentSession();
		TypedQuery<Product> query=session.createQuery(hql,Product.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<Product> list=query.getResultList();
		return list;
	}

	@Override
	public List<Product> findByIds(String ids) {
		String hql="FROM Product p WHERE p.id IN ("+ids+")";

		Session session=factory.getCurrentSession();
		TypedQuery<Product> query=session.createQuery(hql,Product.class);
		List<Product> list=query.getResultList();
		return list;
	}

	@Override
	public List<Product> findBySpecial(Integer id) {
		Session session=factory.getCurrentSession();
		String hql="FROM Product p";
		TypedQuery<Product> query=session.createQuery(hql,Product.class);
		switch (id) {
			case 0://mới
				hql="FROM Product p ORDER BY p.productDate DESC";
				break;
			
			case 1://bán chạy
				hql="FROM Product p ORDER BY size(p.orderDetails) DESC";
				break;
				
			case 2://xem nhiều
				hql="FROM Product p ORDER BY p.viewCount DESC";
				break;
				
			case 3://giảm giá
				hql="FROM Product p ORDER BY p.discount DESC";
				break;
				
			case 4://dac biet
				hql="FROM Product p WHERE p.special=true ORDER BY p.productDate DESC";
				break;
		}
		query=session.createQuery(hql,Product.class);
		
		List<Product> list=query.getResultList();
		return list;
	}

	@Override
	public List<Product> findBySupplierId(int supplierId) {
		String hql="FROM Product p WHERE p.supplier.id=:sid";
		Session session=factory.getCurrentSession();
		TypedQuery<Product> query=session.createQuery(hql,Product.class);
		query.setParameter("sid", supplierId);
		List<Product> list=query.getResultList();
		return list;
	}

	@Override
	public List<Product> findByBrandId(int brandId) {
		String hql="FROM Product p WHERE p.brand.id=:bid";
		Session session=factory.getCurrentSession();
		TypedQuery<Product> query=session.createQuery(hql,Product.class);
		query.setParameter("bid", brandId);
		List<Product> list=query.getResultList();
		return list;
	}

	@Override
	public void updateQuantity(Product entity) {
		// TODO Auto-generated method stub
		
	}
/*
	@Override
	public List<Product> findByNewProduct() {
		// TODO Auto-generated method stub
		String hql="FROM Product p ORDER BY p.productDate DESC";
		Session session=factory.getCurrentSession();
		TypedQuery<Product> query=session.createQuery(hql,Product.class);
		query.setParameter("bid", brandId);
		List<Product> list=query.getResultList();
		return list;
	}
	
*/
/*
	@Override
	public List<Product> listProductByCategoryName() {
		// TODO Auto-generated method stub
		String hql="SELECT (c.name) AS Category_Name,(p.name) AS Product_Name,p.quantity FROM QLBH.Products p JOIN QLBH.Categories c\r\n"
				+ "ON p.categoryId=c.id\r\n"
				+ "WHERE c.name LIKE '%ĐIỆN THOẠI%' ";
		return null;
	}
	*/
}
