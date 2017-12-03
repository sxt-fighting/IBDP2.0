package com.sdu.AnalyseMethods;

import org.json.JSONArray;
import org.json.JSONObject;
import org.rosuda.REngine.Rserve.RConnection;

import com.sdu.ToolsUse.DataFileHibernate;
import com.sdu.ToolsUse.HDFSTools;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class statisticsMethod extends BasicMethod{

	public DataFile beiginAnalyse(int index, DataFile dataFile, Admin user, Project project, JSONObject projectJSON, JSONArray algorithmJSON)
	{
		System.out.println("统计分析");
		//获取collect所需参数
		String filepath=dataFile.getD_localpath();
		String dataFileName=dataFile.getD_name();	
		JSONObject algorithm_obj=algorithmJSON.getJSONObject(index); 
		JSONArray params= algorithm_obj.getJSONArray("param");
		
		
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
 	String column=params.getJSONObject(0).getString("value");
	JSONArray works=params.getJSONObject(1).getJSONArray("value");
	c.eval("data<-datafile[,"+column+"]");
	String resultFileName=dataFileName.substring(0,dataFileName.lastIndexOf('.'))+"_statistics";
 	System.out.println("开始写入结果文件:"+resultFileName);
 	
	c.eval("sink(\""+resultFileName+".txt\")");
	for(int i=0;i<works.length();i++)
	{
		String workI=works.getString(i);
		//'均值','中位数','众数','极差','标准差','第一四分位数','第三四分位数
		if(workI.equals("均值"))
		{
			c.eval("print(mean(data,na.rm = T))");
		}
		if(workI.equals("中位数"))
		{
			c.eval("print(median(data,na.rm = T))");
		}
		if(workI.equals("众数"))
		{
			c.eval("print(data[which.max(table(data))])");	
		}
		if(workI.equals("极差"))
		{
			c.eval("print(max(data,na.rm=T)-min(data,na.rm=T))");			
		}
		if(workI.equals("变异系数"))
		{
		c.eval("print(sqrt(var(data,na.rm=T))/(mean(data,na.rm=T)))");			
		}
		if(workI.equals("标准差"))
		{
			c.eval("print(sqrt(var(data,na.rm=T)))");	
		}
		if(workI.equals("第一四分位数"))
		{
			c.eval("print(quantile(data,0.25,na.rm=T))");				
		}
		if(workI.equals("第三四分位数"))
		{
			c.eval("print(quantile(data,0.75,na.rm=T))");				
		}
	}
	c.eval("sink()");	
 	//假如文件是中间文件的话，文件类别为IntermediateFile，存储为Rdata数据
 	//假如文件是结果文件的话，文件类别为ResultFile，存储为txt数据或者是图片
 	if(index==algorithmJSON.length()-1)
	{
 		
		//生成结果文件并进行保存修改数据库
		resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName+".txt", savePath+"/"+resultFileName+".txt","ResultFile");
		 
	    resultFile.setD_type("ResultFile");
		DataFileHibernate.saveDataFile(resultFile);
		HDFSTools.LoadSingleFileToHDFS(resultFile);
			
		//通知分析完成
		FormResultFileAndAdvice.FormAdvice(user, project);
	}
 	else
 	{
 		resultFileName=resultFileName+".Rdata";
 		c.eval("save(data,file=\""+resultFileName+"\")");
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
