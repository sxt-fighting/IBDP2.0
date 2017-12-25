package com.sdu.ToolsUse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.Properties;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.opensymphony.xwork2.Result;

public class SSHConnect {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
	//通过JSch是ssh2的一个纯Java实现。它允许你连接到一个sshd 服务器，使用端口转发，X11转发，文件传输等等。
	System.out.println(SSHConnectAndExecute("cd /home/jc/;spark-submit --class Recommendation.Recommend --master yarn    --deploy-mode client     --num-executors 10     --driver-memory 2g    --executor-memory 3g  --executor-cores 5  sparkmllib.jar hdfs://hdp1.domain:8020/user/Jar/sample_itemcf2.txt cooccurrence 20"));
	}
	public static String SSHConnectAndExecute(String cmd)
	{
		Session session=null;
		ChannelExec channelExec=null;
		 BufferedReader reader=null;
		 String result="";
		try {
			JSch jsch = new JSch(); // 创建JSch对象  
			String hostname = UrlPath.SSHURLFORAPPLICATION;
			int port = UrlPath.SSHPORTFORAPPLICATION;
			String username = UrlPath.SSHUSERFORAPPLICATION;
			String password = UrlPath.SSHPASSFORAPPLICATION;
	       
	        session = jsch.getSession(username, hostname, port); // 根据用户名，主机ip，端口获取一个Session对象  
	        session.setPassword(password); // 设置密码  
	        Properties config = new Properties();  
	        config.put("StrictHostKeyChecking", "no");  
	        session.setConfig(config); // 为Session对象设置properties  
	        int timeout = 600000000;  
	        session.setTimeout(timeout); // 设置timeout时间  
	        session.connect(); // 通过Session建立链接  
	        channelExec = (ChannelExec) session.openChannel("exec");  
	        channelExec.setCommand(cmd);  
	        channelExec.setInputStream(null);  
	        channelExec.setErrStream(System.err);  
	        channelExec.connect();  
	        InputStream in = channelExec.getInputStream();  
	        reader = new BufferedReader(new InputStreamReader(in, Charset.forName("UTF-8")));  
	        String buf = null;  
	       
	        StringBuffer sb = new StringBuffer();  
	        while ((buf = reader.readLine()) != null) {  
	            sb.append(buf);  
	            result+=buf+"\r\n";
	            System.out.println(buf);// 打印控制台输出  
	        }  
	       
	        
	      
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			  if (null != session) {  
		            session.disconnect();  
		        }  
			 try {
				reader.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			 channelExec.disconnect();  
		}
		return result;
	}

}
