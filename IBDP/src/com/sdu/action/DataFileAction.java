package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sdu.biz.impl.DataFileBizImpl;
import com.sdu.biz.impl.ProjectBizImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class DataFileAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//由spring实例化
	private DataFile dataFile;
	private DataFileBizImpl dataFileBiz;
	private ProjectBizImpl projectBiz;
	//自己new
	private List<DataFile> list;
	private	Map<String,Object> map;
	//由前台赋值
	private File uploadFile;	//struts本身封装的inputfile属性，file值可以直接从前台得到
	private String uploadFileFileName;	//文件名
	private String data;
	private int fileid;
	private String hasheader;
	private String ids;
	private int offset;
	private int pageSize;
	//由ajax传的值
	private int did;
	private int project_id = -1;
	private String datafile_type = "null";
	//struts封装的Inputstream
	private InputStream downFile;
	private String downfilename;
//-------------------------------------------gets和sets
	
	public File getUploadFile() {
		return uploadFile;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public void setDatafile_type(String datafile_type) {
		this.datafile_type = datafile_type;
	}
	public int getFileid() {
		return fileid;
	}
	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	
	public String getHasheader() {
		return hasheader;
	}
	public void setHasheader(String hasheader) {
		this.hasheader = hasheader;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getDownfilename() {
		return downfilename;
	}
	public void setDownfilename(String downfilename) {
		this.downfilename = downfilename;
	}
	public InputStream getDownFile() {
		return downFile;
	}
	public void setDownFile(InputStream downFile) {
		this.downFile = downFile;
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
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}
	public DataFile getDataFile() {
		return dataFile;
	}
	public void setDataFile(DataFile dataFile) {
		this.dataFile = dataFile;
	}
	public DataFileBizImpl getDataFileBiz() {
		return dataFileBiz;
	}
	public void setDataFileBiz(DataFileBizImpl dataFileBiz) {
		this.dataFileBiz = dataFileBiz;
	}
	
	
	public void setProjectBiz(ProjectBizImpl projectBiz) {
		this.projectBiz = projectBiz;
	}
	public void setList(List<DataFile> list) {
		this.list = list;
	}
	public List<DataFile> getList() {
		return list;
	}
	//------------------------------------------------------------------action
	public String saveDataFile() throws IOException{
		System.out.println("project_id:"+project_id);
		System.out.println("datafile_type:"+datafile_type);
		String unit = "KB";
		dataFile=new DataFile();
		dataFile.setD_name(uploadFileFileName);
		String suffix = uploadFileFileName.substring(uploadFileFileName.lastIndexOf(".")+1);
		dataFile.setD_suffix(suffix);	
		//将其换成mb
		double size = uploadFile.length()/1024.0;	
		//保存文件操作
		InputStream is = new FileInputStream(uploadFile);
		OutputStream os = new FileOutputStream(new File("D:/user/"+uploadFileFileName));
		byte flush[]= new byte[1024];
		int len = 0;
		while(0<=(len = is.read(flush))){
			os.write(flush, 0, len);
		}
		is.close();
		os.close();		
		if(size>1024){
			size=size/1024.0;
			unit = "MB";
		}else if(size>1024*1024){
			size = size /(1024*1024.0);
			unit="GB";
		}
		String temp=size+"";
		temp = temp.substring(0,temp.indexOf(".")+2);
		dataFile.setD_size(temp+unit);
		dataFile.setD_localpath("D:/user/"+uploadFileFileName);
		dataFile.setD_type("DataFile");
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
		dataFile.setD_createTime(sdf.format(date));
		int d_id = -1;
		if(project_id==-1 &&  "null".equals(datafile_type)){
			System.out.println("new_project页面");
			d_id = dataFileBiz.save(dataFile,((Admin)ActionContext.getContext().getSession().get("user")).getId()+""); 
		}else if(project_id !=-1 && "null".equals(datafile_type)){
			System.out.println("给定的project");
			d_id = dataFileBiz.saveByProjectId(dataFile,((Admin)ActionContext.getContext().getSession().get("user")).getId()+"",project_id);
		}else if(project_id!=-1){
			System.out.println("给定的project和datafile_type");
			d_id = dataFileBiz.saveByProjectIdAndDataFileType(dataFile,((Admin)ActionContext.getContext().getSession().get("user")).getId()+"",project_id,datafile_type);
		}
		System.out.println("action中的d_id:"+d_id);
		map = new HashMap<String,Object>();
		map.put("message", "uploadSuccess!");
		map.put("fileid", d_id);
		//HDFSTools.copyFile(dataFile.getD_localpath(), )
		return "saveSuccess";
	}
	//不能写成getXxxxx会被封装成json发送到前台
/*	public String showAllDataFiles(){
		list  = new ArrayList<DataFile>();
		List<DataFile> temp = dataFileBiz.getAllByUseId(1);
		System.out.println("size:"+temp.size());
		for(int i = 0;i<temp.size();i++){
			temp.get(i).setD_admin(null);
			temp.get(i).setD_project(null);
			System.out.println(temp.get(i).getD_id());
			System.out.println("date:"+temp.get(i).getD_createTime());
			list.add(temp.get(i));
		}
		System.out.println(list);
		return "getSuccess";
	}*/
	public String showAllDataFiles(){
//		System.out.println("11111111111111111");
	//	System.out.println("project_id:"+project_id);
	//	System.out.println("datafile_type:"+datafile_type);
		int userId = ((Admin)ActionContext.getContext().getSession().get("user")).getId();
		List<Object> list = new ArrayList<>();
		if(project_id==-1 && "null".equals(datafile_type)){	
			list = dataFileBiz.getAllByUseId(userId,offset,pageSize);
		}else if(project_id!=-1 && "null".equals(datafile_type)){
			list = dataFileBiz.getAllByProjectId(userId,project_id,offset,pageSize); 
		}else if(project_id!=-1){
			//list = dataFileBiz.getAllByProjectIdAndDataFileType(userId,project_id,datafile_type,offset,pageSize);
		}
		JSONArray array = new JSONArray();
		for(int i = 0;i<list.size();i++){
			JSONObject jobj = new JSONObject();
			Object[] obj = (Object[])list.get(i);
			jobj.put("id",obj[0]);
			jobj.put("name",obj[1]);
			jobj.put("projectName", obj[2]);
			jobj.put("type",obj[3]);
			jobj.put("size",obj[4]);
			jobj.put("uploadDate",obj[5]);
			//System.out.println("jobj");
		//	System.out.println(jobj.toString());
			array.put(jobj);
			//System.out.println("array:"+array.toString());
		}
		/*datafileJson =*/ 
		JSONObject json = new JSONObject();
		json.put("total",list.size());
		json.put("rows", array);
		map = new HashMap<String,Object>();
		map.put("DataJson",json.toString());
		return "getSuccess";
	}
	public String delDataFile(){
//		System.out.println("did:"+did);
//		System.out.println("开始删除!");
		if(dataFileBiz.remove(did)){
			System.out.println("删除成功");
		}else{
			System.out.println("删除失败!");
		}
		map = new HashMap<String,Object>();
		map.put("message", "deleteSuccess!");
		return "delSuccess";
	}
	public String delDataFiles(){
		/*System.out.println("1111111");
		System.out.println("ids"+ids);*/
		dataFileBiz.removeDataFiles(ids.substring(ids.indexOf("[")+1,ids.indexOf("]")));
		map = new HashMap<String,Object>();
		map.put("message", "deleteSuccess!");
		return "delSuccess";
	}
	public String downloadFile() throws FileNotFoundException{
/*		System.out.println("did:"+did);
		System.out.println("开始下载!");*/
		downfilename = dataFileBiz.getById(did).getD_name();
/*		System.out.println("文件名:"+downfilename);*/
		downFile = new FileInputStream(new File(dataFileBiz.getById(did).getD_localpath()));
		map = new HashMap<String,Object>();
		map.put("message","downloadFile");
		return "downloadFile";
	}
	public String updateDataFile(){
	//	System.out.println("fileid:"+fileid);
	//	System.out.println("hasheader:"+hasheader);
		System.out.println("更改表头");
		if("是".equals(hasheader)){
			dataFileBiz.updateHasheader(fileid, "TRUE");
		}else{
			dataFileBiz.updateHasheader(fileid, "FALSE");
		}
		map =new HashMap<String,Object>();
		map.put("message","deleteSuccess");
		return "updateSuccess";
	}
	public String getTree(){
		map = new HashMap<String,Object>();
		List<Project> projectTree = projectBiz.getProjectTree(((Admin)ActionContext.getContext().getSession().get("user")).getId());
		List<Object> dataFileTree = dataFileBiz.getDateFileTree(((Admin)ActionContext.getContext().getSession().get("user")).getId());
		JSONArray projectArray = new JSONArray();
		for(int i = 0;i<projectTree.size();i++){
			JSONObject projectObject= new JSONObject();
			projectObject.put("text",projectTree.get(i).getP_name());
			projectObject.put("height", 2);
			projectObject.put("project_id", projectTree.get(i).getP_id());
			JSONArray dataFileArray = new JSONArray();
			//添加projectNode中的信息
			for(int j = 0;j<dataFileTree.size();j++){
				Object[] object = (Object[]) dataFileTree.get(j);
//				System.out.println("object[0] = "+object[0]);
				if(projectTree.get(i).getP_id() ==object[0]){
					JSONObject dataFileObject = new JSONObject();
//					System.out.println("object[1] = "+object[1]);
					dataFileObject.put("text", object[1]);
					dataFileObject.put("height", 3);
					dataFileObject.put("project_id",projectTree.get(i).getP_id());
					dataFileObject.put("datafile_type",object[1]);
					dataFileArray.put(dataFileObject);
				}
			}
			projectObject.put("nodes", dataFileArray);
			projectArray.put(projectObject);
		}
		//System.out.println("--------------------projectArray-----------------");
		//System.out.println("projectArray:"+projectArray);
		map.put("text","所有文件");
		map.put("nodes", projectArray.toString());
		//System.out.println("map==="+map);
		return "getTreeSuccess";
	}
}
