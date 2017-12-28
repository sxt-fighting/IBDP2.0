package com.sdu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.struts2.ServletActionContext;
import org.rosuda.REngine.Rserve.RConnection;


import com.opensymphony.xwork2.ActionSupport;
import com.sdu.ToolsUse.FileTransferClient;
import com.sdu.ToolsUse.HDFSTools;
import com.sdu.ToolsUse.SshCommandExcute;

public class RunSparkAction extends ActionSupport{
	private File jarfile;
    private String jarfileFileName;
    private String jarfileContentType;
    
	private List<File> datafile;
    private List<String> datafileFileName;
    private List<String> datafileContentType;
    private String MainClass;
    private String argument;
	private String savePath;


	public File getJarfile() {
		return jarfile;
	}

	public void setJarfile(File jarfile) {
		this.jarfile = jarfile;
	}

	public String getJarfileFileName() {
		return jarfileFileName;
	}

	public void setJarfileFileName(String jarfileFileName) {
		this.jarfileFileName = jarfileFileName;
	}

	public String getJarfileContentType() {
		return jarfileContentType;
	}

	public void setJarfileContentType(String jarfileContentType) {
		this.jarfileContentType = jarfileContentType;
	}

	

	public List<File> getDatafile() {
		return datafile;
	}

	public void setDatafile(List<File> datafile) {
		this.datafile = datafile;
	}

	public List<String> getDatafileFileName() {
		return datafileFileName;
	}

	public void setDatafileFileName(List<String> datafileFileName) {
		this.datafileFileName = datafileFileName;
	}

	public List<String> getDatafileContentType() {
		return datafileContentType;
	}

	public void setDatafileContentType(List<String> datafileContentType) {
		this.datafileContentType = datafileContentType;
	}

	
	public String getMainClass() {
		return MainClass;
	}

	public void setMainClass(String mainClass) {
		MainClass = mainClass;
	}

	public String getArgument() {
		return argument;
	}

	public void setArgument(String argument) {
		this.argument = argument;
	}
	
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String execute() throws Exception
	{
		//创建jar存放的hdfs目录
		System.out.println(jarfileFileName+" "+datafileFileName.get(0)+" "+MainClass+" "+argument);
		String hdfsJar="hdfs://211.87.227.9:8020/user/Jar/"+jarfileFileName;
		String hdfsJarData="hdfs://211.87.227.9:8020/user/Jar/";
    	
		//保存jar文件并上传
		
		InputStream is = new FileInputStream(jarfile);
		 
    	String uploadPath=ServletActionContext.getServletContext().getRealPath(savePath);    	
    	
    	File toFile=new File(uploadPath,this.getJarfileFileName());
    	OutputStream os = new FileOutputStream(toFile);
    	byte[]buffer=new byte[1024];
        int length=0;
    	while((length=is.read(buffer))>0)
    	{
    		os.write(buffer, 0, length);
    		
    	}
    	is.close();
    	os.close();
    	System.out.println(jarfileFileName+"上传成功!");
	      //上传到hdfs
    	Configuration configuration=new Configuration();
		Path path=new Path(hdfsJar);
		FileSystem hdfs=path.getFileSystem(configuration);
        hdfs.copyFromLocalFile(new Path(uploadPath+"/"+jarfileFileName), path);
	    
		//将文件通过socket上传到平台所在目录下/home/jc
	    	 FileTransferClient client = new FileTransferClient(); // 启动客户端连接  
	          client.sendFile(uploadPath+"/"+jarfileFileName); // 传输文件  
	    //	上传数据文件;
	    	String datafiles="";
	    	for(int i = 0; i < datafile.size();i++)
	    	  {  
	         // 先存本地再上传到hdfs中
	    		InputStream input = new FileInputStream(datafile.get(i));
	        	
	        	File file=new File(uploadPath,datafileFileName.get(i));
	        	OutputStream outputStream = new FileOutputStream(file);
	        	
	        		try{  
	                    byte[] b = new byte[1024];  
	                    int m = 0;  
	                    while ((m = input.read(b)) > 0) {  
	                    	outputStream.write(b,0,b.length);
	                		
	                    }  
	                }catch(Exception e){  
	                    e.printStackTrace();  
	                    ServletActionContext.getServletContext().setAttribute("errorMsg", datafileFileName.get(i) + "上传过程中发生未知错误，请联系管理员。上传失败！");  
	                    return "error";  
	                }finally{  
	                    input.close();  
	                    outputStream.close();  
	                    //删除临时文件  
	                   datafile.get(i).delete();  
	                }  
	        		 hdfs.copyFromLocalFile(new Path(uploadPath+"/"+datafileFileName.get(i)), new Path(hdfsJarData+"/"+datafileFileName.get(i)));
	        		 FileTransferClient anotherclient = new FileTransferClient(); // 启动客户端连接  
	     	        
	        		 anotherclient.sendFile(uploadPath+"/"+datafileFileName.get(i));
	    		/*
	    		//直接上传到hdfs
	    		datafiles=datafiles+hdfsJarData+datafileFileName.get(i)+" ";
	    		InputStream input = new FileInputStream(datafile.get(i));
	    		Configuration conf=new Configuration();
	    		Path p=new Path("hdfs://211.87.227.9:8020/user/Jar/");
	    		FileSystem fs=p.getFileSystem(conf);
	    		FSDataOutputStream outputStream=fs.create(new Path("hdfs://211.87.227.9:8020/user/Jar/"+datafileFileName.get(i)));


	    		 byte[] b = new byte[1024];  
                 int m = 0;
                 progress=0;
                 while ((m = input.read(b)) > 0) {  
                 	  outputStream.write(b,0,b.length);
                 	  progress += m;  
                      System.out.print("| " + (100*progress/datafile.get(i).length()) + "% |");  
               
                 }
	    		input.close();
	    		outputStream.close();
	    		*/
	        	System.out.println(datafileFileName.get(i)+"上传成功!");
	            }  
	    	//提交运行命令
	      String command1="cd /home/jc/";
	      String command2 = "spark-submit --class "+MainClass+" --master yarn    --deploy-mode client     --num-executors 10     --driver-memory 2g    --executor-memory 3g  --executor-cores 5  "+jarfileFileName+" "+hdfsJarData+argument;
		  String command=command1+";"+command2;
		  System.out.println(command);
	      String result = new SshCommandExcute().runApplicationHDFS(command);
	      System.out.println("执行结果："+result);
	     
	    	
	    	
		  return SUCCESS;
	}
}
//将文件直接上传到hdfs上 
/*
Configuration configuration=new Configuration();
		Path path=new Path(hdfsJar);
		FileSystem hdfs=path.getFileSystem(configuration);
		 InputStream is = new FileInputStream(jarfile);
		 FSDataOutputStream os=hdfs.create(path);
	     byte[]buffer=new byte[1024];
	        int length=0;
	        long progress=0;
	    	while((length=is.read(buffer))>0)
	    	{
	    		os.write(buffer, 0, length);
	    	    progress += length;  
                System.out.print("| " + (100*progress/jarfile.length()) + "% |");  
         
	    	}
	    	is.close();
	    	os.close();
	    	
	    	//上传数据文件
	    	for(int i = 0; i < datafile.size();i++)
	    	  {  
	    
	    		datafiles=datafiles+hdfsJarData+datafileFileName.get(i)+" ";
	    		InputStream input = new FileInputStream(datafile.get(i));
	    		Configuration conf=new Configuration();
	    		Path p=new Path("hdfs://211.87.227.9:8020/user/Jar/");
	    		FileSystem fs=p.getFileSystem(conf);
	    		FSDataOutputStream outputStream=fs.create(new Path("hdfs://211.87.227.9:8020/user/Jar/"+datafileFileName.get(i)));


	    		 byte[] b = new byte[1024];  
                 int m = 0;
                 progress=0;
                 while ((m = input.read(b)) > 0) {  
                 	  outputStream.write(b,0,b.length);
                 	  progress += m;  
                      System.out.print("| " + (100*progress/datafile.get(i).length()) + "% |");  
               
                 }
	    		input.close();
	    		outputStream.close();
	        	System.out.println(datafileFileName.get(i)+"上传成功!");
	            } 
*/