package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Response;
import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

import com.opensymphony.xwork2.ActionSupport;

public class RunMyR extends ActionSupport{
	private File Rfile;
    private String RfileContentType;
    private String RfileFileName;
    
    private File Rdatafile;
    private String RdatafileContentType;
    private String RdatafileFileName;
    
    private String savePath;
	public File getRfile() {
		return Rfile;
	}

	public void setRfile(File rfile) {
		Rfile = rfile;
	}

	public String getRfileContentType() {
		return RfileContentType;
	}

	public void setRfileContentType(String rfileContentType) {
		RfileContentType = rfileContentType;
	}

	public String getRfileFileName() {
		return RfileFileName;
	}

	public void setRfileFileName(String rfileFileName) {
		RfileFileName = rfileFileName;
	}

	public File getRdatafile() {
		return Rdatafile;
	}

	public void setRdatafile(File rdatafile) {
		Rdatafile = rdatafile;
	}

	public String getRdatafileContentType() {
		return RdatafileContentType;
	}

	public void setRdatafileContentType(String rdatafileContentType) {
		RdatafileContentType = rdatafileContentType;
	}

	public String getRdatafileFileName() {
		return RdatafileFileName;
	}

	public void setRdatafileFileName(String rdatafileFileName) {
		RdatafileFileName = rdatafileFileName;
	}
	
	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String execute() throws Exception
	{
		//上传R包
		InputStream is = new FileInputStream(Rfile);
    	String uploadPath=ServletActionContext.getServletContext().getRealPath(savePath);    	
    	String workPath="D:/MyEclipseProjects/.metadata/.me_tcat7/webapps/JiNing/MyUploadFile";
    	HttpServletRequest request=ServletActionContext.getRequest();
    	String filepath =RfileFileName.substring(0, RfileFileName.lastIndexOf("."));
    	workPath=workPath+"/"+filepath;
    	System.out.println(workPath);
    	if(!new File(workPath).exists()) {
    	    new File(workPath).mkdirs();
    	  }
    	File toFile=new File(workPath,this.getRfileFileName());
    	OutputStream os = new FileOutputStream(toFile);
    	byte[]buffer=new byte[1024];
        int length=0;
    	while((length=is.read(buffer))>0)
    	{
    		os.write(buffer, 0, length);
    	}
    	is.close();
    	os.close();
    	//上传数据
    	if(Rdatafile!=null)
    	{
    	System.out.println("上传data数据");
    	InputStream is1 = new FileInputStream(Rdatafile);
        File toFile1=new File(workPath,this.getRdatafileFileName());
        OutputStream os1 = new FileOutputStream(toFile1);
    	byte[]buffer1=new byte[1024];
        length=0;
    	while((length=is1.read(buffer1))>0)
    	{
    		os1.write(buffer1, 0, length);
    	}
    	is1.close();
    	os1.close();
    	}
    	//运行R
    	RConnection c = new RConnection();
    	System.out.println("Rserve连接成功");
    	//System.out.println("setwd(\""+workPath+"\")");
    	c.eval("setwd(\""+workPath+"\")");
    	//System.out.println("sink(\""+filepath+".txt\")");
		c.eval("sink(\""+filepath+".txt\")");
		
		c.eval("png(\""+filepath+".png\" , bg=\"transparent\")");
        c.eval("source('"+RfileFileName+"',print.eval = TRUE)");
		c.eval("sink()");
		c.eval("dev.off()");
    	c.close();
    	
        request.setAttribute("result.txt", workPath+"/"+filepath+".txt");
    	String imgPath=savePath.substring(1, savePath.length())+"/"+filepath;
		request.setAttribute("picture", imgPath+"/"+filepath+".png");
    	return SUCCESS;
	}
	
}
