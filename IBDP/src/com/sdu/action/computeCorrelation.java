package com.sdu.action;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.apache.catalina.core.ApplicationContext;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

import com.opensymphony.xwork2.ActionSupport;

public class computeCorrelation extends ActionSupport {
	private String uploadFileFileName;
    private String chosework;
    private String uploadFileContentType;
	private String savePath;
    private String chosecolumn;
    public String getSavePath() {
  		return savePath;
  	}
  	public void setSavePath(String savePath) {
  		this.savePath = savePath;
  	}
  	public String getChosecolumn() {
  		return chosecolumn;
  	}
  	public void setChosecolumn(String chosecolumn) {
  		this.chosecolumn = chosecolumn;
  	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}
	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}
	public String getUploadFileFileName() {
		return uploadFileFileName;
	}
	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}
	public String getChosework() {
		return chosework;
	}
	public void setChosework(String chosework) {
		this.chosework = chosework;
	}
    public void ggplot() throws Exception
    {
    	RConnection re = new RConnection(); //开始独占工作空间
    	 
    	double[] xx = {1,2,3}; //生成两个二维数组
    	double[] yy = {4,5,9};
    	 
    	File tempFile = null;
    	re.assign("x", xx); //给R的变量赋值
        re.assign("y", yy);
        
        tempFile = File.createTempFile("test-", ".jpg"); //把图像生成到文件
        String filePath = tempFile.getAbsolutePath();
        
        System.out.println(filePath);
     //   logger.info("Plot file to be produced:" + filePath);
        re.eval("jpeg('" + StringEscapeUtils.escapeJava(filePath) + "')");
        re.eval("qqplot(x,y)"); //绘图
        re.eval("dev.off()");
        re.close();
    }
	public String execute() throws Exception
    {
	  RConnection c = new RConnection();  
	  REXP x = c.eval("R.version.string");
      System.out.println(x.asString());  
	  String cor_method="pearson";
	  if(chosework.equals("kendall系数"))
		  cor_method="kendall";
	  else if(chosework.equals("spearman系数"))
		  cor_method="spearman";
	  HttpServletRequest request=ServletActionContext.getRequest();
	  String imgPath=savePath.substring(1, savePath.length());
	  String workPath="D:/MyEclipseProjects/.metadata/.me_tcat7/webapps/JiNing/MyUploadFile";
	  System.out.println("setwd(\""+workPath+"\")");
	  c.eval("setwd(\""+workPath+"\")");
	  c.eval("library(openxlsx)");
	
	  c.eval("cordata <- read.xlsx(\""+workPath+"/"+uploadFileFileName+"\",1)");
	  double [][]cormatrix=c.eval("cor(cordata[,c("+chosecolumn+")],method='"+cor_method+"')").asDoubleMatrix();
	  //double [][]cormatrix=c.eval("round(cor(cordata[,c("+chosecolumn+")],method='"+cor_method+"'),6)").asDoubleMatrix();
	  System.out.println("matrix计算完成");
	  request.setAttribute("corMatrix",cormatrix);
	  c.eval("png(file=\"correlation.png\", bg=\"transparent\")");
	  System.out.println("开始画");
	  //c.eval("print(ggplot(as.data.frame(rbind(c(1,2,3),c(1,9,8)))))");
	   c.eval("print(GGally::ggpairs(cordata[,c("+chosecolumn+")]))");     
	 // c.eval("qqplot(c(1,3,4),c(7,6,2))"); 
	  System.out.println("结束画图") ;
	  c.eval("dev.off()");
      c.close();
      request.setAttribute("picture",imgPath+"/correlation.png");
	  
	 return SUCCESS;	
    }
}
