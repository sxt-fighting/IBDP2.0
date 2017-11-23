package com.sdu.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.sdu.entity.Admin;
import com.sdu.entity.Advice;

public class AdviceDaoImpl{
	SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public List<Advice> getNotReadById(int userId){
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		List<Advice> list = null;
		try{
			String hql = "from Advice ad where ad.advice_admin.id='"+userId+"'";
			Query query = session.createQuery(hql);
			list = query.list();
			tx.commit();
		}catch(Exception e){
			System.out.println("hql语句出错");
			tx.rollback();
			e.printStackTrace();
		}
		return list;
	}
	public boolean markRead(int a_id){
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			String hql = "update Advice advice set advice.a_isread = 'True' ";
			session.createQuery(hql).executeUpdate();
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean addAdvice(Advice advice){
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			session.save(advice);
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
}
