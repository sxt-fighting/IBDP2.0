package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sdu.biz.impl.AdminBizImpl;
import com.sdu.dao.impl.AdminDaoImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.Model;

public class UserAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private Admin admin;
	private AdminBizImpl adminBiz;
	private List<Admin> list;
	private	Map<String,Object> map;
	private int id;
	private String ids;
	private JSONObject obj; 
	private String userJSONStr;
	private File admin_imgName;
	private String admin_imgNameFileName;
	private OutputStream os;
	
	public OutputStream getOs() {
		return os;
	}
	public File getAdmin_imgName() {
		return admin_imgName;
	}
	public void setAdmin_imgName(File admin_imgName) {
		this.admin_imgName = admin_imgName;
	}
	public String getAdmin_imgNameFileName() {
		return admin_imgNameFileName;
	}
	public void setAdmin_imgNameFileName(String admin_imgNameFileName) {
		this.admin_imgNameFileName = admin_imgNameFileName;
	}
	public String getIds() {
		return ids;
	}
	public String getUserJSONStr() {
		return userJSONStr;
	}
	public void setUserJSONStr(String userJSONStr) {
		this.userJSONStr = userJSONStr;
	}
	public JSONObject getObj() {
		return obj;
	}
	public void setObj(JSONObject obj) {
		this.obj = obj;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public AdminBizImpl getAdminBiz() {
		return adminBiz;
	}
	public void setAdminBiz(AdminBizImpl adminBiz) {
		this.adminBiz = adminBiz;
	}
	public List<Admin> getList() {
		return list;
	}
	public void setList(List<Admin> list) {
		this.list = list;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String upload() throws IOException{
		InputStream is = new FileInputStream(admin_imgName);
		OutputStream os = new FileOutputStream(new File(ServletActionContext.getServletContext().getRealPath("/")+"/userHeadPhoto/"+admin_imgNameFileName));
		byte flush[]= new byte[1024];
		int len = 0;
		while(0<=(len = is.read(flush))){
			os.write(flush, 0, len);
		}
		is.close();
		os.close();	
		String path = "./userHeadPhoto/"+admin_imgNameFileName;
//		byte[] path= file.getBytes();
		int userid = ((Admin)ActionContext.getContext().getSession().get("user")).getId();
		adminBiz.upload(path,userid);
		map = new HashMap<String,Object>();
		map.put("message", "uploadSuccess!");
//		map.put("fileid", d_id);
		return"upload";
	}
	public String show(){
		System.out.println("userid0000"+id);
		System.out.println("查看成功");
		List<Object> list = new ArrayList<>();		
		list =adminBiz.show(id);
		JSONArray array = new JSONArray();
		for(int i = 0;i<list.size();i++){
			JSONObject jobj = new JSONObject();
			Object[] obj = (Object[])list.get(i);
			jobj.put("id",obj[0]);
			jobj.put("name",obj[1]);
			jobj.put("password", obj[2]);
			jobj.put("company",obj[3]);
			jobj.put("telephone",obj[4]);
			jobj.put("email",obj[5]);
			jobj.put("isAdmin",obj[6]);
			//add
			jobj.put("imgName", obj[7]);
			array.put(jobj);
		}
		map = new HashMap<String,Object>();
		map.put("DataJson",array.toString());
		return "showSuccess";
	}
	
	public String showAll(){
		List<Object> list = new ArrayList<>();
		int userid = ((Admin)ActionContext.getContext().getSession().get("user")).getId();
		System.out.println("id---"+userid);
		list =adminBiz.showAll(userid);
		JSONArray array = new JSONArray();
		for(int i = 0;i<list.size();i++){
			JSONObject jobj = new JSONObject();
			Object[] obj = (Object[])list.get(i);
			jobj.put("id",obj[0]);
			jobj.put("name",obj[1]);
			jobj.put("password", obj[2]);
			jobj.put("company",obj[3]);
			jobj.put("telephone",obj[4]);
			jobj.put("email",obj[5]);
			jobj.put("isAdmin",obj[6]);
			array.put(jobj);
			System.out.println("array===="+array);
		}
		map = new HashMap<String,Object>();
		map.put("DataJson",array.toString());
		return "showAll";
	}
	
	public String showUser(){
		List<Object> list = new ArrayList<>();
		int userid = ((Admin)ActionContext.getContext().getSession().get("user")).getId();
		System.out.println("id---"+userid);
		list =adminBiz.show(userid);
			JSONObject jobj = new JSONObject();
			Object[] obj = (Object[])list.get(0);
			jobj.put("id",obj[0]);
			jobj.put("name",obj[1]);
			jobj.put("password", obj[2]);
			jobj.put("company",obj[3]);
			jobj.put("telephone",obj[4]);
			jobj.put("email",obj[5]);
			jobj.put("isAdmin",obj[6]);
			jobj.put("imgName",obj[7]);
			System.out.println("imgName:"+obj[7]);
			System.out.println("jobj===="+jobj);
		map = new HashMap<String,Object>();
		map.put("DataJson",jobj.toString());
		return "showUser";
	}
	
	public String delete(){
		if(adminBiz.delete(id)){
			System.out.println("删除成功");
		}else{
			System.out.println("删除失败");
		}
		map = new HashMap<String,Object>();
		map.put("message","deleteSuccess");
		return "deleteSuccess";
	}
	
	public String deletes(){
		System.out.println("ids=="+ids);
		if(adminBiz.deleteUsers(ids)){
			System.out.println("删除成功");
		}else{
			System.out.println("删除失败");
		}
		map = new HashMap<String,Object>();
		map.put("message","deleteSuccess");
		return"deletes";
	}
	
	public String update(){
		System.out.println("1111111");
		System.out.println("userJSONStr=="+userJSONStr);
		obj = new JSONObject(userJSONStr);	
		admin = new Admin();
		admin.setId(((Admin)ActionContext.getContext().getSession().get("user")).getId());
		admin.setName(obj.getString("admin_username"));
		System.out.println("id=="+admin.getId());
		admin.setPassword(obj.getString("admin_password"));
		admin.setCompany(obj.getString("admin_company"));
		admin.setTelephone(obj.getString("admin_phone"));
		admin.setEmail(obj.getString("admin_email"));
		admin.setImgName(obj.getString("admin_imgName"));
	//	admin.setImgName();
//		admin.setImgName(obj.getString("admin_imgName"));
//		System.out.println(admin.getName());
		adminBiz.updateAdmin(admin);
		map = new HashMap<String,Object>();
		return "updateSuccess";
	}
	
	public String adminUpdate(){
		System.out.println("222222");
		System.out.println("userJSONStr=="+userJSONStr);
		obj = new JSONObject(userJSONStr);	
		admin = new Admin();
	//	System.out.println(""+obj.getString("admin_id"));
		admin.setId(obj.getInt("admin_id"));
		admin.setName(obj.getString("admin_username"));
		admin.setPassword(obj.getString("admin_password"));
		admin.setCompany(obj.getString("admin_company"));
		admin.setTelephone(obj.getString("admin_tel"));
		admin.setEmail(obj.getString("admin_email"));
		admin.setIsAdmin(obj.getInt("admin_isAdmin"));
		System.out.println("admin___"+admin);
		adminBiz.updateAdmin(admin);
		map = new HashMap<String,Object>();
		return"adminUpdate";
	}
}
