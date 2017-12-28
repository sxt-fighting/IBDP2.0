package com.sdu.ToolsUse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;


import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;

public class SshCommandExcute {
	
	public List<String> getStringList(String command) throws IOException {
		List<String> list = new ArrayList<String>();
		String hostname = UrlPath.SSHURLFORAPPLICATION;
		int port = UrlPath.SSHPORTFORAPPLICATION;
		String username = UrlPath.SSHUSERFORAPPLICATION;
		String password = UrlPath.SSHPASSFORAPPLICATION;
		Connection conn = new Connection(hostname, port);
		Session ssh = null;

		// 连接到主机
		conn.connect();
		// 使用用户名和密码校验
		boolean isconn = conn.authenticateWithPassword(username, password);
		if (!isconn) {
			System.out.println("用户名称或者是密码不正确");
		} else {
			System.out.println("已经连接OK");
			ssh = conn.openSession();
			ssh.execCommand(command);
			InputStream is = new StreamGobbler(ssh.getStdout());
			BufferedReader brs = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			while (true) {
				// System.out.println(brs.readLine());
				String line = brs.readLine();
				if (line == null) {
					break;
				}
				list.add(line);
			}
		}
		// 连接的Session和Connection对象都需要关闭
		ssh.close();
		conn.close();

		return list;
	}
	/**
	 * 远程调用command命令，并把程序执行结果按行存储到List中
	 * @param command
	 * @return
	 */
	public List<String> runCommand(String command) {
		String hostname = UrlPath.SSHURLFORAPPLICATION;
		int port = UrlPath.SSHPORTFORAPPLICATION;
		String username = UrlPath.SSHUSERFORAPPLICATION;
		String password = UrlPath.SSHPASSFORAPPLICATION;
		Connection conn = new Connection(hostname, port);
		Session ssh = null;
		List<String> list=new ArrayList<String>();
		try {
			// 连接到主机
			conn.connect();
			// 使用用户名和密码校验
			boolean isconn = conn.authenticateWithPassword(username, password);
			if (!isconn) {
				System.out.println("用户名称或者是密码不正确");
			} else {
				System.out.println("已经连接OK");
				ssh = conn.openSession();
				ssh.execCommand(command);
				InputStream is = new StreamGobbler(ssh.getStdout());
				BufferedReader brs = new BufferedReader(new InputStreamReader(is, "UTF-8"));
				while (true) {
					// System.out.println(brs.readLine());
					String line = brs.readLine();
					if (line == null) {
						break;
					}
					list.add(line);
				}
			}
			// 连接的Session和Connection对象都需要关闭
			ssh.close();
			conn.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public String runApplicationHDFS(String command) {
		String hostname = UrlPath.SSHURLFORAPPLICATION;
		int port = UrlPath.SSHPORTFORAPPLICATION;
		String username = UrlPath.SSHUSERFORAPPLICATION;
		String password = UrlPath.SSHPASSFORAPPLICATION;
		Connection conn = new Connection(hostname, port);
		Session ssh = null;
		String result = "";
		try {
			// 连接到主机
			conn.connect();
			// 使用用户名和密码校验
			boolean isconn = conn.authenticateWithPassword(username, password);
			if (!isconn) {
				System.out.println("用户名称或者是密码不正确");
			} else {
				System.out.println("已经连接OK");
				ssh = conn.openSession();
				ssh.execCommand(command);
				System.out.println("输出执行结果");
				InputStream is = new StreamGobbler(ssh.getStdout());
				BufferedReader brs = new BufferedReader(new InputStreamReader(is, "UTF-8"));
				String line =null;
				while ((line = brs.readLine())!=null) {
					 System.out.println(line);
				
					result += line + "\r\n";
					/*if(line.contains("候选集")){
						break;
					}*/
				}
			}
			// 连接的Session和Connection对象都需要关闭
			ssh.close();
			conn.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 运行命令
	 * 
	 * @param command
	 *            命令
	 * @return
	 */
	public String run(String command) {
		String hostname = UrlPath.SSHURLFORAPPLICATION;
		int port = UrlPath.SSHPORTFORAPPLICATION;
		String username = UrlPath.SSHUSERFORAPPLICATION;
		String password = UrlPath.SSHPASSFORAPPLICATION;
		// 指明连接主机的IP地址
		Connection conn = new Connection(hostname,port);
		Session ssh = null;
		String result = "";
		try {
			// 连接到主机
			conn.connect();
			// 使用用户名和密码校验
			boolean isconn = conn.authenticateWithPassword(username, password);
			if (!isconn) {
				System.out.println("用户名称或者是密码不正确");
			} else {
				System.out.println("已经连接OK");
				ssh = conn.openSession();
				ssh.execCommand(command);
				InputStream is = new StreamGobbler(ssh.getStdout());
				BufferedReader brs = new BufferedReader(new InputStreamReader(is, "UTF-8"));
				while (true) {
					// System.out.println(brs.readLine());
					String line = brs.readLine();
					if (line == null) {
						break;
					}
					result += line + "\r\n";
				}
			}
			// 连接的Session和Connection对象都需要关闭
			ssh.close();
			conn.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public static void main(String[] arg) {
		String command = "ls;hadoop fs -ls /";
		String line = new SshCommandExcute().run(command);
		System.out.println(line);
	}

}
