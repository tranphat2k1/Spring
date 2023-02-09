package com.finalproject.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.entity.UserRole;

@Transactional
@Repository
public class UserRoleDAOImpl implements UserRoleDAO{

	@Autowired
	SessionFactory factory;
	
	@Override
	public UserRole findByID(Integer id) {
		Session session = factory.getCurrentSession();
		UserRole entity = session.find(UserRole.class, id);
		return entity;
	}

	@Override
	public List<UserRole> findAll() {
		String hql = "FROM UserRole";
		Session session = factory.getCurrentSession();
		TypedQuery<UserRole> query = session.createQuery(hql, UserRole.class);
		List<UserRole> list = query.getResultList();
		return list;
	}

	@Override
	public UserRole create(UserRole entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(UserRole entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public UserRole delete(Integer id) {
		Session session = factory.getCurrentSession();
		UserRole entity = session.find(UserRole.class, id);
		session.delete(entity);
		return entity;
	}

}
