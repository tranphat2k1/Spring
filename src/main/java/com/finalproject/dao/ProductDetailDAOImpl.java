package com.finalproject.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.entity.ProductDetail;

@Transactional
@Repository
public class ProductDetailDAOImpl implements ProductDetailDAO{

	@Autowired
	SessionFactory factory;
	
	@Override
	public ProductDetail findByID(Integer id) {
		Session session = factory.getCurrentSession();
		ProductDetail entity = session.find(ProductDetail.class, id);
		return entity;
	}

	@Override
	public List<ProductDetail> findAll() {
		String hql = "FROM ProductDetail";
		Session session = factory.getCurrentSession();
		TypedQuery<ProductDetail> query = session.createQuery(hql, ProductDetail.class);
		List<ProductDetail> list = query.getResultList();
		return list;
	}

	@Override
	public ProductDetail create(ProductDetail entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(ProductDetail entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public ProductDetail delete(Integer id) {
		Session session = factory.getCurrentSession();
		ProductDetail entity = session.find(ProductDetail.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public ProductDetail findByProductID(Integer productID, Integer size) {
		String hql = "FROM ProductDetail pd WHERE pd.product.id=:pid AND pd.size = :size";
		Session session = factory.getCurrentSession();
		TypedQuery<ProductDetail> query = session.createQuery(hql, ProductDetail.class);
		query.setParameter("pid", productID);
		query.setParameter("size", size);
		ProductDetail pd = query.getSingleResult();
		return pd;
	}

	@Override
	public List<ProductDetail> findByProductID(Integer id) {
		String hql = "FROM ProductDetail pd WHERE pd.product.id=:pid";
		Session session = factory.getCurrentSession();
		TypedQuery<ProductDetail> query = session.createQuery(hql, ProductDetail.class);
		query.setParameter("pid", id);
		List<ProductDetail> list = query.getResultList();
		return list;
	}
	
}
