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

public class BPAction extends ActionSupport{
	private File datafile;
    private String datafileFileName;
    private String datafileContentType;
    private String formula;
    private String size;
    private String maxit;
    private String hasheader;
	private String savePath;
	private String algorithmString;	
	public File getDatafile() {
		return datafile;
	}


	
	public void setAlgorithmString(String algorithmString) {
		this.algorithmString = algorithmString;
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



	public String getFormula() {
		return formula;
	}



	public void setFormula(String formula) {
		this.formula = formula;
	}



	public String getHasheader() {
		return hasheader;
	}



	public void setHasheader(String hasheader) {
		this.hasheader = hasheader;
	}


	public String getSize() {
		return size;
	}



	public void setSize(String size) {
		this.size = size;
	}



	public String getMaxit() {
		return maxit;
	}



	public void setMaxit(String maxit) {
		this.maxit = maxit;
	}



	public String getSavePath() {
		return savePath;
	}



	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}



	public String execute() throws Exception
	{
		System.out.println("进入Bp");
		System.out.println("BP中的接受的"+algorithmString);
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
    	c.eval("library(openxlsx)");c.eval("library(nnet)");        		
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
			  c.eval("datafile <- read.table(\""+workPath+"/"+datafileFileName+"\",header="+hasheader+")");
		
		  }else if (aa.equals(".csv"))
		  {
			 // System.out.println("datafile<-read.csv(\""+workPath+"/"+datafileFileName+"\",header="+hasheader+")");
			  c.eval("datafile<-read.csv(\""+workPath+"/"+datafileFileName+"\",header="+hasheader+")");
		  }
		      	  
		c.eval("sink(\""+filename+".txt\")");
	//	System.out.println("model <- nnet("+formula+", data=datafile,size="+size+",decay=5e-4,maxit="+maxit+")");
		c.eval("model <- nnet("+formula+", data=datafile,size="+size+",decay=5e-4,maxit="+maxit+")");
		c.eval("pred<-predict(model,datafile,type=\"class\")");
		
		String []items=formula.split("~|[+]");
		c.eval("print(pred)");
		c.eval("print(table(datafile$"+items[0]+", pred))");
		c.eval("sink()");
		c.close();
		//System.out.println("");
		request.setAttribute("result.txt", workPath+"/"+filename+".txt");
    	
    	System.out.println("成功返回了");
	  return SUCCESS;
  }
}
