package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import com.opensymphony.xwork2.ActionSupport;

public class AprioriAction extends ActionSupport{
	private File datafile;
    private String datafileFileName;
    private String datafileContentType;
    private String support;
    private String confidence;
    private String sep;
    private String hasheader;
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

	public String getHasheader() {
		return hasheader;
	}



	public void setHasheader(String hasheader) {
		this.hasheader = hasheader;
	}


	public String getSupport() {
		return support;
	}



	public void setSupport(String support) {
		this.support = support;
	}



	public String getConfidence() {
		return confidence;
	}



	public void setConfidence(String confidence) {
		this.confidence = confidence;
	}



	public String getSep() {
		return sep;
	}



	public void setSep(String sep) {
		this.sep = sep;
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
    	
    	String filename =datafileFileName.substring(0, datafileFileName.lastIndexOf("."));
    	c.eval("setwd(\""+workPath+"\")");
    	c.eval("library(openxlsx)");c.eval("library(Matrix)");c.eval("library(arules)");        		
    	String aa = datafileFileName.substring(datafileFileName.lastIndexOf("."));
    	if(hasheader==null)
    		hasheader="FALSE";
    	else {
			hasheader="TRUE";
		}
    	if(aa.equals(".xlsx"))
		  {
    		c.eval("datafile <- read.xlsx(\""+workPath+"/"+datafileFileName+"\",1)");
		  }else  if (aa.equals(".txt"))
		  {
			  c.eval("datafile <- read.transactions(\""+workPath+"/"+datafileFileName+"\",format=\"basket\",sep=\""+sep+"\")");
		
		  }else if (aa.equals(".csv"))
		  {
			 // System.out.println("datafile<-read.csv(\""+workPath+"/"+datafileFileName+"\",header="+hasheader+")");
			  c.eval("datafile<-read.transactions(\""+workPath+"/"+datafileFileName+"\",format=\"basket\",sep=\",\")");
		  }
    	c.eval(" rules=apriori(datafile,parameter = list(support="+support+",confidence="+confidence+"))");
		     	  
		c.eval("sink(\""+filename+".txt\")");
	//	System.out.println("model <- nnet("+formula+", data=datafile,size="+size+",decay=5e-4,maxit="+maxit+")");
		c.eval("inspect(rules)");
		c.eval("sink()");
		c.close();
		request.setAttribute("result.txt", workPath+"/"+filename+".txt");
    	
    	System.out.println("成功返回");
	  return SUCCESS;
  }
}
