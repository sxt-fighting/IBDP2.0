package com.sdu.AnalyseMethods;

import org.apache.tomcat.jni.Library;
import org.json.JSONArray;
import org.json.JSONObject;
import org.rosuda.REngine.Rserve.RConnection;

import com.sdu.ToolsUse.DataFileHibernate;
import com.sdu.ToolsUse.HDFSTools;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class NnetMethod extends BasicMethod{

	public DataFile beiginAnalyse(int index, DataFile dataFile, Admin user, Project project, JSONObject projectJSON, JSONArray algorithmJSON)
	{
		System.out.println("神经网络");
			
		JSONObject algorithm_obj=algorithmJSON.getJSONObject(index); 
		 String based=algorithm_obj.getString("based");
		DataFile resultFile=null;
		if(based==null||based.equals("R"))
		 resultFile=BasedOnR(index, dataFile, user, project, projectJSON, algorithmJSON);		
		else if(based.equals("Spark"))
		  resultFile=BasedOnSpark(index, dataFile, user, project, projectJSON, algorithmJSON);	
		else	
			resultFile=dataFile;
		return resultFile;
	}
	public DataFile BasedOnR(int index, DataFile dataFile, Admin user, Project project, JSONObject projectJSON, JSONArray algorithmJSON)
	{
		
		String filepath=dataFile.getD_localpath();
		String dataFileName=dataFile.getD_name();
		JSONObject algorithm_obj=algorithmJSON.getJSONObject(index); 
		JSONArray params= algorithm_obj.getJSONArray("param");
		String type=params.getJSONObject(0).getString("value");
		//String y=params.getJSONObject(1).getString("value");
	//	String x=params.getJSONObject(2).getString("value");
		String y=params.getJSONObject(1).getString("value").replaceAll("\"", "").trim();
		String x=params.getJSONObject(2).getString("value").replaceAll("\"", "").replace(" ", "");
		
		
		String size=params.getJSONObject(3).getString("value");
		String maxit=params.getJSONObject(4).getString("value");
		
    	System.out.println("链接Rserve，开始分析任务");
    	DataFile resultFile=new DataFile();//要返回的文件
    	RConnection c=null;
		try {
		c= new RConnection();
		
    	System.out.println("Rserve连接成功");
    	System.out.println("输入参数为："+filepath+ "  "+dataFileName+"  "+y+"~"+x);
    	//String  savePath="/home/jc/IBDP2/"+user.getId()+"/DataFiles";
    	String savePath=filepath.substring(0,filepath.lastIndexOf('/'));
    	System.out.println(savePath);
    	c.eval("setwd(\""+savePath+"\")");
    	c.eval("library(openxlsx)"); c.eval("library(nnet)");c.eval("library(devtools)");
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
 	//c.eval("Sys.setenv(SPARK_HOME='/usr/hdp/2.4.3.0-227/spark')");
 	//c.eval("Sys.setenv(JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.65-3.b17.el7.x86_64')");
 	

 	//c.eval("Sys.setenv(HADOOP_CONF_DIR='/usr/hdp/current/hadoop-client/conf')");
 	//c.eval("Sys.setenv(YARN_CONF_DIR='/etc/hadoop/2.4.3.0-227/0')");
 	//master = "yarn-client", version="1.6.0", spark_home = '/opt/cloudera/parcels/CDH/lib/spark/'
 	if(type.equals("回归"))
 	{
 		c.eval("model <- nnet("+y+"~"+x+", data=datafile,size="+size+",decay=5e-4,maxit="+maxit+",linout=TRUE)");
 		
 		c.eval("pred<-predict(model,datafile)");
 		
 	}else {
 		c.eval("model <- nnet("+y+"~"+x+", data=datafile,size="+size+",decay=5e-4,maxit="+maxit+")");
 	
 		c.eval("pred<-predict(model,datafile,type=\"class\")");
	}
	
	
 	String resultFileName=dataFileName.substring(0,dataFileName.lastIndexOf('.'))+"_nnet";
 	System.out.println("开始写入结果文件:"+resultFileName);
 	//假如文件是中间文件的话，文件类别为IntermediateFile，存储为Rdata数据
 	//假如文件是结果文件的话，文件类别为ResultFile，存储为txt数据或者是图片
 	 	if(index==algorithmJSON.length()-1)
		{
	 		//resultFileName=resultFileName+".txt";
	 	    c.eval("sink(\""+resultFileName+".txt\")");
	 	    
			c.eval("print(pred)");
			c.eval("print(table(datafile$"+y+", pred))");
			c.eval("sink()");
			c.eval("png(file=\""+resultFileName+".png\", bg=\"transparent\")");
			c.eval("source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')");
	 		c.eval("plot.nnet(model,max.sp=TRUE)");
	 		c.eval("dev.off()");
			//生成结果文件并进行保存修改数据库
	 		
	 		resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName+".txt", savePath+"/"+resultFileName+".txt","ResultFile");
			
			DataFileHibernate.saveDataFile(resultFile);
			HDFSTools.LoadSingleFileToHDFS(resultFile);
			
			resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName+".png", savePath+"/"+resultFileName+".png","ResultFile");
			 
			DataFileHibernate.saveDataFile(resultFile);
			HDFSTools.LoadSingleFileToHDFS(resultFile);
				
			//通知分析完成
			FormResultFileAndAdvice.FormAdvice(user, project);
		}
	 	else
	 	{
	 		resultFileName=resultFileName+".Rdata";
	 		c.eval("save(model,\""+resultFileName+"\" )");
	 		resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName, savePath+"/"+resultFileName,"IntermediateFile");
		
	 	}
	 	//c.eval("save(bayes_predict,"+resultFileName+")");
	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	}finally{
		c.close();
		System.out.println("Rserve连接关闭");
	}
		return resultFile;
	}
	public DataFile BasedOnSpark(int index, DataFile dataFile, Admin user, Project project, JSONObject projectJSON, JSONArray algorithmJSON)
	{
		
		String filepath=dataFile.getD_localpath();
		String dataFileName=dataFile.getD_name();	
		JSONObject algorithm_obj=algorithmJSON.getJSONObject(index); 
		JSONArray params= algorithm_obj.getJSONArray("param");
		//String y=params.getJSONObject(1).getString("value");
		//String x=params.getJSONObject(2).getString("value");
		String y=params.getJSONObject(1).getString("value").replaceAll("\"", "").trim();
		String x=params.getJSONObject(2).getString("value").replaceAll("\"", "").replace(" ", "");
		
		
		String size=params.getJSONObject(3).getString("value");
		String maxit=params.getJSONObject(4).getString("value");
		
    	System.out.println("链接Rserve，开始分析任务");
    	DataFile resultFile=new DataFile();//要返回的文件
    	RConnection c=null;
    	try {
		c= new RConnection();
		
    	System.out.println("Rserve连接成功");
    	System.out.println("输入参数为："+filepath+ "  "+dataFileName+"  "+y+"~"+x);
    	//String  savePath="/home/jc/IBDP2/"+user.getId()+"/DataFiles";
    	String savePath=filepath.substring(0,filepath.lastIndexOf('/'));
    	System.out.println(savePath);
    	c.eval("setwd(\""+savePath+"\")");
    	c.eval("library(openxlsx)"); c.eval("library(devtools)");
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
 	//c.eval("Sys.setenv(SPARK_HOME='/usr/hdp/2.4.3.0-227/spark')");
 	//c.eval("Sys.setenv(JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.65-3.b17.el7.x86_64')");
 	

 	//c.eval("Sys.setenv(HADOOP_CONF_DIR='/usr/hdp/current/hadoop-client/conf')");
 	//c.eval("Sys.setenv(YARN_CONF_DIR='/etc/hadoop/2.4.3.0-227/0')");
 	//master = "yarn-client", version="1.6.0", spark_home = '/opt/cloudera/parcels/CDH/lib/spark/'

 	c.eval("sc<-spark_connect(master = \"local\" )"); 
 	System.out.println("spark连接成功");
 	if(size.indexOf("，")!=-1)
		size.replaceAll("，", ",");
 	c.eval("data_tbl <- copy_to(sc, datafile, \"datafile\", overwrite = TRUE)");
	
	c.eval("model<-ml_multilayer_perceptron(data_tbl, "+y+"~"+x+", iter.max= "+maxit+", layers=c("+size+")");
	c.eval("dt_predict<-sdf_predict(model,data_tbl)");
	
 	String resultFileName=dataFileName.substring(0,dataFileName.lastIndexOf('.'))+"_MLP";
 	System.out.println("开始写入结果文件:"+resultFileName);
 	//假如文件是中间文件的话，文件类别为IntermediateFile，存储为Rdata数据
 	//假如文件是结果文件的话，文件类别为ResultFile，存储为txt数据或者是图片
 	if(index==algorithmJSON.length()-1)
	{
 		resultFileName=resultFileName+".txt";
 		c.eval("write.table(dt_predict,\""+resultFileName+"\")");
		
		//生成结果文件并进行保存修改数据库
		resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName, savePath+"/"+resultFileName,"ResultFile");
		 
		DataFileHibernate.saveDataFile(resultFile);
		HDFSTools.LoadSingleFileToHDFS(resultFile);
			
		//通知分析完成
		FormResultFileAndAdvice.FormAdvice(user, project);
	}
 	else
 	{
 		resultFileName=resultFileName+".Rdata";
 		c.eval("save(linear_model,\""+resultFileName+"\" )");
 		resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName, savePath+"/"+resultFileName,"IntermediateFile");
		resultFile.setD_type("IntermediateFile");
 	}
 	//c.eval("save(bayes_predict,"+resultFileName+")");
		
		
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
