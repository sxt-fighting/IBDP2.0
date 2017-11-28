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
	
}
