package com.sdu.entity;

import java.io.Serializable;
import java.util.Date;

public abstract class AbstractDataFile implements Serializable {

	private Integer d_id;
	private String d_name;
	private String d_size;
	private String d_type;//判断文件类型是分析文件还是结果文件
	private String d_suffix;//后缀名
	private String d_createTime;
	private String d_localpath;//路径
	private String d_HDFSpath;//HDFS路径
	private Admin d_admin;//数据所属的用户
	private Project d_project;
	private String d_hasheader;
	public String getD_hasheader() {
		return d_hasheader;
	}


	public void setD_hasheader(String d_hasheader) {
		this.d_hasheader = d_hasheader;
	}


	public AbstractDataFile() {
		
	}
	
	
	public AbstractDataFile(String d_name, String d_size, String d_suffix) {
		this.d_name = d_name;
		this.d_size = d_size;
		this.d_suffix = d_suffix;
	}

	

	public AbstractDataFile(Integer d_id, String d_name, String d_size,
			String d_type, String d_suffix, String d_createTime,
			String d_localpath, String d_HDFSpath, Admin d_admin,
			Project d_project) {
		this.d_id = d_id;
		this.d_name = d_name;
		this.d_size = d_size;
		this.d_type = d_type;
		this.d_suffix = d_suffix;
		this.d_createTime = d_createTime;
		this.d_localpath = d_localpath;
		this.d_HDFSpath = d_HDFSpath;
		this.d_admin = d_admin;
		this.d_project = d_project;
	}


	public Integer getD_id() {
		return d_id;
	}
	public void setD_id(Integer d_id) {
		this.d_id = d_id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_size() {
		return d_size;
	}
	public void setD_size(String d_size) {
		this.d_size = d_size;
	}
	public String getD_createTime() {
		return d_createTime;
	}
	public void setD_createTime(String d_createTime) {
		this.d_createTime = d_createTime;
	}
	public String getD_type() {
		return d_type;
	}
	public void setD_type(String d_type) {
		this.d_type = d_type;
	}
	public String getD_suffix() {
		return d_suffix;
	}
	public void setD_suffix(String d_suffix) {
		this.d_suffix = d_suffix;
	}
	public String getD_localpath() {
		return d_localpath;
	}
	public void setD_localpath(String d_localpath) {
		this.d_localpath = d_localpath;
	}
	public String getD_HDFSpath() {
		return d_HDFSpath;
	}
	public void setD_HDFSpath(String d_HDFSpath) {
		this.d_HDFSpath = d_HDFSpath;
	}
	public Admin getD_admin() {
		return d_admin;
	}
	public void setD_admin(Admin d_admin) {
		this.d_admin = d_admin;
	}
	public Project getD_project() {
		return d_project;
	}
	public void setD_project(Project d_project) {
		this.d_project = d_project;
	}
	
	
	
	
}
