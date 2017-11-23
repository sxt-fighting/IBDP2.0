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

import org.apache.hadoop.hdfs.tools.DFSAdmin;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sdu.ToolsUse.HDFSTools;
import com.sdu.biz.impl.DataFileBizImpl;
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
	//自己new
	private List<DataFile> list;
	private	Map<String,Object> map;
	//由前台赋值
	private File uploadFile;	//struts本身封装的inputfile属性，file值可以直接从前台得到
	private String uploadFileFileName;	//文件名
	private String data;
	private String userid;
	private int fileid;
	private String hasheader;
	//由ajax传的值
	private int did;
	//struts封装的Inputstream
	private InputStream downFile;
	private String downfilename;
//-------------------------------------------gets和sets
	
	public File getUploadFile() {
		return uploadFile;
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
	public String getUserid() {
		return userid;
	}
	public void setData(String data) {
		this.data = data;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	
	
	public void setList(List<DataFile> list) {
		this.list = list;
	}
	public List<DataFile> getList() {
		return list;
	}
	//------------------------------------------------------------------action
	public String saveDataFile() throws IOException{
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
		dataFile.setD_size(size+"KB");
		dataFile.setD_localpath("D:/user/"+uploadFileFileName);
		dataFile.setD_type("0");
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
		dataFile.setD_createTime(sdf.format(date));
		int d_id = dataFileBiz.save(dataFile,userid); 
		System.out.println("action中的d_id:"+d_id);
		map = new HashMap<String,Object>();
		map.put("message", "uploadSuccess!");
		map.put("fileid", d_id);
		//HDFSTools.copyFile(dataFile.getD_localpath(), )
		return "saveSuccess";
	}
	//不能写成getXxxxx会被封装成json发送到前台
	public String showAllDataFiles(){
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
	}
	
	public String delDataFile(){
		System.out.println("did:"+did);
		System.out.println("开始删除!");
		if(dataFileBiz.remove(did)){
			System.out.println("删除成功");
		}else{
			System.out.println("删除失败!");
		}
		map = new HashMap<String,Object>();
		map.put("message", "deleteSuccess!");
		return "delSuccess";
	}
	public String downloadFile() throws FileNotFoundException{
		System.out.println("did:"+did);
		System.out.println("开始下载!");
		downfilename = dataFileBiz.getById(did).getD_name();
		System.out.println("文件名:"+downfilename);
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
			dataFileBiz.updateHasheader(fileid, "true");
		}else{
			dataFileBiz.updateHasheader(fileid, "false");
		}
		map =new HashMap<String,Object>();
		map.put("message","deleteSuccess");
		return "updateSuccess";
	}
}
