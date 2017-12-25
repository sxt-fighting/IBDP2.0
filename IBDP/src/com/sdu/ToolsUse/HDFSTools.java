package com.sdu.ToolsUse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class HDFSTools {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
      try {
    	  DataFile dataFile=new DataFile();
    	  dataFile.setD_localpath("D:/user/xy.csv");
    	 // dataFile.setD_type("resultfile");
    	  Project project =new Project();
    	  project.setP_id(12);
    	  dataFile.setD_project(project);
		//HDFSToFileSystem("iris_RF.txt");
    	  loadFileToHDFS(dataFile);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	/**
	 * 
	 * @param userid 用户id	
	 * @param projectid 项目id
	 * @param fileType 文件类别（DataFiles, ResultFiles）
	 * @param datafileFileName 文件名称
	 * @throws Exception 上传平台本地文件到hdfs上
	 */
	public static void loadFileToHDFS(DataFile datafile) throws Exception
	{
		//String username, String projectname, String fileType, String datafileFileName
		System.out.println("uploadtoHDFS Task"+System.currentTimeMillis());
		//Admin userAdmin=datafile.getD_admin();
		Project project=datafile.getD_project();
	    String localdir=datafile.getD_localpath();
	    localdir=localdir.substring(0,localdir.lastIndexOf('/'));
	    //String dstdir="hdfs://211.87.227.9:8020/user/root/IBDP2/"+project.getP_id()+ "/"+datafile.getD_type();
	    String dstdir="hdfs://211.87.227.9:8020/user/acceptFile/"+project.getP_id();
	    
	    System.out.println(localdir+" to "+dstdir);
	    uploadLocalDirToHDFS(localdir, dstdir);
	}
	
	//将本地目录下的所有文件上传到hdfs中
	public static boolean uploadLocalDirToHDFS(String localdir,String hdfsDir) throws Exception{
		File file = new File(localdir);
		File[] files = file.listFiles();
		for(int i = 0;i < files.length;i++){
			File f = files[i];
			System.out.println("上传文件："+files[i].getName());
			if(f.isDirectory()){
				uploadLocalDirToHDFS(f.getPath(), hdfsDir+"/"+files[i].getName());
			}else{
				copyFile(f.getPath(),hdfsDir+"/"+files[i].getName());
			}
		}
		return true;	
	}
	//将文件上传到hdfs中
	  public static boolean copyFile(String localfile , String hdfsfile) throws Exception{  
	        System.out.println(localfile+" to  "+hdfsfile);  
	        
	        System.setProperty("hadoop.home.dir", "D:\\hadoop-2.7.4\\hadoop-2.7.4");
		    System.setProperty("HADOOP_COMMON_LIB_NATIVE_DIR", "D:/hadoop-2.7.4/hadoop-2.7.4/lib/native");
		    System.setProperty("HADOOP_OPTS", "D:/hadoop-2.7.4/hadoop-2.7.4/lib");
	        
	        File file = new File(localfile);   
	        InputStream in = new FileInputStream(file);  
	        Configuration configuration=new Configuration();
	        Path path=new Path(hdfsfile);
	        FileSystem fs=path.getFileSystem(configuration);
	      //  System.setProperty("hadoop.home.dir", "/usr/hdp/2.4.3.0-227/hadoop");
		   //  System.setProperty("HADOOP_COMMON_LIB_NATIVE_DIR", "/usr/hdp/2.4.3.0-227/hadoop/lib/native");
		   //  System.setProperty("HADOOP_OPTS", "/usr/hdp/2.4.3.0-227/hadoop/lib");
		     
	        
			     
	        OutputStream out = fs.create(path);
	        IOUtils.copyBytes(in, out, 4096, true);        
	        return true;  
	    }  
		//将单个文件上传到hdfs中
	  public static boolean LoadSingleFileToHDFS(DataFile dataFile) throws Exception{  
	        
	        System.setProperty("hadoop.home.dir", "D:\\hadoop-2.7.4\\hadoop-2.7.4");
		    System.setProperty("HADOOP_COMMON_LIB_NATIVE_DIR", "D:/hadoop-2.7.4/hadoop-2.7.4/lib/native");
		    System.setProperty("HADOOP_OPTS", "D:/hadoop-2.7.4/hadoop-2.7.4/lib");
		    Project project=dataFile.getD_project();
		    String dstdir="hdfs://211.87.227.9:8020/user/acceptFile/"+project.getP_id()+ "/"+dataFile.getD_type()+"/"+dataFile.getD_name();
		    
	        File file = new File(dataFile.getD_localpath());   
	        InputStream in = new FileInputStream(file);  
	        Configuration configuration=new Configuration();
	        Path path=new Path(dstdir);
	        FileSystem fs=path.getFileSystem(configuration);
	      //  System.setProperty("hadoop.home.dir", "/usr/hdp/2.4.3.0-227/hadoop");
		   //  System.setProperty("HADOOP_COMMON_LIB_NATIVE_DIR", "/usr/hdp/2.4.3.0-227/hadoop/lib/native");
		   //  System.setProperty("HADOOP_OPTS", "/usr/hdp/2.4.3.0-227/hadoop/lib");
		     	     
	        OutputStream out = fs.create(path);
	        IOUtils.copyBytes(in, out, 4096, true);        
	        return true;  
	    }  
	public static void CreatHDFSFile(byte[]buffer,Path dfs) throws Exception
	{
		Configuration configuration=new Configuration();
		//byte[]buffer="hello".getBytes();
		FileSystem hdfs=FileSystem.get(configuration);
		//Path dfs =new Path("test");
		FSDataOutputStream outputStream=hdfs.create(dfs);
		outputStream.write(buffer,0,buffer.length);
		outputStream.close();
	}
	public static void HDFSToFileSystem(String hdfsPath,String filePath) throws Exception
	{
		Configuration configuration=new Configuration();
	    Path hdfsFilePath=new Path(hdfsPath);
	//    System.setProperty("hadoop.home.dir", "D:\\hadoop-2.7.4\\hadoop-2.7.4");
 	//     System.setProperty("HADOOP_COMMON_LIB_NATIVE_DIR", "D:\\hadoop-2.7.4\\hadoop-2.7.4\\lib\\native");
 	//     System.setProperty("HADOOP_OPTS", "D:\\hadoop-2.7.4\\hadoop-2.7.4\\lib");
 	     FileSystem hdfs=hdfsFilePath.getFileSystem(configuration);
	 
	    Path dst=new Path(filePath);
		
	    hdfs.copyToLocalFile(dst,hdfsFilePath);
	    FileStatus files[]=hdfs.listStatus(dst);
	    for (FileStatus file : files) {
			System.out.println(file.getPath());
		}
	}
}
