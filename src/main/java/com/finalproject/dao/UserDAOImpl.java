package com.finalproject.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.entity.User;

@Transactional
@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	SessionFactory factory;
	
	@Override
	public User findByID(Integer id) {
		Session session = factory.getCurrentSession();
		User entity = session.find(User.class, id);
		return entity;
	}

	@Override
	public List<User> findAll() {
		String hql = "FROM User";
		Session session = factory.getCurrentSession();
		TypedQuery<User> query = session.createQuery(hql, User.class);
		List<User> list = query.getResultList();
		return list;
	}

	@Override
	public User create(User entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(User entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public User delete(Integer id) {
		Session session = factory.getCurrentSession();
		User entity = session.find(User.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public User findByEmail(String email) {
		String hql = "FROM User u WHERE u.email LIKE :email";
		Session session = factory.getCurrentSession();
		TypedQuery<User> query = session.createQuery(hql, User.class);
		query.setParameter("email", email);
		User user = query.getResultStream().findFirst().orElse(null);
		return user;
	}

}
