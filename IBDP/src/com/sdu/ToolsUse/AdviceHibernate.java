package com.sdu.ToolsUse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.sdu.entity.Advice;
import com.sdu.entity.DataFile;

public class AdviceHibernate {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public static void CreateAdvice(Advice advice)
	{
		SessionFactory sessionFactory=null;
		Session session=null;
		Transaction transaction=null;
		int d_id=-1;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
			
			session = sessionFactory.openSession();
			 transaction=session.beginTransaction();
			session.save(advice);
			transaction.commit();
		   
		} catch (Exception e) {
			// TODO Auto-generated catch block
			transaction.rollback();
			e.printStackTrace();
		}finally{
		session.close();
		sessionFactory.close();
	}
		
	}
}
