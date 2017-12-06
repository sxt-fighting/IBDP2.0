package com.sdu.ToolsUse;

import java.util.Date;


import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;


import com.opensymphony.xwork2.ActionSupport;

/**
 * ��ѯ����������¼�
 * 
 * @author jc
 * 
 */
public class SparkRunAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String data;
	private String application;
	private String className;
	private String other;

	private String result;

	public String execute() throws Exception {
		result = "";
		System.out.println(className);
		
        String command1 = "cd /application/applicationForFile";
//        int index=application.indexOf('.');
//        String name=application.substring(0,index);
//        Date date=new Date();
//        name=name+date.getTime();
		
        String dataPath="";
        if(data!=null&&data.length()>0){
        	String[] datas=data.split(",");
        	for(int i=0;i<datas.length;i++){
        		dataPath+="/data/"+datas[i]+" ";
        	}
        }
        
        String applicationPath="/application/applicationForFile/"+application;
        //String command2 = "spark-submit --class "+className+" --master yarn    --num-executors 10  --executor-memory 3g  --executor-cores 5 "+applicationPath+" "+ dataPath+" "+other;
        String command2 = "spark-submit --class "+className+" --master yarn    --deploy-mode client     --num-executors 10     --driver-memory 2g    --executor-memory 3g  --executor-cores 5 "+applicationPath+" "+ dataPath+" "+other;
		String command=command1+";"+command2;
        result = new SshCommandExcute().runApplicationHDFS(command2);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(result);
		return null;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getApplication() {
		return application;
	}

	public void setApplication(String application) {
		this.application = application;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	
	
}