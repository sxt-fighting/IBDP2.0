package com.sdu.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Model;

public class ModelDaoImpl {
	SessionFactory sessionFactory;
	 public ModelDaoImpl(){
		 
	 }

	 public void setSessionFactory(SessionFactory sessionFactory) {
		   this.sessionFactory = sessionFactory;
	 }
	 public boolean createModel(Model model){
		 Session session=sessionFactory.getCurrentSession();
		 Transaction transaction=session.beginTransaction();
		  try {
			  session.save(model);
			  transaction.commit();
			//  System.out.println("Dao中输出id"+model.getM_id());
		} catch (Exception e) {
			// TODO: handle exception
			transaction.rollback();
			e.printStackTrace();
			return false;
		}
		 return  true;
	 } 
	 public Model getModelById(int m_id){
		   // System.out.println("getModelByID:"+m_id);
		 	Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			//hql没有分号结尾
			List<Model> list = null;
			try {
				String hql = "from Model model where model.m_id = '"+m_id+"'";
				Query query = session.createQuery(hql);
				list = query.list();
			//	System.out.println("list size="+list.size());
				tx.commit();
			} catch (HibernateException e) {
				tx.rollback();
				e.printStackTrace();
			}
	
			return list.get(0);
	 }
	 
}
