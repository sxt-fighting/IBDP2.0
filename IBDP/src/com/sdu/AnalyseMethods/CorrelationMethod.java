package com.sdu.AnalyseMethods;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

import com.sdu.ToolsUse.AdviceHibernate;
import com.sdu.ToolsUse.DataFileHibernate;
import com.sdu.ToolsUse.HDFSTools;
import com.sdu.entity.Admin;
import com.sdu.entity.Advice;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class CorrelationMethod extends BasicMethod{
	public DataFile beiginAnalyse(int index, DataFile dataFile, Admin user, Project project, JSONObject projectJSON, JSONArray algorithmJSON)
	{
		System.out.println("compute correlation");

		String filepath=dataFile.getD_localpath();
		String dataFileName=dataFile.getD_name();	
		JSONObject algorithm_obj=algorithmJSON.getJSONObject(index); 
		JSONArray params= algorithm_obj.getJSONArray("param");
		String chosecolumn=params.getJSONObject(1).getString("value");
		String chosework=params.getJSONObject(0).getString("value");
		 
		DataFile resultFile=null;
		 
		 //开始执行分析相关性
		RConnection c=null;
		 try {
			 c = new RConnection();  
			  REXP x = c.eval("R.version.string");
			  System.out.println(x.asString());  
			  String cor_method="pearson";
			  if(chosework.equals("kendall"))
				  cor_method="kendall";
			  else if(chosework.equals("spearman"))
				  cor_method="spearman";
			  
			  String savePath=filepath.substring(0,filepath.lastIndexOf('/'));
		      System.out.println(savePath);
		    	
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
				
			 
			  double [][]cormatrix=c.eval("res<-cor(datafile[,c("+chosecolumn+")],method='"+cor_method+"')").asDoubleMatrix();
			  //double [][]cormatrix=c.eval("round(cor(cordata[,c("+chosecolumn+")],method='"+cor_method+"'),6)").asDoubleMatrix();
			  System.out.println("matrix计算完成");
			 
			  String resultFileName=dataFileName.substring(0,dataFileName.lastIndexOf('.'))+"_correlation";
			  System.out.println("开始写入结果文件:"+resultFileName);
			  c.eval("png(file=\""+resultFileName+".png\", bg=\"transparent\")");
			  c.eval("print(GGally::ggpairs(datafile[,c("+chosecolumn+")]))");     
			  c.eval("dev.off()");
			  //保存图像
			  resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName+".png", savePath+"/"+resultFileName+".png","ResultFile");
			  resultFile.setD_type("ResultFile");
			  DataFileHibernate.saveDataFile(resultFile);
			  HDFSTools.LoadSingleFileToHDFS(resultFile);
			  if(index==algorithmJSON.length()-1)
				{
			 		resultFileName=resultFileName+".txt";
			 	    c.eval("sink(\""+resultFileName+"\")");
					c.eval("print(res)");
					c.eval("sink()");
					resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName, savePath+"/"+resultFileName,"ResultFile");
						 
					DataFileHibernate.saveDataFile(resultFile);
					HDFSTools.LoadSingleFileToHDFS(resultFile);
						
					//通知分析完成
					FormResultFileAndAdvice.FormAdvice(user, project);
					
				}
			 	else
			 	{
			 		resultFileName=resultFileName+".Rdata";
			 		c.eval("save(res,\""+resultFileName+"\" )");
			 		resultFile=FormResultFileAndAdvice.formFile(user, project, resultFileName, savePath+"/"+resultFileName,"IntermediateFile");
					 
			 	}
			 	
				
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
