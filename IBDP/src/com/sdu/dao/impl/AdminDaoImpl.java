package com.sdu.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.sdu.entity.Admin;

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
		  // System.out.println("admin.name"+admin.getName());
		   return admin;
	   }
	   public List<Admin> search(Admin condition)
	   {
		   List<Admin> list =null;
		   Session session=sessionFactory.getCurrentSession();
		   Transaction tx =session.beginTransaction();
		 //  System.out.println("isAdmin:"+condition.getIsAdmin());
		   try {			
			   String hql = "from Admin admin where admin.name = '"+condition.getName()+"' and admin.password = '"+condition.getPassword()+"' and admin.isAdmin = '"+condition.getIsAdmin()+"'";
			   System.out.println("hql:"+hql);
			   list = session.createQuery(hql).list();
			   tx.commit();
		} catch (Exception e) {
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
				e.printStackTrace();
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
				transaction.rollback();
			}
			   return true;
		  
	   }

	public List<Object> show(int id) {
		List<Object> list = null;
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			String sql = "select * from admin where ID ='"+id+"';";
			list=session.createSQLQuery(sql).list();
			//System.out.println("list++++++"+list);
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return list;
	}

	public List<Object> showAll(int userid) {
		List<Object> list = null;
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		String sql=null;
		try{			
			sql = "select * from admin where isAdmin ="+1+";";			
			list=session.createSQLQuery(sql).list();
			//System.out.println("list______"+list);
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return list;
	}

	public boolean delete(int id) {
		Session session =sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			String sql="delete from admin where ID="+id+";";
			session.createSQLQuery(sql).executeUpdate();
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void updateAdmin(Admin admin) {
		 Session session=sessionFactory.getCurrentSession();
		   Transaction transaction = session.beginTransaction();
		   try {
				session.update(admin);
				transaction.commit();
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();
			}
	}

	public boolean deleteUsers(String[] idArray) {
		for(int i = 0;i < idArray.length;i++){
			int id = Integer.parseInt(idArray[i]);
			//System.out.println("delID=="+id);
			Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			try {
				String sql="delete from admin where ID="+id+";";
				session.createSQLQuery(sql).executeUpdate();
				tx.commit();
			} catch (Exception e) {
				e.printStackTrace();
				tx.rollback();
				return false;
			}
		}
		return true;
	}

	public void upload(String path, int userid) {
		Session session =sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			//System.out.println("path===="+path);
			String sql = "update admin set imgName='"+path+"'where ID="+userid+";";
			session.createSQLQuery(sql).executeUpdate();
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			tx.rollback();
		}
		
	}
	
}
