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

	private ProjectDaoImpl projectDao;
	public void setProjectDao(ProjectDaoImpl projectDao) {
		this.projectDao = projectDao;
	}
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
	public List<Object> getAllByUseId(int userid,int offset,int pageSize){
		return dataFileDao.getByUserId(userid,offset,pageSize);
	}
	public boolean remove(int did){
		return dataFileDao.removeById(did);
	}
	public int save(DataFile dataFile,String adminId){
	//	System.out.println("保存数据文件");
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
		//System.out.println("进入DataFile");
		return dataFileDao.getDataFileByAdminId(adminId);
	}
	public List<Object> getAllByProjectId(int userId, int project_id, int offset, int pageSize) {
		return dataFileDao.getDataFilesByProjectId(userId,project_id,offset,pageSize);
	}
	public List<Object> getAllByProjectIdAndDataFileType(int adminId,int project_id, String datafile_type, int offset, int pageSize) {
		return dataFileDao.getDataFilesByProjectIdAndDataFileType(adminId,project_id, datafile_type,offset,pageSize);
	}
	public int saveByProjectId(DataFile dataFile, String admin_id, int project_id){ 
		Project project = projectDao.getProjectById(project_id);
		Admin admin = adminDao.getById(admin_id);
		dataFile.setD_admin(admin);
		dataFile.setD_project(project);
		return dataFileDao.saveDateFile(dataFile);
	}
	public int saveByProjectIdAndDataFileType(DataFile dataFile, String admin_id, int project_id,String datafile_type) {
		Project project = projectDao.getProjectById(project_id);
		Admin admin = adminDao.getById(admin_id);
		dataFile.setD_type(datafile_type);
		dataFile.setD_admin(admin);
		dataFile.setD_project(project);
		return dataFileDao.saveDateFile(dataFile);
	}
	public boolean removeDataFiles(String ids) {
		return dataFileDao.removeByIds(ids);
	}
	public int getCountByUserId(int userId){
		return dataFileDao.getCountByUserId(userId);
	}
	public int getCountByProjectId(int userId,int project_Id) {
		return dataFileDao.getCountByProjectId(userId,project_Id);
	}
	public int getCountByProjectIdAndDatafileType(int userId,int project_id,String datafile_type){
		return dataFileDao.getCountByProjectIdAndDataFileType(userId, project_id, datafile_type);
	}
}
