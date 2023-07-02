package com.lambdabuy.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lambdabuy.entity.Cart;

@Transactional
@Repository
public class CartDAOImpl implements CartDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public Cart findById(int id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Cart entity = session.find(Cart.class, id);
		return entity;
	}

	@Override
	public List<Cart> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM Cart";
		Session session=factory.getCurrentSession();
		TypedQuery<Cart> query=session.createQuery(hql,Cart.class);
		List<Cart> list=query.getResultList();
		return list;
	}

	@Override
	public Cart create(Cart entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return null;
	}

	@Override
	public void update(Cart entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Cart delete(Integer id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Cart entity = session.find(Cart.class, id);
		return entity;
	}

	@Override
	public Cart findCartByUserId(String userId) {
		// TODO Auto-generated method stub
		String hql="FROM Cart c where c.user.id=:uid";
		Session session = factory.getCurrentSession();
		TypedQuery<Cart> query= session.createQuery(hql,Cart.class);
		query.setParameter("uid", userId);
		Cart result=query.getSingleResult();
		return result;
	}

}
