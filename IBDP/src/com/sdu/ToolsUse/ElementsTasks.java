package com.sdu.ToolsUse;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import com.sdu.AnalyseMethods.BasicMethod;
import com.sdu.biz.impl.DataFileBizImpl;
import com.sdu.biz.impl.ProjectBizImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class ElementsTasks {
	//根据json进行选择对应的算法
	private JSONObject projectJSON;
	private JSONArray algorithmJSON;
	private Admin user;
	private Project project;

	public ElementsTasks(JSONObject projectjson1,JSONArray algorithm1,Admin user1,Project pro) {
		projectJSON=projectjson1;algorithmJSON=algorithm1;user=user1;project=pro;
	}
     public void turnAlgorithm()
     {
    	 System.out.println("分发任务");
    	 System.out.println("datafileid"+projectJSON.getInt("datafileid"));
    	
    	 DataFile datafile=DataFileHibernate.GetDataFileByID((projectJSON.getInt("datafileid")));
       	 
    	 
    	 for(int i=0;i<algorithmJSON.length();i++)
    	 {
    		 JSONObject algorithm_obj=algorithmJSON.getJSONObject(i);
    		 String actionName=algorithm_obj.getString("actionName");
    		 
 			try {
 				Class c=Class.forName("com.sdu.AnalyseMethods."+actionName);
				BasicMethod basicCLass=(BasicMethod) c.newInstance();
				datafile=basicCLass.beiginAnalyse(i, datafile, user, project, projectJSON, algorithmJSON);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	/*	 if(actionName.equals("bayesAction")) 
    	 {
    		 try {
    			 JSONArray params= algorithm_obj.getJSONArray("param");
    			 String hasheader=params.getJSONObject(0).getString("value");
    			 String formula=params.getJSONObject(1).getString("value");
    			 
				bayes(datafile.getD_localpath(), datafile.getD_name(),formula,hasheader,user,project);
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	 }*/
    	 }
     }
     public String bayes(String filepath,String dataFileName, String formula,String hasheader, Admin u, Project p) throws Exception 
 	{
 	    
 			    	System.out.println("链接Rserve，开始分析任务");
 			    	RConnection c = new RConnection();
 			    	System.out.println("Rserve连接成功");
 			    	System.out.println("输入参数为："+filepath+ "  "+dataFileName+"  "+formula+"   "+hasheader);
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
 						  c.eval("datafile <- read.table(\""+dataFileName+"\",header="+hasheader+")");
 					
 					  }else if (aa.equals(".csv"))
 					  {
 						  c.eval("datafile<-read.csv(\""+dataFileName+"\",header="+hasheader+",sep=\",\")");
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
 		        	c.eval("data_tbl <- copy_to(sc, datafile, \"datafile\", overwrite = TRUE)");
 		        	System.out.println("model<-ml_naive_bayes(data_tbl,"+formula+")");
 		        	c.eval("model<-ml_naive_bayes(data_tbl,"+formula+")");
 		        	c.eval("bayes_predict<-sdf_predict(model,data_tbl)");
 			    	
 		        	String resultFileName=dataFileName.substring(0,dataFileName.lastIndexOf('.'))+"_bayes.txt";
 		        	System.out.println("开始写入结果文件:"+resultFileName);
 		        	
 		        	c.eval("sink(\""+resultFileName+"\")");
 					c.eval("print(as.data.frame(bayes_predict))");
 					c.eval("sink()");
 		        	
 		        	//c.eval("save(bayes_predict,"+resultFileName+")");
 					c.close();
 					System.out.println("Rserve连接关闭");
 					
 					//将结果文件上传到hdfs中
 					DataFile resultFile=new DataFile();
 					Date date=new Date();
 					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 					
 					resultFile.setD_createTime(sdf.format(date));
 					resultFile.setD_admin(u);
 					resultFile.setD_hasheader("false");
 					resultFile.setD_name(resultFileName);
 					resultFile.setD_suffix("txt");
 					resultFile.setD_type("resultFile");
 					resultFile.setD_project(p);
 					resultFile.setD_localpath(savePath+"/"+resultFileName);
 					File f= new File(savePath+"/"+resultFileName);  
 					if (f.exists() && f.isFile())  
 					        resultFile.setD_size(f.length()/1024.0+"");
 					else {
						resultFile.setD_size("Unknown");
					}
 					DataFileHibernate.saveDataFile(resultFile);
 					// 修改数据库
 			    	return "AnalyseDone";
 			
     	
     	 
   }



}
/*
  	<!-- 定义ElementsTasks -->
	<bean id="elementsTask" class="com.sdu.ToolsUse.ElementsTasks">
		<property name="projectBiz" ref="projectBiz" />
		<property name="dataFileBiz" ref="dataFileBiz" /> 		
	</bean>
*/