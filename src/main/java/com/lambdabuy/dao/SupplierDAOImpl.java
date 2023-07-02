package com.lambdabuy.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.lambdabuy.entity.Supplier;

@Transactional
@Repository
public class SupplierDAOImpl implements SupplierDAO{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Supplier findById(int id) {
		// TODO Auto-generated method stub
		Session session= factory.getCurrentSession();
		Supplier entity = session.find(Supplier.class, id);
		return entity;
	}

	@Override
	public List<Supplier> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM Supplier";
		Session session = factory.getCurrentSession();
		TypedQuery<Supplier> query = session.createQuery(hql,Supplier.class);
		List<Supplier> list = query.getResultList();
		return list;
	}

	@Override
	public Supplier create(Supplier entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return null;
	}

	@Override
	public void update(Supplier entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Supplier delete(Integer id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Supplier entity=session.find(Supplier.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public Supplier findSupplierByUserId(String userId) {
		// TODO Auto-generated method stub
		String hql="FROM Supplier s where s.user.id=:sid";
		Session session=factory.getCurrentSession();
		TypedQuery<Supplier> query= session.createQuery(hql,Supplier.class);
		query.setParameter("sid", userId);
		Supplier result = query.getSingleResult();
		return result;
	}

}
