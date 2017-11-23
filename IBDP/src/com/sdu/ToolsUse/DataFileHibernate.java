package com.sdu.ToolsUse;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.sdu.entity.DataFile;

public class DataFileHibernate {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	//	DataFile dataFile=GetDataFileByID(34);
	//	System.out.println(dataFile.getD_name());
		try {
			Class cls=Class.forName("com.sdu.action.KmeansAction");
		     
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     	
	}
	public static int saveDataFile(DataFile dataFile)
	{
		SessionFactory sessionFactory=null;
		Session session=null;
		Transaction transaction=null;
		int d_id=-1;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
			
			session = sessionFactory.openSession();
			 transaction=session.beginTransaction();
			session.save(dataFile);
			transaction.commit();
		    d_id=dataFile.getD_id();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			transaction.rollback();
			e.printStackTrace();
		}finally{
		session.close();
		sessionFactory.close();
	}
		if(d_id!=-1)
			return d_id;
		return 0;
	}
	public static DataFile GetDataFileByID(int id)
	{
		SessionFactory sessionFactory=null;
		Session session=null;
		Transaction transaction=null;
		DataFile dataFile=null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
			
			session = sessionFactory.openSession();
			 transaction=session.beginTransaction();
			dataFile=(DataFile) session.get(DataFile.class, id);
			transaction.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			transaction.rollback();
			e.printStackTrace();
		}finally{
		session.close();
		sessionFactory.close();
	}
		return dataFile;
	}
}
