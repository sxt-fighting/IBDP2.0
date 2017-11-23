package com.sdu.dao.impl;

import java.util.Iterator;
import java.util.List;

import net.sf.ehcache.search.aggregator.Count;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Session;

import com.sdu.entity.Work;
public class workInfoDaoImpl {
   SessionFactory sessionFactory;

   public void setSessionFactory(SessionFactory sessionFactory) {
	   this.sessionFactory = sessionFactory;
   }
   public boolean saveworkHistory()
   {
	  int count=0;
	  System.out.println("将用户的操作保存到mysql中的work表中");
	  Session session= sessionFactory.getCurrentSession();
	  String hql="select count(w) from work w";
	  Query query=session.createQuery(hql);
	  count=Integer.parseInt(query.uniqueResult().toString());
	  return true;	   
   }
   public void selectWork()
   {
	   Session session=sessionFactory.getCurrentSession();
	   String hql="from work";
	   Query query=session.createQuery(hql);
	   List list=query.list();
	   Iterator itor =list.iterator();
	   while ( itor.hasNext())
	   {
		   Work work=(Work) itor.next();
		   System.out.println(work.getUsername()+" "+work.getWorkid()+" "+work.getWorkcontent());
	   }
   }
}
