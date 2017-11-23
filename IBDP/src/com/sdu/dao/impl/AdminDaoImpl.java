package com.sdu.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import com.sdu.entity.Admin;
import com.sdu.entity.Work;

public class AdminDaoImpl {
	SessionFactory sessionFactory;

	   public void setSessionFactory(SessionFactory sessionFactory) {
		   this.sessionFactory = sessionFactory;
	   }
	  
	   public List<Admin> select(String username,String password)
	   {
		   Session session=sessionFactory.getCurrentSession();
		   String hql="select * from admin where name='"+username+"' and password='"+password+"'";
		   Query query=session.createQuery(hql);
		   List<Admin> list=query.list();
		   
		   return list;
	   }
	   public Admin getById(String adminId){
		   List<Admin> list ;
		   Session session = sessionFactory.getCurrentSession();
		   Transaction tx = session.beginTransaction();
		   String hql = "from Admin admin where admin.id ='"+adminId+"'";
		   Query query = session.createQuery(hql);
		   list = query.list();
		   tx.commit();
		   Admin admin = list.get(0);
		   System.out.println("admin.name"+admin.getName());
		   return admin;
	   }
	   public List<Admin> search(Admin condition)
	   {
		   List<Admin> list =null;
		   //通过sessionFactory来获得session
		   Session session=sessionFactory.getCurrentSession();
		   Transaction tx =session.beginTransaction();
		   try {
			//创建criteria对象
			   Criteria c =session.createCriteria(Admin.class);
			   //使用Example 工具类创建示例对象example作为查询条件
			   Example example=Example.create(condition);
			   c.add(example);
			   list=c.list();
			   tx.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			tx.rollback();
		}
		   return list;
	   }
	   public boolean update(Admin condition)
	   {
		   Session session=sessionFactory.getCurrentSession();
		   Transaction transaction = session.beginTransaction();
		   try {
				session.update(condition);
				transaction.commit();
				 session.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				transaction.rollback();
			}
		return true;
	   }
	   public boolean insert(Admin admin)
	   {
		   Session session=sessionFactory.getCurrentSession();
		   Transaction transaction = session.beginTransaction();
		   try {
				session.save(admin);
				transaction.commit();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				transaction.rollback();
			}
		return true;
	   }
	   public boolean remove(Admin condition)
	   {
		   Session session=sessionFactory.getCurrentSession();
		   Transaction transaction = session.beginTransaction();
		   try {
			session.delete(condition);
			transaction.commit();
			session.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				transaction.rollback();
			}
			   return true;
		  
	   }
}
