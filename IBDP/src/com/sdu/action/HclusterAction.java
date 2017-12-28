package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.Rserve.RConnection;

import com.opensymphony.xwork2.ActionSupport;

public class HclusterAction extends ActionSupport{
	private File datafile;
    private String datafileFileName;
    private String datafileContentType;
    private String Metric;
    private String hasheader;
    private String cut;
    private String cutnumber;
	private String savePath;
	
	public File getDatafile() {
		return datafile;
	}

	public void setDatafile(File datafile) {
		this.datafile = datafile;
	}

	public String getDatafileFileName() {
		return datafileFileName;
	}

	public void setDatafileFileName(String datafileFileName) {
		this.datafileFileName = datafileFileName;
	}

	public String getDatafileContentType() {
		return datafileContentType;
	}

	public void setDatafileContentType(String datafileContentType) {
		this.datafileContentType = datafileContentType;
	}

	

	public String getCut() {
		return cut;
	}

	public void setCut(String cut) {
		this.cut = cut;
	}

	public String getCutnumber() {
		return cutnumber;
	}

	public void setCutnumber(String cutnumber) {
		this.cutnumber = cutnumber;
	}

	public String getMetric() {
		return Metric;
	}

	public void setMetric(String metric) {
		Metric = metric;
	}

	public String getHasheader() {
		return hasheader;
	}

	public void setHasheader(String hasheader) {
		this.hasheader = hasheader;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String execute() throws Exception
	{
		
		     HttpServletRequest request =ServletActionContext.getRequest();
			InputStream is = new FileInputStream(datafile);
	    	String uploadPath=ServletActionContext.getServletContext().getRealPath(savePath);    	
	    	
	    	File toFile=new File(uploadPath,this.getDatafileFileName());
	    	OutputStream os = new FileOutputStream(toFile);
	    	byte[]buffer=new byte[1024];
	        int length=0;
	    	while((length=is.read(buffer))>0)
	    	{
	    		os.write(buffer, 0, length);
	    	}
	    	is.close();
	    	os.close();
	    	
	    	
	    	String workPath="D:/MyEclipseProjects/.metadata/.me_tcat7/webapps/JiNing/MyUploadFile";
	    	if(!new File(workPath).exists()) {
	    	    new File(workPath).mkdirs();
	    	  }
	    	RConnection c = new RConnection();
	    	System.out.println("Rserve连接成功");
	    	if(hasheader==null)
	    		hasheader="FALSE";
	    	else {
				hasheader="TRUE";
			}
	    	String filename =datafileFileName.substring(0, datafileFileName.lastIndexOf("."));
	    	c.eval("setwd(\""+workPath+"\")");
	    	c.eval("library(openxlsx)");c.eval("library(useful)");        		
	    	//System.out.println("datafile <- read.table(\""+workPath+"/"+datafileFileName+"\",header="+hasheader+",sep=\",\")");
	    	c.eval("datafile <- read.table(\""+workPath+"/"+datafileFileName+"\",header="+hasheader+",sep=\",\")");      	  
	    	
	    	c.eval("sink(\""+filename+".txt\")");
	    	//System.out.println("result <- hclust(dist(datafile),method=\""+Metric+"\")");
			c.eval("result <- hclust(dist(datafile),method=\""+Metric+"\")");
			c.eval("print(result)");
			
			c.eval("png(\""+filename+".png\" , bg=\"transparent\")");
			c.eval("print(plot(result,labels=FALSE,main=\""+Metric+"\"))");
			System.out.println(cut);
			if(cut!=null)
			{
				System.out.println("执行");
				c.eval("print(rect.hclust(result,k="+cutnumber+",border=\"red\"))");
			}
			
			c.eval("sink()");
			c.eval("dev.off()");
			c.close();
			
			request.setAttribute("result.txt", workPath+"/"+filename+".txt");
	    	String imgPath=savePath.substring(1, savePath.length());
			request.setAttribute("picture", imgPath+"/"+filename+".png");
	    	System.out.println("成功返回");
		  return SUCCESS;
	}
}
