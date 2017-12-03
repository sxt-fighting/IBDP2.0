package com.sdu.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	private int m_id;
	private String mids;
	private int offset;
	private int pageSize;
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
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public void setMids(String mids) {
		this.mids = mids;
	}
	
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
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
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		model.setM_createTime(sdf.format(date));
		model.setM_collect(0);
		model.setM_type(obj.getString("m_type"));
		model.setM_used(0);
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
	
	
//--------------通过用户权限显示全部模型
		public String showAllModelsByUserId(){
			System.out.println("到了showAll方法");
			System.out.println("offset:"+offset+",pageSize:"+pageSize);
			List<Object> list = new ArrayList<>();
			int adminId = ((Admin)ActionContext.getContext().getSession().get("user")).getId();
			list = modelBizImpl.getAllModelsByUseId(adminId,offset,pageSize);
			int count = modelBizImpl.getCountModelsByUserId(adminId);
			JSONArray array = new JSONArray();
			for(int i = 0;i<list.size();i++){
				JSONObject jobj = new JSONObject();
				Object[] obj = (Object[])list.get(i);
				jobj.put("m_id",obj[0]);
				jobj.put("m_name",obj[1]);
				jobj.put("m_type", obj[2]);
				jobj.put("m_createTime",obj[3]);
				jobj.put("m_creator",obj[4]);
				jobj.put("m_collect",obj[5]);
				jobj.put("m_used",obj[6]);
				jobj.put("m_state",obj[7]);
//				jobj.put("algorithmString",obj[8]);
//				jobj.put("admin_moid",obj[9]);
				//System.out.println("jobj");
				array.put(jobj);
				//System.out.println("array:"+array.toString());
			}
			map = new HashMap<String,Object>();
//			map.put("DataJson",array.toString());
			JSONObject json = new JSONObject();
			json.put("total",count);
			json.put("rows", array);
			map.put("DataJson",json.toString());
			return "model_allshow";
		}
		//--------------------------批量删除按钮
		public String deleteModels(){
			String temp[] = mids.substring(mids.indexOf("[")+1,mids.indexOf("]")).split(",");
			int[] ids = new int[temp.length];
			for(int i = 0;i < ids.length;i++){
				ids[i] = Integer.parseInt(temp[i]);
			}
			if(modelBizImpl.deletemodels(ids)){
				System.out.println("删除成功！");
			}else {
				System.out.println("删除失败！");
			}
			map = new HashMap<String,Object>();
			map.put("message", "deleteSuccess!");
			return "model_deletes";
		}
		
	//--------------------------查看详情按钮（模态框）
		public String viewModel(){
			System.out.println("m_id"+m_id);
			System.out.println("查看成功");
			List<Object> list = new ArrayList<>();
			list = modelBizImpl.view(m_id);
			JSONArray array = new JSONArray();
			for(int i = 0;i<list.size();i++){
				JSONObject jobj = new JSONObject();
				Object[] obj = (Object[])list.get(i);
				jobj.put("m_id",obj[0]);
				jobj.put("m_name",obj[1]);
				jobj.put("m_state", obj[2]);
				jobj.put("m_descirbe",obj[3]);
				jobj.put("m_createTime",obj[4]);
				jobj.put("m_type",obj[5]);
				jobj.put("m_used",obj[6]);
				jobj.put("m_collect",obj[7]);
				jobj.put("algorithmString",obj[8]);
				jobj.put("admin_moid",obj[9]);
				//System.out.println("jobj");
				array.put(jobj);
				//System.out.println("array:"+array.toString());
			}
			map = new HashMap<String,Object>();
			map.put("DataJson",array.toString());
			return "model_view";
		}
		
	//--------------------------喜欢按钮
		public String likeModel(){
		//	System.out.println("m_id"+m_id);
			 modelBizImpl.like(m_id);
//			 list = new ArrayList<>();
//			 Model model = new Model();
//			 model.setM_name("hellp");
//			 list.add(model);
			 map = new HashMap<String,Object>();
			 map.put("message", "like_success");
			return "model_like";
		}
	//--------------------------单行删除
		public String deleteModel(){
//			System.out.println("m_id"+m_id);
//			if (modelBizImpl.delete(m_id)) {
//				System.out.println("删除成功！");
//			} else {
//				System.out.println("删除失败！");
//			}
			modelBizImpl.delete(m_id);
			map = new HashMap<String,Object>();
			map.put("message", "deleteSuccess!");
			return "model_delete";
		}
}
