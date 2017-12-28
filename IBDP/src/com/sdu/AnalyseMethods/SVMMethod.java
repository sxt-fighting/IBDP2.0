package com.sdu.AnalyseMethods;

import org.json.JSONArray;
import org.json.JSONObject;
import org.rosuda.REngine.Rserve.RConnection;

import com.sdu.ToolsUse.DataFileHibernate;
import com.sdu.ToolsUse.HDFSTools;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class SVMMethod extends BasicMethod{
	public DataFile beiginAnalyse(int index, DataFile dataFile, Admin user, Project project, JSONObject projectJSON, JSONArray algorithmJSON)
	{
		String filepath=dataFile.getD_localpath();
		String dataFileName=dataFile.getD_name();	
		JSONObject algorithm_obj=algorithmJSON.getJSONObject(index); 
		JSONArray params= algorithm_obj.getJSONArray("param");
		//String hasheader=params.getJSONObject(0).getString("value");
		String y=params.getJSONObject(0).getString("value");
		String x=params.getJSONObject(1).getString("value");
		
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
    		
 
 	c.eval("library(e1071)");
 	c.eval("library(caret)");
 	//c.eval("Sys.setenv(SPARK_HOME='/usr/hdp/2.4.3.0-227/spark')");
 	//c.eval("Sys.setenv(JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.65-3.b17.el7.x86_64')");
 	

 	//c.eval("Sys.setenv(HADOOP_CONF_DIR='/usr/hdp/current/hadoop-client/conf')");
 	//c.eval("Sys.setenv(YARN_CONF_DIR='/etc/hadoop/2.4.3.0-227/0')");
 	//master = "yarn-client", version="1.6.0", spark_home = '/opt/cloudera/parcels/CDH/lib/spark/'
 	c.eval("datafile[,\""+y+"\"]=as.factor(datafile[,\""+y+"\"])");
 	c.eval("svm.model <- svm("+y+"~"+x+", data=datafile)");
	
 	String resultFileName=dataFileName.substring(0,dataFileName.lastIndexOf('.'))+"_SVM";
 	System.out.println("开始写入结果文件:"+resultFileName);
 	//假如文件是中间文件的话，文件类别为IntermediateFile，存储为Rdata数据
 	//假如文件是结果文件的话，文件类别为ResultFile，存储为txt数据或者是图片
 	 	if(index==algorithmJSON.length()-1)
		{
 	
			
	 		c.eval("sink(\""+resultFileName+".txt\")");
			c.eval("print(predict(svm.model,datafile))");
			c.eval("sink()");
			//生成结果文件并进行保存修改数据库
		
			//保存txt
			resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName, savePath+"/"+resultFileName+".txt","ResultFile");
			DataFileHibernate.saveDataFile(resultFile);
			HDFSTools.LoadSingleFileToHDFS(resultFile);
	
			//通知分析完成
			FormResultFileAndAdvice.FormAdvice(user, project);
		}
	 	else
	 	{
	 		resultFileName="datafile.Rdata";
	 		c.eval("save(fit,\""+resultFileName+"\" )");
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
