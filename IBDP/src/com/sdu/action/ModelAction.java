package com.sdu.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sdu.biz.impl.ModelBizImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Model;

public class ModelAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//由spring实例化
	private Model model;
	private ModelBizImpl modelBizImpl;
	//自己new
	private	Map<String,Object> map;
	//由ajax传的值
	private String modelJSONStr;
	private String searchString; 
	
//-------------------------------------------gets和sets
	
	
	
	public Model getModel() {
		return model;
	}
	public void setModel(Model model) {
		this.model = model;
	}
	public ModelBizImpl getModelBizImpl() {
		return modelBizImpl;
	}
	public void setModelBizImpl(ModelBizImpl modelBizImpl) {
		this.modelBizImpl = modelBizImpl;
	}
	public String getModelJSONStr() {
		return modelJSONStr;
	}
	public void setModelJSONStr(String modelJSONStr) {
		this.modelJSONStr = modelJSONStr;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	
	public String getSearchString() {
		return searchString;
	}
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}
	//--------------------------------------action
	public String getModels(){
//		System.out.println("searchString====="+searchString);
		List modellists=modelBizImpl.getModelsBySearchString(searchString,((Admin) ActionContext.getContext().getSession().get("user")).getId());
		JSONArray array=new JSONArray();
		for(Iterator iterator = modellists.iterator();iterator.hasNext();){  
			    //每个集合元素都是Model、Admin所组成的数组  
			    Object[] objects = (Object[]) iterator.next();  
			   Model model = (Model) objects[0];  
			   Admin admin = (Admin) objects[1];  
			   model.setM_admin(admin);
			   JSONObject jobj=new JSONObject();
			   if(!(model.getM_name().equals("")||model.getM_name().isEmpty())){
				   jobj.put("m_id", model.getM_id());
				   jobj.put("m_name", model.getM_name());
				   jobj.put("algorithmString", model.getAlgorithmString());
				   jobj.put("m_used", model.getM_used());
				   jobj.put("m_collect", model.getM_collect());
				   jobj.put("author", model.getM_admin().getName());
//				   System.out.println(model.getM_admin().getName());
//				    System.out.println("model_name="+model.getM_name()+" model_id="+model.getM_id()+" Admin_name="+admin.getName());  
				   array.put(jobj);
			   }
		    }  
//		System.out.println("array===========:"+array.toString());
		map = new HashMap<String,Object>();
		map.put("searched_models",array.toString());
		return "success";
	}
	public String addModel() throws IOException{
	System.out.println("modelJSONStr==="+modelJSONStr);
	JSONObject obj = new JSONObject(modelJSONStr);
//	System.out.println("m_name:"+obj.getString("m_name"));
//	System.out.println("algorithmString"+obj.getJSONArray("algorithmString").toString());
	model = new Model();
	model.setM_name(obj.getString("m_name"));
	model.setM_state(obj.getString("m_state"));
	model.setM_describe(obj.getString("m_describe"));
	model.setM_createTime(obj.getString("m_createTime"));
	model.setM_type(obj.getString("m_type"));
	model.setM_used(1);
	model.setAlgorithmString(obj.getJSONArray("algorithmString").toString());
/*	System.out.println((Admin) ActionContext.getContext().getSession().get("user"));*/
//	System.out.println("name:"+((Admin) ActionContext.getContext().getSession().get("user")).getName());
	model.setM_admin((Admin) ActionContext.getContext().getSession().get("user"));
//	System.out.println("设置成功!");
	/*	System.out.println("进入了函数");
	System.out.println("m_name:"+m_name);*/
	modelBizImpl.addModel(model);
//	System.out.println("modeid:"+model.getM_id());
	map = new HashMap<String,Object>();
	map.put("message", "success");
	map.put("modelid",model.getM_id());
		return "success";
	}

}
