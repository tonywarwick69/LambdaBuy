package com.lambdabuy.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.lambdabuy.entity.Cart;
import com.lambdabuy.entity.CartItem;

@Transactional
@Repository
public class CartItemDAOImpl implements CartItemDAO{
	@Autowired
	SessionFactory factory;

	@Override
	public CartItem findById(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		CartItem entity = session.find(CartItem.class, id);
		return entity;
	}

	@Override
	public List<CartItem> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM CartItem";
		Session session=factory.getCurrentSession();
		TypedQuery<CartItem> query = session.createQuery(hql,CartItem.class);
		List<CartItem> list =query.getResultList();
		return list;
	}

	@Override
	public CartItem create(CartItem entity) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		session.save(entity);
		return null;
	}

	@Override
	public void update(CartItem entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public CartItem delete(int id) {
		// TODO Auto-generated method stub
		Session session =factory.getCurrentSession();
		CartItem entity= session.find(CartItem.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public List<CartItem> findCartItemsByCartId(int id) {
		// TODO Auto-generated method stub
		String hql="FROM CartItem i where i.cart.id=:cid";
		Session session = factory.getCurrentSession();
		TypedQuery<CartItem> query= session.createQuery(hql,CartItem.class);
		query.setParameter("cid", id);
		List<CartItem> list=query.getResultList();
		return list;
	}

	@Override
	public List<CartItem> findSameCartIdAndProductInCartItem(int cartId,int productId) {
		// TODO Auto-generated method stub
		String hql="FROM CartItem i where i.cart.id=:cid AND i.product.id=:pid";
		Session session = factory.getCurrentSession();
		TypedQuery<CartItem> query= session.createQuery(hql,CartItem.class);
		query.setParameter("cid", cartId);
		query.setParameter("pid", productId);
		List<CartItem> result=query.getResultList();
		return result;
	}

	@Override
	public List<CartItem> findCartIdInCartItem(int cartId) {
		// TODO Auto-generated method stub
		String hql="FROM CartItem i where i.cart.id=:cid";
		Session session = factory.getCurrentSession();
		TypedQuery<CartItem> query= session.createQuery(hql,CartItem.class);
		query.setParameter("cid", cartId);
		List<CartItem> list=query.getResultList();
		return list;
	}


	

}
