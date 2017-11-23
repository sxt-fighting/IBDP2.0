package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.Rserve.RConnection;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

public class RegreesionAction extends ActionSupport{
    private File datafile;
    private String datafileFileName;
    private String datafileContentType;
    private String formula;
    private String hasheader;
	private String savePath;
 	
	public String getFormula() {
		return formula;
	}

	public String getHasheader() {
		return hasheader;
	}

	public void setFormula(String formula) {
		this.formula = formula;
	}
	
	public void setHasheader(String hasheader) {
		this.hasheader = hasheader;
	}
	
    public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public File getDatafile() {
		return datafile;
	}
	public void setDatafile(File datafile) {
		this.datafile = datafile;
	}
	public String getDatafileFileName() {
		return datafileFileName;
	}
	public void setDatafileFileName(String datafileFileName) {
		this.datafileFileName = datafileFileName;
	}
	public String getDatafileContentType() {
		return datafileContentType;
	}
	public void setDatafileContentType(String datafileContentType) {
		this.datafileContentType = datafileContentType;
	}
	public String execute() throws Exception
    { 
		    HttpServletRequest request =ServletActionContext.getRequest();
    		InputStream is = new FileInputStream(datafile);
        	String uploadPath=ServletActionContext.getServletContext().getRealPath(savePath);    	
        	
        	File toFile=new File(uploadPath,this.getDatafileFileName());
        	OutputStream os = new FileOutputStream(toFile);
        	byte[]buffer=new byte[1024];
            int length=0;
        	while((length=is.read(buffer))>0)
        	{
        		os.write(buffer, 0, length);
        	}
        	is.close();
        	os.close();
        	String workPath="D:/MyEclipseProjects/.metadata/.me_tcat7/webapps/JiNing/MyUploadFile";
        	if(!new File(workPath).exists()) {
        	    new File(workPath).mkdirs();
        	  }
        	RConnection c = new RConnection();
        	System.out.println("Rserve连接成功");
        	//System.out.println(formula);
        	String filename =datafileFileName.substring(0, datafileFileName.lastIndexOf("."));
        	c.eval("setwd(\""+workPath+"\")");
        	c.eval("library(openxlsx)");        		
        	c.eval("datafile <- read.xlsx(\""+workPath+"/"+datafileFileName+"\",1)");      	  
    		c.eval("sink(\""+filename+".txt\")");
    		//System.out.println("fit <- lm("+formula+",datafile)");
    		c.eval("fit <- lm("+formula+",datafile)");
    		c.eval("print(summary(fit))");
    		double[] coefficient=c.eval("round(coefficients(fit),4)").asDoubles();
    		c.eval("sink()");
    		c.close();
    		String []items=formula.split("~|[+]");
    		String resultText="";
    		if(items.length>0)
    		{
    			resultText=items[0]+"="+coefficient[0];
    			for(int i=1; i< coefficient.length;i++)
    			 {
       			 if(coefficient[i]>=0)	
    			 resultText+="+"+coefficient[i]+""+items[i];
    			 else if(coefficient[i]<0)
    		     resultText+=""+coefficient[i]+""+items[i];
    			 }
    		}
    		request.setAttribute("resultText","由此可得，新的预测等式为 "+resultText);
        	request.setAttribute("result.txt", workPath+"/"+filename+".txt");
        	System.out.println("成功返回");
    	return SUCCESS;
    	
    }
}
