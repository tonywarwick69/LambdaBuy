package com.lambdabuy.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lambdabuy.entity.Brand;
@Transactional
@Repository
public class BrandDAOImpl implements BrandDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public Brand findById(int id) {
		// TODO Auto-generated method stub
		Session session=factory.getCurrentSession();
		Brand entity = session.find(Brand.class, id);
		return entity;
	}

	@Override
	public List<Brand> findAll() {
		// TODO Auto-generated method stub
		String hql="FROM Brand";
		Session session=factory.getCurrentSession();
		TypedQuery<Brand> query=session.createQuery(hql,Brand.class);
		List<Brand> list=query.getResultList();
		return list;
	}

	@Override
	public Brand create(Brand entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(entity);
		return null;
	}

	@Override
	public void update(Brand entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Brand delete(Integer id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Brand entity = session.find(Brand.class, id);
		session.delete(entity);
		return entity;
	}

}
