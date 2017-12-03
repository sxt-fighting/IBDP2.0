package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.sdu.ToolsUse.MysqlConnect;
import com.sdu.ToolsUse.ReadFileNew;
import com.sdu.entity.DataNew;



public class ReadFileToShowAction {
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

}
