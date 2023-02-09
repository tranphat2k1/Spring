package com.finalproject.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.entity.Brand;

@Transactional
@Repository
public class BrandDAOImpl implements BrandDAO{

	@Autowired
	SessionFactory factory;
	
	@Override
	public Brand findByID(Integer id) {
		Session session = factory.getCurrentSession();
		Brand entity = session.find(Brand.class, id);
		return entity;
	}

	@Override
	public List<Brand> findAll() {
		String hql = "FROM Brand";
		Session session = factory.getCurrentSession();
		TypedQuery<Brand> query = session.createQuery(hql, Brand.class);
		List<Brand> list = query.getResultList();
		return list;
	}

	@Override
	public Brand create(Brand entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Brand entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Brand delete(Integer id) {
		Session session = factory.getCurrentSession();
		Brand entity = session.find(Brand.class, id);
		session.delete(entity);
		return entity;
	}

}
