package com.sdu.biz.impl;

import java.util.List;

import com.sdu.dao.impl.AdminDaoImpl;
import com.sdu.dao.impl.DataFileDaoImpl;
import com.sdu.dao.impl.ProjectDaoImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;



public class DataFileBizImpl {
	private DataFileDaoImpl dataFileDao;
	private AdminDaoImpl adminDao;
	public AdminDaoImpl getAdminDao() {
		return adminDao;
	}
	public void setAdminDao(AdminDaoImpl adminDao) {
		this.adminDao = adminDao;
	}
	public DataFileBizImpl() {
		//System.out.println("构造函数被调用");
	}
	public void setDataFileDao(DataFileDaoImpl dataFileDao){
		this.dataFileDao = dataFileDao;
	}
	public DataFileDaoImpl getDataFileDao() {
		return dataFileDao;
	}
	public List<Object> getAllByUseId(int userid){
		return dataFileDao.getByUserId(userid);
	}
	public boolean remove(int did){
		return dataFileDao.removeById(did);
	}
	public int save(DataFile dataFile,String adminId){
		System.out.println("保存数据文件");
		Admin admin = adminDao.getById(adminId);
		//System.out.println("查询adminid成功");
		//System.out.println("admin.name"+admin.getName());
		dataFile.setD_admin(admin);
		//System.out.println("return之前");
		return dataFileDao.saveDateFile(dataFile);
	}
	public boolean updateProjectId(String adminId){
		return true;
	}
	public boolean updateHasheader(int d_id,String hasheader){
		
		return dataFileDao.updateHashader(d_id, hasheader);
	}
	public DataFile getById(int did){
		System.out.println(did);
		return dataFileDao.getDataFileById(did);
	}
	public List<Object> getDateFileTree(int adminId){
		System.out.println("进入DataFile");
		return dataFileDao.getDataFileByAdminId(adminId);
	}
}
