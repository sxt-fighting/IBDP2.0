package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;

import com.sdu.ToolsUse.MysqlConnect;
import com.sdu.ToolsUse.ReadFileNew;
import com.sdu.dao.impl.DataFileDaoImpl;
import com.sdu.entity.DataFile;
import com.sdu.entity.DataNew;




public class ReadFileToShowAction {
	private int dataFileId;
	private DataFileDaoImpl dataFileDao;
	private Map<String,Object> map;
	private int pos;
	private int lines;
	//--------------------------
	public void setDataFileId(int dataFileId) {
		this.dataFileId = dataFileId;
	}
	public void setDataFileDao(DataFileDaoImpl dataFileDao) {
		this.dataFileDao = dataFileDao;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	
	public void setPos(int pos) {
		this.pos = pos;
	}
	public void setLines(int lines) {
		this.lines = lines;
	}
	//------------------------------------
	public String execute()throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		Logger log  =  Logger.getLogger(ReadFileToShowAction.class);
		String forward = "tab";
		String rowid=request.getParameter("did");
//		System.out.println(rowid);
		String filePath=MysqlConnect.getpath(rowid);//由id从本地数据库获取Path
		System.out.println(filePath);
		//获取文件类型
		String filetype = "";
		int dot = filePath.lastIndexOf('.');   
        if ((dot >-1) && (dot < (filePath.length() - 1))) {  
        	filetype = filePath.substring(dot + 1);
        }  
        //获取文件名称
        String filename = "";
		int iline = filePath.lastIndexOf('/');   
        filename = filePath.substring(iline + 1);
       
		if ("xls".equals(filetype.toLowerCase()) || "xlsx".equals(filetype.toLowerCase()) || "txt".equals(filetype.toLowerCase()) || "csv".equals(filetype.toLowerCase())) {
			List<DataNew> datalist = new ArrayList<DataNew>();
			datalist.clear();
			int colnum = 0;
			
			if ("txt".equals(filetype.toLowerCase())) {
				datalist = ReadFileNew.readtxt(filePath);
				colnum = ReadFileNew.txtlen(filePath);
				forward= "txt";
			} else if ("csv".equals(filetype.toLowerCase())) {
				datalist = ReadFileNew.readcsv(filePath);
				colnum = ReadFileNew.csvlen(filePath);
				
			} else if ("xls".equals(filetype.toLowerCase()) || "xlsx".equals(filetype.toLowerCase())) {
				datalist = ReadFileNew.readexcel(filePath);
				colnum = ReadFileNew.excellen(filePath);
				
			} else {
				datalist = ReadFileNew.readcsv(filePath);
				colnum = ReadFileNew.csvlen(filePath);
				
			}
		
//			File filedel = new File(filePath);
//			if(filedel.exists()) {
//				filedel.getAbsoluteFile().delete();
//			}
//			System.out.println(colnum);
			String colNum = colnum +"";
			request.setAttribute("colNum", colNum);
			//System.out.println(datalist);
			request.setAttribute("dataList", datalist);
		} else if ("jpg".equals(filetype.toLowerCase()) || "jpeg".equals(filetype.toLowerCase()) || "png".equals(filetype.toLowerCase())) {
				
			request.setAttribute("filename", filename);
			forward="picture";
		}
		
		return forward;
	}
	public String dynamicView() throws Exception{
//		System.out.println("dataFileId:"+dataFileId);
		DataFile dataFile= dataFileDao.getDataFileById(dataFileId);
		String filePath = dataFile.getD_localpath();
		String suffix = dataFile.getD_suffix();
		List<DataNew> datalist = null;
		JSONArray array =null;
		int position =-1;
		String isNext = "true";
		if("xls".equals(suffix.toLowerCase()) || "xlsx".equals(suffix.toLowerCase()) || "txt".equals(suffix.toLowerCase()) || "csv".equals(suffix.toLowerCase())){
			datalist = new ArrayList<DataNew>();
			if("txt".equals(suffix.toLowerCase()) || "csv".equals(suffix.toLowerCase())){
				position = (int) ReadFileNew.readTextByPos(datalist, filePath, pos, lines);
			}else if("xls".equals(suffix.toLowerCase()) || "xlsx".equals(suffix.toLowerCase()) ){
				position = (int)ReadFileNew.readExcelByPos(datalist, filePath, pos, lines);
			}
			if(position<0){
				isNext = "false";
			}
/*			int count;*/
		/*	if ("txt".equals(suffix.toLowerCase())) {
				datalist = ReadFileNew.readtxt(filePath);
				count = ReadFileNew.txtlen(filePath);
			} else if ("csv".equals(suffix.toLowerCase())) {
				datalist = ReadFileNew.readcsv(filePath);
				count = ReadFileNew.csvlen(filePath);
				
			} else if ("xls".equals(suffix.toLowerCase()) || "xlsx".equals(suffix.toLowerCase())) {
				datalist = ReadFileNew.readexcel(filePath);
				count = ReadFileNew.excellen(filePath);	
			}*/
//			System.out.println("21312");
//			System.out.println("");
//			System.out.println("datalist.size()"+datalist.size());
			//对返回数据的处理
			array =new JSONArray();
			for(int i = 0;i<datalist.size();i++){
				List<String> rowData = datalist.get(i).getData();
				JSONArray arr = new JSONArray();
		//		System.out.println("rowData.size()"+rowData.size());
				for(int j=0;j<rowData.size();j++){
					arr.put(rowData.get(j));
				}
				array.put(arr);
			}
		}/*else if ("jpg".equals(suffix.toLowerCase()) || "jpeg".equals(suffix.toLowerCase()) || "png".equals(suffix.toLowerCase())) {
			
		}*/
//		System.out.println("array:"+array.toString());
		map = new HashMap<String, Object>();
		map.put("jsonData", array.toString());
		map.put("pos",position);
		map.put("isNext",isNext);
//		map.put("type","text");
		return "dynamicViewSuccess";
	}
}
