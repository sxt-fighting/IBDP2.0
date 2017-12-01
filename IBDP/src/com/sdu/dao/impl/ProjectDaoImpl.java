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
		Project project = null;
		try {
			project = (Project) session.get(Project.class,projectid);
			tx.commit();
		} catch (HibernateException e) {
			tx.rollback();
			e.printStackTrace();
		}
		return project;
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
/*			System.out.println("project.name:"+project.getP_name());*/
			session.delete(project);
			tx.commit();
			result = true;
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return result;
	}


	public boolean delProjects(int[] ids) {
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			for(int i = 0;i<ids.length;i++){
				Project project = (Project) session.get(Project.class,ids[i]);
//				System.out.println("...........");
				if(project != null){
//					System.out.println("i被删除"+ids[i]);
					session.delete(project);
				}
			}
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return true;
	}
	public List<Integer> getModelIdsByProjectIds(int[] ids){
		List<Integer> Ids = null;
		Session session  = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			String sql = "select project.p_modelid from project where project.p_id in(";
			for(int i = 0;i<ids.length-1;i++){
				sql = sql +ids[i]+",";
			}
			sql = sql+ids[ids.length-1]+");";
			Ids = session.createSQLQuery(sql).list();
			tx.commit();
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return Ids;
	}
}
