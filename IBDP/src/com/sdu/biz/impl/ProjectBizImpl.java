package com.sdu.biz.impl;

import java.util.List;

import com.sdu.dao.impl.DataFileDaoImpl;
import com.sdu.dao.impl.ModelDaoImpl;
import com.sdu.dao.impl.ProjectDaoImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Model;
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
		Model model = modelDao.getModelById(m_id);
		model.setM_used(model.getM_used()+1);
		modelDao.createModel(model);
		project.setP_model(model);
		// project.setP_model(modelDao.getModelById(m_id));
		//System.out.println("设置model成功");
		projectDao.saveProject(project);
//		System.out.println("保存project成功!");
		DataFile dataFile = dataFileDao.getDataFileById(d_id);
		dataFile.setD_project(project);
		//添加hdfs路径
		String hdfsPathString="hdfs://211.87.227.9:8020/user/acceptFile/"+project.getP_id()+ "/"+dataFile.getD_type()+"/"+dataFile.getD_name();
		dataFile.setD_HDFSpath(hdfsPathString);
		dataFileDao.saveDateFile(dataFile);
		//System.out.println("向datfile中添加project成功");
		
		return project.getP_id();
	}
	public Project getById(int projectid){
		return projectDao.getProjectById(projectid);
	}
	public List<Object> getProjectsByAdminId(int adminId,int offset,int pageSize){
		return projectDao.getProjectsByAdminId(adminId,offset,pageSize);
	}
	public List<Project> getProjectTree(int adminId){
	//	System.out.println("进入ProjectTre");
		return projectDao.getProjectByAdminId(adminId);
	}
	public int getProjectCountByAdminId(int adminId) {
		return projectDao.getProjectCountByAdminId(adminId);
	}
	public boolean delProject(int id) {
		Project project = projectDao.getProjectById(id);
		System.out.println("modelID"+project.getP_model().getM_id());
		if(!modelDao.removeNONameModelById(project.getP_model().getM_id())){
			projectDao.delProject(id);
		}
		return true;
	}
	public boolean delProjects(int[] ids) {
		List<Integer> list = projectDao.getModelIdsByProjectIds(ids);
//		System.out.println("list:"+list);
		modelDao.removeNoNameModelsByIds(list);
		projectDao.delProjects(ids);
		return true;
	}
}
