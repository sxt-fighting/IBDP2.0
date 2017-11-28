package com.sdu.biz.impl;

import java.util.List;

import com.sdu.dao.impl.DataFileDaoImpl;
import com.sdu.dao.impl.ModelDaoImpl;
import com.sdu.dao.impl.ProjectDaoImpl;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class ProjectBizImpl {
	private ProjectDaoImpl projectDao;
	private ModelDaoImpl modelDao;
	private DataFileDaoImpl dataFileDao;
	
	public void setDataFileDao(DataFileDaoImpl dataFileDao) {
		this.dataFileDao = dataFileDao;
	}
	public void setModelDaoImpl(ModelDaoImpl modelDao) {
		this.modelDao = modelDao;
	}
	public void setProjectDao(ProjectDaoImpl projectDao) {
		this.projectDao = projectDao;
	}
	public int saveProject(Project project,int m_id,int d_id){
		//System.out.println("进biz层");
		
		 project.setP_model(modelDao.getModelById(m_id));
		//System.out.println("设置model成功");
		
		projectDao.saveProject(project);
		System.out.println("保存project成功!");
		
		DataFile dataFile = dataFileDao.getDataFileById(d_id);
		dataFile.setD_project(project);
		//System.out.println("设置project成功");
		dataFileDao.saveDateFile(dataFile);
		//System.out.println("向datfile中添加project成功");
		
		return project.getP_id();
	}
	public Project getById(int projectid){
		return projectDao.getProjectById(projectid);
	}
	public List<Project> getProjectTree(int adminId){
	//	System.out.println("进入ProjectTre");
		return projectDao.getProjectByAdminId(adminId);
	}
}
