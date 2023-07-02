package com.lambdabuy.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lambdabuy.entity.User;

@Transactional
@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	SessionFactory factory;
	
	@Override
	public User findById(String id) {
		Session session=factory.getCurrentSession();
		User entity=session.find(User.class, id);
		return entity;
	}

	@Override
	public List<User> findAll() {
		String hql="FROM User";
		Session session=factory.getCurrentSession();
		TypedQuery<User> query=session.createQuery(hql,User.class);
		List<User> list=query.getResultList();
		return list;
	}

	@Override
	public User create(User entity) {
		Session session=factory.getCurrentSession();
		session.save(entity);
		return null;
	}

	@Override
	public void update(User entity) {
		Session session=factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public User delete(String id) {
		Session session=factory.getCurrentSession();
		User entity=session.find(User.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public long getPageCount(int pageSize) {
		String hql="SELECT count(c) FROM User c";
		Session session=factory.getCurrentSession();
		TypedQuery<Long> query=session.createQuery(hql,Long.class);
		Long rowCount=query.getSingleResult();
		long pageCount= (long) Math.ceil(1.0*rowCount/pageSize);
		return pageCount;
	}

	@Override
	public List<User> getPage(int pageNo, int pageSize) {
		String hql="FROM User";
		Session session=factory.getCurrentSession();
		TypedQuery<User> query=session.createQuery(hql,User.class);
		query.setFirstResult(pageNo * pageSize);
		query.setMaxResults(pageSize);
		List<User> list=query.getResultList();
		return list;
	}

	
	

}
