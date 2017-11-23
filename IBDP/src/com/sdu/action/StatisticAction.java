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

public class StatisticAction extends ActionSupport{

	  private File Statistics_file;
      private String Statistics_fileContentType;
      private String Statistics_fileFileName;
      private String[] Statistics_work;
      private String Statistics_column;
      private String hasheader;
      private String savePath;
	public File getStatistics_file() {
		return Statistics_file;
	}
	public void setStatistics_file(File statistics_file) {
		Statistics_file = statistics_file;
	}
	public String getStatistics_fileContentType() {
		return Statistics_fileContentType;
	}
	public void setStatistics_fileContentType(String statistics_fileContentType) {
		Statistics_fileContentType = statistics_fileContentType;
	}
	public String getStatistics_fileFileName() {
		return Statistics_fileFileName;
	}
	public void setStatistics_fileFileName(String statistics_fileFileName) {
		Statistics_fileFileName = statistics_fileFileName;
	}
	
	public String getHasheader() {
		return hasheader;
	}
	public void setHasheader(String hasheader) {
		this.hasheader = hasheader;
	}
	public String[] getStatistics_work() {
		return Statistics_work;
	}
	public void setStatistics_work(String[] statistics_work) {
		Statistics_work = statistics_work;
	}
	public String getStatistics_column() {
		return Statistics_column;
	}
	public void setStatistics_column(String statistics_column) {
		Statistics_column = statistics_column;
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
		InputStream is = new FileInputStream(Statistics_file);
    	String uploadPath=ServletActionContext.getServletContext().getRealPath(savePath);    	
    	HttpServletRequest request=ServletActionContext.getRequest();
    	//request.setAttribute("uploadPath", uploadPath);
    	File toFile=new File(uploadPath,this.getStatistics_fileFileName());
    	OutputStream os = new FileOutputStream(toFile);
    	byte[]buffer=new byte[1024];
        int length=0;
    	while((length=is.read(buffer))>0)
    	{
    		os.write(buffer, 0, length);
    	}
    	is.close();
    	os.close();
   	
    	//进行求值操作
		System.out.println("运行execute函数");
    	HashMap<String, Double> sMap=computeParamter();
    	request.setAttribute("valueMap", sMap);
 	
		return SUCCESS;
    }
	public HashMap computeParamter() throws Exception
	{
		HashMap<String,Double> statistic_map=new HashMap<>();
		RConnection c = new RConnection();  
		REXP x = c.eval("R.version.string");
	    System.out.println(x.asString());  
		 
		String workPath="D:/MyEclipseProjects/.metadata/.me_tcat7/webapps/JiNing/MyUploadFile";
		System.out.println("setwd(\""+workPath+"\")");
		c.eval("setwd(\""+workPath+"\")");
		 //获取后缀
		String aa = Statistics_fileFileName.substring(Statistics_fileFileName.lastIndexOf("."));
		String has="TRUE";
		if(hasheader==null)
			has="FALSE";
		if(aa.equals(".xlsx"))
		  {
			  c.eval("library(openxlsx)");
			  c.eval("sta_file<-read.xlsx(\""+Statistics_fileFileName+"\",1)");
		  }else  if (aa.equals(".txt"))
		  {
			  c.eval("sta_file<-read.table(\""+Statistics_fileFileName+"\",header="+has+")");
		  }else if (aa.equals(".csv"))
		  {
			  c.eval("sta_file<-read.csv(\""+Statistics_fileFileName+"\",header="+has+")");
		  }
		  c.eval("data<-sta_file[,"+Statistics_column+"]");
		   
		for(int i=0;i<Statistics_work.length;i++)
		{
			if(Statistics_work[i].equals("mean"))
			{
				double mean=c.eval("mean(data,na.rm=T)").asDouble();
				statistic_map.put("均值", mean);
			}
			if(Statistics_work[i].equals("median"))
			{
				double median=c.eval("median(data,na.rm=T)").asDouble();
				statistic_map.put("中位数", median);
			}
			if(Statistics_work[i].equals("most"))
			{
				double most=c.eval("data[which.max(table(data))]").asDouble();
				statistic_map.put("众数", most);
			}
			if(Statistics_work[i].equals("range"))
			{
				double range=c.eval("max(data,na.rm=T)-min(data,na.rm=T)").asDouble();
				statistic_map.put("极差", range);
			}
			if(Statistics_work[i].equals("variation"))
			{
				double variation=c.eval("sqrt(var(data,na.rm=T))/(mean(data,na.rm=T))").asDouble();
				statistic_map.put("变异系数", variation);
			}
			if(Statistics_work[i].equals("std"))
			{
				double std=c.eval("sqrt(var(data,na.rm=T))").asDouble();
				statistic_map.put("标准差", std);
			}
			if(Statistics_work[i].equals("quantile1"))
			{
				double mean=c.eval("quantile(data,0.25,na.rm=T)").asDouble();
				statistic_map.put("四分之一", mean);
			}
			if(Statistics_work[i].equals("quantile3"))
			{
				double mean=c.eval("quantile(data,0.75,na.rm=T)").asDouble();
				statistic_map.put("四分之三", mean);
			}
			
		// System.out.println(Statistics_work[i]);
		}
		  c.close();
		return statistic_map;
	}
}
