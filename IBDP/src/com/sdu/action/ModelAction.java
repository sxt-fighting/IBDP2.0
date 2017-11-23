package com.sdu.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private List<DataFile> list;
	private	Map<String,Object> map;
	//由ajax传的值
	private String modelJSONStr;
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
	public void setList(List<DataFile> list) {
		this.list = list;
	}
	public List<DataFile> getList() {
		return list;
	}
	//--------------------------------------action
	public String addModel() throws IOException{
	System.out.println("modelJSONStr==="+modelJSONStr);
	JSONObject obj = new JSONObject(modelJSONStr);
	System.out.println("m_name:"+obj.getString("m_name"));
	System.out.println("algorithmString"+obj.getJSONArray("algorithmString").toString());
	model = new Model();
	model.setM_name(obj.getString("m_name"));
	model.setM_state(obj.getString("m_state"));
	model.setM_describe(obj.getString("m_describe"));
	model.setM_createTime(obj.getString("m_createTime"));
	model.setM_type(obj.getString("m_type"));
	model.setM_used(1);
	model.setAlgorithmString(obj.getJSONArray("algorithmString").toString());
/*	System.out.println((Admin) ActionContext.getContext().getSession().get("user"));*/
	System.out.println("name:"+((Admin) ActionContext.getContext().getSession().get("user")).getName());
	model.setM_admin((Admin) ActionContext.getContext().getSession().get("user"));
	System.out.println("设置成功!");
	/*	System.out.println("进入了函数");
	System.out.println("m_name:"+m_name);*/
	modelBizImpl.addModel(model);
	System.out.println("modeid:"+model.getM_id());
	map = new HashMap<String,Object>();
	map.put("message", "success");
	map.put("modelid",model.getM_id());
		return "success";
	}

}
