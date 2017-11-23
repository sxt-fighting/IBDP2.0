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
		HDFSToFileSystem("iris_RF.txt");
	
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
		Admin userAdmin=datafile.getD_admin();
		Project project=datafile.getD_project();
	    String localdir=datafile.getD_localpath();
	    //String dstdir="hdfs://211.87.227.9:8020/user/root/IBDP2/"+project.getP_id()+ "/"+datafile.getD_type();
	    String dstdir="hdfs://211.87.227.9:8020/user/acceptFile/"+project.getP_id()+ "/"+datafile.getD_type();
	    
	    System.out.println(localdir+" to "+dstdir);
	    //uploadLocalDirToHDFS(localdir, dstdir);
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
	        //FileStatus status = fs.getFileStatus(new Path(dst));  
	        File file = new File(localfile);   
	        InputStream in = new FileInputStream(file);  
	        Configuration configuration=new Configuration();
	        FileSystem fs=FileSystem.get(configuration);
	      //  System.setProperty("hadoop.home.dir", "/usr/hdp/2.4.3.0-227/hadoop");
		   //  System.setProperty("HADOOP_COMMON_LIB_NATIVE_DIR", "/usr/hdp/2.4.3.0-227/hadoop/lib/native");
		   //  System.setProperty("HADOOP_OPTS", "/usr/hdp/2.4.3.0-227/hadoop/lib");
		     
	        OutputStream out = fs.create(new Path(hdfsfile));
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
	public static void HDFSToFileSystem(String filename) throws Exception
	{
		Configuration configuration=new Configuration();
	    //FileSystem hdfs=FileSystem.get(configuration);
	    Path inputDir=new Path("D://"+filename);
	    Path hdfsFilePath=new Path("hdfs://211.87.227.9:8020/user/acceptFile");
	    System.setProperty("hadoop.home.dir", "D:\\hadoop-2.7.4\\hadoop-2.7.4");
 	     System.setProperty("HADOOP_COMMON_LIB_NATIVE_DIR", "D:\\hadoop-2.7.4\\hadoop-2.7.4\\lib\\native");
 	     System.setProperty("HADOOP_OPTS", "D:\\hadoop-2.7.4\\hadoop-2.7.4\\lib");
 	     FileSystem hdfs=hdfsFilePath.getFileSystem(configuration);
	    hdfs.mkdirs(hdfsFilePath);
	    Path dst=new Path("hdfs://211.87.227.9:8020/user/acceptFile/"+filename);
		
	    hdfs.copyToLocalFile(dst,inputDir);
	    FileStatus files[]=hdfs.listStatus(dst);
	    for (FileStatus file : files) {
			System.out.println(file.getPath());
		}
	}
}
