package com.sdu.AnalyseMethods;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;
import org.rosuda.REngine.Rserve.RConnection;

import com.sdu.ToolsUse.AdviceHibernate;
import com.sdu.ToolsUse.DataFileHibernate;
import com.sdu.ToolsUse.HDFSTools;
import com.sdu.entity.Admin;
import com.sdu.entity.Advice;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class DplyrMethods extends BasicMethod{
   
	//collect
	public DataFile beiginAnalyse(int index, DataFile dataFile, Admin user, Project project, JSONObject projectJSON, JSONArray algorithmJSON)
	{
		System.out.println("Dplyr Packages");
		//获取collect所需参数
		String filepath=dataFile.getD_localpath();
		String dataFileName=dataFile.getD_name();	
		JSONObject algorithm_obj=algorithmJSON.getJSONObject(index); 
		String method_name=algorithm_obj.getString("method");
		JSONArray params= algorithm_obj.getJSONArray("param");
		String variable=null;
		
    	DataFile resultFile=new DataFile();//要返回的文件
    	RConnection c=null;
		try {
		 c= new RConnection();
		 System.out.println("Rserve链接成功，开始分析任务");
		String savePath=filepath.substring(0,filepath.lastIndexOf('/'));
		System.out.println("setwd(\""+savePath+"\")");
		  c.eval("setwd(\""+savePath+"\")");
		  c.eval("library(openxlsx)"); 
    	String aa = dataFileName.substring(dataFileName.lastIndexOf("."));
    	
    	if(aa.equals(".xlsx"))
		  {
    		c.eval("datafile <- read.xlsx(\""+dataFileName+"\",1)");
		  }else  if (aa.equals(".txt"))
		  {
			  c.eval("datafile <- read.table(\""+dataFileName+"\",header="+dataFile.getD_hasheader()+")");
		
		  }else if (aa.equals(".csv"))
		  {
			  c.eval("datafile<-read.csv(\""+dataFileName+"\",header="+dataFile.getD_hasheader()+",sep=\",\")");
		  }else if(aa.equals(".Rdata"))
		  {
			  c.eval("load(\""+dataFileName+"\")");
		  }
    		
 	c.eval("library(sparklyr)");
 	c.eval("library(dplyr)");
 	c.eval("library(ggplot2)");
 	//c.eval("sc<-spark_connect(master = \"local\" )"); 
 	System.out.println("spark连接成功");
 	//开始考虑具体的数据清理算法
 	if(method_name.equals("select"))
 	{
 		variable=params.getJSONObject(0).getString("value");
 		variable=variable.replaceAll("，", ",");
 	 	c.eval("datafile<-select(datafile,c("+variable+"))");
 	}
	if(method_name.equals("filter"))
 	{
 		variable=params.getJSONObject(0).getString("value");
 		variable=variable.replaceAll("，", ",");
 	 	c.eval("datafile<-filter(datafile,"+variable+")");
 	}
	if(method_name.equals("distinct"))
 	{
 		variable=params.getJSONObject(0).getString("value");
 		variable=variable.replaceAll("，", ",");
 		String returnVariable =params.getJSONObject(1).getString("value");
 		if(returnVariable.equals(variable))
 	 	   c.eval("datafile<-distinct(datafile,"+variable+")");
 		else if(returnVariable.equals("all"))
 			c.eval("datafile<-distinct(datafile,"+variable+", .keep_all = TRUE)");
 	}
	if(method_name.equals("sample_n"))
 	{
 		variable=params.getJSONObject(0).getString("value");
 	    String replace=params.getJSONObject(1).getString("value");
 	 	c.eval("datafile<-sample_n(datafile,"+variable+",replace="+replace.toUpperCase()+")");
 	}
	if(method_name.equals("na"))
 	{
 		variable=params.getJSONObject(0).getString("value");
 		// String naMethod=params.getJSONObject(1).getString("value");
 		 if(variable.equals("all"))
 		 {
 			c.eval("datafile<-na.omit(datafile)");
 		 }
 		 else
 	 	c.eval("datafile<-datafile[!is.na(datafile[,"+variable+"],]");
 	}
		
 	
 	String resultFileName=dataFileName.substring(0,dataFileName.lastIndexOf('.'))+"_"+method_name;
 	System.out.println("开始写入结果文件:"+resultFileName);
 	//假如文件是中间文件的话，文件类别为IntermediateFile，存储为Rdata数据
 	//假如文件是结果文件的话，文件类别为ResultFile，存储为txt数据或者是图片
 	if(index==algorithmJSON.length()-1)
	{
 		if(aa.equals("txt"))
 		{
 		resultFileName=resultFileName+".txt";
 	    c.eval("sink(\""+resultFileName+"\")");
		c.eval("print(as.data.frame(datafile))");
		c.eval("sink()");
 		}else {
			c.eval("write.csv(datafile,\""+resultFileName+".csv)\"");
		}
		//生成结果文件并进行保存修改数据库
		resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName, savePath+"/"+resultFileName,"ResultFile");
		 
	    resultFile.setD_type("ResultFile");
		DataFileHibernate.saveDataFile(resultFile);
		HDFSTools.LoadSingleFileToHDFS(resultFile);
			
		//通知分析完成
		FormResultFileAndAdvice.FormAdvice(user, project);
	}
 	else
 	{
 		resultFileName=resultFileName+".Rdata";
 		c.eval("save(datafile,file=\""+resultFileName+"\" )");
 		resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName, savePath+"/"+resultFileName,"IntermediateFile");
		resultFile.setD_type("IntermediateFile");
 	}
 	//c.eval("save(bayes_predict,"+resultFileName+")");
	
 //	c.shutdown();
	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	}finally{
		c.close();
		
		System.out.println("Rserve连接关闭");
	}
		return resultFile;
	}
}
