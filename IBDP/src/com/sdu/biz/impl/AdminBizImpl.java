package com.sdu.biz.impl;

import java.util.List;

import com.sdu.dao.impl.AdminDaoImpl;
import com.sdu.dao.impl.workInfoDaoImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.Work;

public class AdminBizImpl {
	AdminDaoImpl adminDao;
	 
	public void setAdminDao(AdminDaoImpl adminDao) {
		this.adminDao = adminDao;
	}

	public List<Admin> Login(Admin condition)
    {
    	 return adminDao.search(condition);
    }
	public boolean Register(Admin condition)
    {
    	 return adminDao.insert(condition);
    }
}
