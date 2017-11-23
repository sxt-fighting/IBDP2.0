package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

import com.opensymphony.xwork2.ActionSupport;

public class PCAAction extends ActionSupport{

	  private File PCAfile;
      private String PCAfileContentType;
      private String PCAfileFileName;
      private String PCAcolumn;
      private String hasheader;
      private String savePath;
	
	
	public File getPCAfile() {
		return PCAfile;
	}
	public void setPCAfile(File pCAfile) {
		PCAfile = pCAfile;
	}
	public String getPCAfileContentType() {
		return PCAfileContentType;
	}
	public void setPCAfileContentType(String pCAfileContentType) {
		PCAfileContentType = pCAfileContentType;
	}
	public String getPCAfileFileName() {
		return PCAfileFileName;
	}
	public void setPCAfileFileName(String pCAfileFileName) {
		PCAfileFileName = pCAfileFileName;
	}
	public String getHasheader() {
		return hasheader;
	}
	public void setHasheader(String hasheader) {
		this.hasheader = hasheader;
	}
	
	
	public String getPCAcolumn() {
		return PCAcolumn;
	}
	public void setPCAcolumn(String pCAcolumn) {
		PCAcolumn = pCAcolumn;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String execute() throws Exception
    {
		//将文件写入内存中
		InputStream is = new FileInputStream(PCAfile);
    	String uploadPath=ServletActionContext.getServletContext().getRealPath(savePath);    	
    	HttpServletRequest request=ServletActionContext.getRequest();
    	//request.setAttribute("uploadPath", uploadPath);
    	File toFile=new File(uploadPath,this.getPCAfileFileName());
    	OutputStream os = new FileOutputStream(toFile);
    	byte[]buffer=new byte[1024];
        int length=0;
    	while((length=is.read(buffer))>0)
    	{
    		os.write(buffer, 0, length);
    	}
    	is.close();
    	os.close();
   	  //创建工作目录
    	String workPath="D:/MyEclipseProjects/.metadata/.me_tcat7/webapps/JiNing/MyUploadFile";
    	if(!new File(workPath).exists()) {
    	    new File(workPath).mkdirs();
    	  }
    	if(hasheader==null)
    		hasheader="FALSE";
    	else {
			hasheader="TRUE";
		}
    	//进行求值操作
    	RConnection c = new RConnection();
		System.out.println("Rserve连接成功");
		c.eval("setwd(\""+workPath+"\")");
    	c.eval("library(sparklyr)");
    	c.eval("library(dplyr)");
    	c.eval("library(ggplot2)");
    	c.eval("sc <- spark_connect(master = \"local\")");
    	System.out.println("datafile <- read.csv(\""+workPath+"/"+PCAfileFileName+"\",header="+hasheader+",sep=\",\")");
    	c.eval("datafile <- read.csv(\""+workPath+"/"+PCAfileFileName+"\",header="+hasheader+",sep=\",\")");      	  
    	
    	c.eval("data_tbl <- copy_to(sc, datafile, \"datafile\", overwrite = TRUE)");
    	System.out.println("pca_model <- data_tbl %>% select("+PCAcolumn+") %>% ml_pca()");
    	c.eval("pca_model <- data_tbl %>% select("+PCAcolumn+") %>% ml_pca()");
    	c.eval("sink(\""+PCAfileFileName+"pca.txt\")");
    	c.eval("print(pca_model)");
    	c.eval("sink()");
    	request.setAttribute("result.txt", workPath+"/"+PCAfileFileName+"pca.txt");
    	//System.out.println(model);
		c.close();
 	
		return SUCCESS;
    }
	
}
