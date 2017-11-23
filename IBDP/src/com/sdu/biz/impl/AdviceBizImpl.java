package com.sdu.biz.impl;

import java.util.List;

import com.sdu.dao.impl.AdminDaoImpl;
import com.sdu.dao.impl.AdviceDaoImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.Advice;

public class AdviceBizImpl {
	private AdviceDaoImpl adviceDao;
	private AdminDaoImpl adminDao;
	public void setAdviceDao(AdviceDaoImpl adviceDao){
		this.adviceDao = adviceDao;
	}
	public void setAdminDao(AdminDaoImpl adminDao) {
		this.adminDao = adminDao;
	}

	public boolean createAdvice(Advice advice){
		return adviceDao.addAdvice(advice);
	}
	public boolean markRead(int a_id){
		return adviceDao.markRead(a_id);
	}
	public List<Advice> getNotReadById(int userId){
		return adviceDao.getNotReadById(userId);
	}
}
