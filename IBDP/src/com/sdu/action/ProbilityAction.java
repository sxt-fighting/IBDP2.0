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

public class ProbilityAction extends ActionSupport{
	private String P_type;
    private String number;
    private String mean;
    private String sd;
	private String savePath;

	public String getP_type() {
		return P_type;
	}



	public void setP_type(String p_type) {
		P_type = p_type;
	}



	public String getNumber() {
		return number;
	}



	public void setNumber(String number) {
		this.number = number;
	}



	public String getMean() {
		return mean;
	}



	public void setMean(String mean) {
		this.mean = mean;
	}



	public String getSd() {
		return sd;
	}



	public void setSd(String sd) {
		this.sd = sd;
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
		
    	String workPath="D:/MyEclipseProjects/.metadata/.me_tcat7/webapps/JiNing/MyUploadFile";
    	if(!new File(workPath).exists()) {
    	    new File(workPath).mkdirs();
    	  }
    	RConnection c = new RConnection();
    	System.out.println("Rserve连接成功");
    	String imgPath=savePath.substring(1, savePath.length());
		
    	c.eval("setwd(\""+workPath+"\")");
    	c.eval("library(openxlsx)");   
    	c.eval("library(ggplot2)");   
    	
    	if(P_type.equals("norm"))
		  {
    		System.out.println("正态分布");
    		c.eval("sink(\"norm.txt\")");
    		c.eval("print(randnorm<-rnorm(n="+number+", mean="+mean+",sd="+sd+"))");
    		
    	    c.eval("print(randDensity<-dnorm(randnorm))");
    		c.eval("png(\"norm.png\" , bg=\"transparent\")");
			c.eval("print(ggplot(data.frame(x=randnorm,y=randDensity))+aes(x=x,y=y)+geom_point()+labs(x=\"Variables\",y=\"Density\"))");
			request.setAttribute("result.txt", workPath+"/norm.txt");
			request.setAttribute("picture", imgPath+"/norm.png");
	    	
		  }else  if (P_type.equals("binom"))
		  {
			  c.eval("sink(\"binom.txt\")");
	    		c.eval("print(binomData<-data.frame(Success=rbinom(n="+number+", size="+mean+",prob="+sd+")))");
	    	   c.eval("png(\"binom.png\" , bg=\"transparent\")");
				c.eval("print(ggplot(binomData,aes(x=Success))+geom_histogram(binwidth=1))");
				request.setAttribute("result.txt", workPath+"/binom.txt");
				request.setAttribute("picture", imgPath+"/binom.png");
		    	
		  }else if (P_type.equals("pois"))
		  {
			  System.out.println("sink(\"pois.txt\")");
			  c.eval("sink(\"pois.txt\")");
			  System.out.println("pois<-rpois(n="+number+",lambda="+mean+")");
			  c.eval("print(pois<-rpois(n="+number+",lambda="+mean+"))");
			    
	    		c.eval("png(\"pois.png\" , bg=\"transparent\")");
				//c.eval("print(ggplot(data.frame(pois),aes(x=x))+geom_histogram(binwidth=1))");
				request.setAttribute("result.txt", workPath+"/pois.txt");
				//request.setAttribute("picture", imgPath+"/pois.png");
		  }
    	
		c.eval("sink()");
		c.eval("dev.off()");
		c.close();
		
    	
    	System.out.println("成功返回");
	  return SUCCESS;
  }
}
