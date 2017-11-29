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
import com.sdu.entity.Project;

public class ProjectDaoImpl {
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}  
	
	
	public boolean saveProject(Project project){
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(project);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}
		return true;
	}
	public Project getProjectById(int projectid){
	
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
	
		//hql没有分号结尾
		List<Project> list = null;
		try {
			String hql = "from Project p where p.p_id = '"+projectid+"'";
			System.out.println("hql:"+hql);
			Query query = session.createQuery(hql);
			System.out.println("hql:"+hql);
			list = query.list();
			tx.commit();
			System.out.println("查询成功");
		} catch (HibernateException e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
		return list.get(0);
	}
	public List<Project> getProjectByAdminId(int adminId){
		//System.out.println("进入projectDao");
		List<Project> list = null;
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			String sql = "select * from project where project.admin_proid = '"+adminId+"';";
			list = session.createSQLQuery(sql).addEntity(Project.class).list();
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
	//	System.out.println("结束projectDao");
		return list;
	}


	public List<Object> getProjectsByAdminId(int adminId, int offset,
			int pageSize) {
		List<Object> list = null;
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			String sql = "select project.p_id,project.p_name,project.p_describe,project.p_createTime,admin.name from project,admin where project.admin_proid = admin.ID and project.admin_proid = '"+adminId+"' limit "+offset+","+pageSize+";";
//			System.out.println("sql:"+sql);
			list = session.createSQLQuery(sql).list();
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return list;
	}


	public int getProjectCountByAdminId(int adminId) {
		int count = 0;
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			String sql = "select count(*) from project where project.admin_proid = '"+adminId+"';";
			count = ((Number)session.createSQLQuery(sql).uniqueResult()).intValue();
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return count;
	}


	public boolean delProject(int id) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			Project project = (Project) session.get(Project.class, id);
			session.delete(project);
			tx.commit();
			result = true;
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return result;
	}


	public boolean delProjects(String ids) {
		String  id[] = ids.split(",");
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			for(int i = 0;i<id.length;i++){
				Project project = (Project) session.get(Project.class,Integer.parseInt(id[i]));
				session.delete(project);
			}
			tx.commit();
		}catch(Exception e){
			tx.commit();
			e.printStackTrace();
		}
		return true;
	}
}
