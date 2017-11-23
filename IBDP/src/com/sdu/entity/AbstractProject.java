package com.sdu.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public abstract class AbstractProject implements Serializable {

	private Integer p_id;
	private String p_name;
	private String p_describe;
	private String p_createTime;
	private Admin  p_admin; //拥有者
	private Set p_datefile=new HashSet(0);
	private Model p_model;
	
	public AbstractProject() {
		
	}

	

	public AbstractProject(String p_name, String p_describe, String p_createTime) {
		this.p_name = p_name;
		this.p_describe = p_describe;
		this.p_createTime = p_createTime;
	}



	public AbstractProject(Integer p_id, String p_name, String p_describe,
			String p_createTime, Admin p_admin, Set p_datefile, Model p_model) {
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_describe = p_describe;
		this.p_createTime = p_createTime;
		this.p_admin = p_admin;
		this.p_datefile = p_datefile;
		this.p_model = p_model;
	}



	public Integer getP_id() {
		return p_id;
	}


	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_createTime() {
		return p_createTime;
	}


	public void setP_createTime(String p_createTime) {
		this.p_createTime = p_createTime;
	}



	public String getP_describe() {
		return p_describe;
	}



	public void setP_describe(String p_describe) {
		this.p_describe = p_describe;
	}



	public Admin getP_admin() {
		return p_admin;
	}



	public void setP_admin(Admin p_admin) {
		this.p_admin = p_admin;
	}



	public Set getP_datefile() {
		return p_datefile;
	}



	public void setP_datefile(Set p_datefile) {
		this.p_datefile = p_datefile;
	}



	public Model getP_model() {
		return p_model;
	}



	public void setP_model(Model p_model) {
		this.p_model = p_model;
	}
	
	
}
