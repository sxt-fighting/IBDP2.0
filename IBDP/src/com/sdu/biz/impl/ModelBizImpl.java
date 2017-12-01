package com.sdu.biz.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;


import com.sdu.dao.impl.DataFileDaoImpl;
import com.sdu.dao.impl.ModelDaoImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.Model;

public class ModelBizImpl {
	private ModelDaoImpl modelDaoImpl;
	public ModelDaoImpl getModelDaoImpl() {
		return modelDaoImpl;
	}
	public void setModelDaoImpl(ModelDaoImpl modelDaoImpl) {
		this.modelDaoImpl = modelDaoImpl;
	}
	public ModelBizImpl() {
		//System.out.println("ModelBizImpl构造函数被调用");
	}
	
	
	
	public boolean addModel(Model model){//参数不应该是Model，最好是json转化的对象，将来再改
//		System.out.println("biz层：addmodel");
		return modelDaoImpl.createModel(model);
	}
	 public Model getModelById(int m_id){
		return modelDaoImpl.getModelById(m_id);
	}
	public List getModelsBySearchString(String searchString,
			Integer u_id) {
		//List list=modelDaoImpl.getModelsBySearchString(searchString,u_id);
		/*JSONArray array=new JSONArray();
		for(Iterator iterator = list.iterator();iterator.hasNext();){  
			    //每个集合元素都是Model、Admin所组成的数组  
			    Object[] objects = (Object[]) iterator.next();  
			   Model model = (Model) objects[0];  
			   Admin admin = (Admin) objects[1];  
			   model.setM_admin(admin);
			   JSONObject jobj=new JSONObject();
			   jobj.put("id", model.getM_id());
			   jobj.put("name", model.getM_name());
			   jobj.put("algorithmString", model.getAlgorithmString());
			   jobj.put("used", model.getM_used());
			   jobj.put("collection", model.getM_collect());
			   jobj.put("author", model.getM_admin().getName());
//			   System.out.println(model.getM_admin().getName());
//			    System.out.println("model_name="+model.getM_name()+" model_id="+model.getM_id()+" Admin_name="+admin.getName());  
			   array.put(jobj);
			    }  */
		return modelDaoImpl.getModelsBySearchString(searchString,u_id);
	}
	//新加的
	
	//--------------查看详情按钮（模态框）	
		public List<Object> view(int m_id){
			return modelDaoImpl.viewModel(m_id);
		}

	//--------------喜欢按钮
		public void like(int m_id){
			 modelDaoImpl.likeModel(m_id);
		}
		
//-------------通过用户权限显示全部模型——查找用户id
	public List<Object> getAllModelsByUseId(int userid,int offset,int pageSize){
		return modelDaoImpl.getAllModelsByUserId(userid,offset,pageSize);
	}
	//单行删除
	public boolean delete(int m_id){
		return modelDaoImpl.deleteById(m_id);
	}
	//多行删除
	public boolean deletemodels(int[] mids){
		return modelDaoImpl.deleteByIds(mids);
	}
	public int getCountModelsByUserId(int adminId) {
		return	modelDaoImpl.getCountModelsByUserId(adminId);
	}
}
