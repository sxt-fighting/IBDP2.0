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

	public List<Object> show(int id) {		
		return adminDao.show(id);
	}

	public List<Object> showAll(int userid) {
		// TODO Auto-generated method stub
		return adminDao.showAll(userid);
	}

	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return adminDao.delete(id);
	}

	public void updateAdmin(Admin admin) {
		//System.out.println("---------"+admin);
		adminDao.updateAdmin(admin);
	}

	public boolean deleteUsers(String ids) {
		String[] idArray = ids.substring(1, ids.length()-1).split(",");
		//System.out.println("idArray==="+idArray);
		return adminDao.deleteUsers(idArray);
	}

	public void upload(String path, int userid) {
		adminDao.upload(path,userid);
		
	}




}
