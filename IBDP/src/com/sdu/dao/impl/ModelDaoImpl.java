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
			  session.saveOrUpdate(model);
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
			Model model = null;
			//hql没有分号结尾
			try {
				 model = (Model) session.get(Model.class, m_id);
			//	System.out.println("list size="+list.size());
				tx.commit();
			} catch (HibernateException e) {
				tx.rollback();
				e.printStackTrace();
			}
	
			return model;
	 }

	public List getModelsBySearchString(String searchString,
			int u_id) {
	 	Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		//hql没有分号结尾
		List<Model> list = null;
		try {
//			String sql = "from Model model LEFT OUTER JOIN fetch model.m_admin where model.m_admin.id = '"+u_id+"'";
			String sql="select m.*,a.* from (select * from model where admin_moid = '"+u_id+"' or m_state='1') as m,admin as a " +
					"where m.admin_moid=a.ID  and( m.m_name like '%"+searchString+"%' or a.name  like '%"+searchString+"%')";
			Query query = session.createSQLQuery(sql).addEntity("m", Model.class).addEntity("a", Admin.class);
			list = query.list();
			System.out.println("list size="+list.size());
			tx.commit();
		} catch (HibernateException e) {
			tx.rollback();
			e.printStackTrace();
		}
		return list;
	}
	public boolean removeNONameModelById(int id){
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			System.out.println("id:"+id);
			Model model = (Model) session.get(Model.class, id);
//			System.out.println("model.getName()"+model.getM_name());
//			if(model!=null){
				//System.out.println("model不为空");
				//System.out.println("model.name:"+model.getM_name());
	//		}
		/*	Model model = getModelById(id);*/
			if("".equals(model.getM_name())){
				session.delete(model);
			}
			tx.commit();
			result = true;
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return result;
	}
	public boolean removeNoNameModelsByIds(List<Integer> list){
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		try{
			for(int i = 0;i<list.size();i++){
				Model model = (Model) session.get(Model.class,list.get(i));
				if("".equals(model.getM_name())){
//					System.out.println("index:"+list.get(i));
					session.delete(model);
				}
			}
			tx.commit();
			result = true;
		}catch(Exception e){
			tx.rollback();
			e.printStackTrace();
		}
		return result;
	}
	//新加的
	
	//-----------------------查看详情按钮（模态框）
		public List<Object> viewModel(int m_id){
			Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			List<Object> list = null;
			try {
				String sql = "select * from  model where model.m_id = '"+m_id+"';";
				Query query = session.createSQLQuery(sql);
				list = query.list();
				tx.commit();
			} catch (HibernateException e) {
				tx.rollback();
				e.printStackTrace();
			}
			return list;
		}
		
	//-----------------------喜欢按钮
		public void  likeModel(int m_id){
			Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			String hql = "from Model model where model.m_id = '"+m_id+"'";
			Query query = session.createQuery(hql);
			List<Model> list = query.list();
			int coll = (list.get(0).getM_collect()) + 1;
			String hql1 = "update Model model set model.m_collect = '" + coll+"' where model.m_id='"+m_id+"'";
			session.createQuery(hql1).executeUpdate();
			tx.commit();
			return ;
		}
		//--------------------通过用户权限显示全部模型——查找用户id
		public List<Object> getAllModelsByUserId(int userid,int offset,int pageSize){
			Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			List<Object> list = null;
			try {
				String sql = "select model.m_id,model.m_name,model.m_type,model.m_createTime,admin.name,model.m_collect,model.m_used,model.m_state from  model,admin where (model.admin_moid = '"+userid+"' or m_state='1') and model.m_name <> '' and admin.ID = model.admin_moid limit "+offset+","+pageSize+";";
				System.out.println("sql:"+sql);
				Query query = session.createSQLQuery(sql);
				list = query.list();
				tx.commit();
			} catch (HibernateException e) {
				tx.rollback();
				e.printStackTrace();
			}
			return list;
		}
		//-----------------------单行删除
		public boolean deleteById(int m_id){
			Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			try {
				Model model  = (Model) session.get(Model.class,m_id);
				session.delete(model);
				tx.commit();
			} catch (Exception e) {
				e.printStackTrace();
				tx.rollback();
				return false;
			}
			return true;
		}  
		public boolean deleteByIds(int[] m_ids){
			boolean result = false;
			Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			try{
				for(int i=0;i<m_ids.length;i++){
					Model model = (Model) session.get(Model.class,m_ids[i]);
					session.delete(model);
				}
				tx.commit();
				result = true;
			}catch(Exception e){
				tx.rollback();
				e.printStackTrace();
			}
			return true;
		}

		public int getCountModelsByUserId(int adminId) {
			Session session = sessionFactory.getCurrentSession();
			Transaction tx = session.beginTransaction();
			int count = 0;
			try{
				String sql = "select count(*) from model where model.admin_moid = '"+adminId+"' or m_state='1';";
				count  = ((Number)session.createSQLQuery(sql).uniqueResult()).intValue();
				tx.commit();
			}catch(Exception e){
				tx.rollback();
				e.printStackTrace();
			}
			return count;
		}
}
