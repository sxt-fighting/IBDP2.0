package com.sdu.entity;

import java.io.Serializable;

public abstract class AbstractModel implements Serializable {

	private Integer m_id;
	private String m_name;//可以为空
	private String m_state;//公有、私有
	private String m_describe;//模型描述，可以为空
	private String m_createTime;
	private String m_type;
	private Integer m_used;//被使用数
	private Integer m_collect;//被收藏数
	private Admin m_admin;//
	private String algorithmString;//将模型用到的算法以JSON转化的字符串保存起来
	private Project m_project;
	
	public AbstractModel() {
		
	}
	
	

	public AbstractModel(String m_name, String m_state, String m_describe,
			String m_createTime) {

		this.m_name = m_name;
		this.m_state = m_state;
		this.m_describe = m_describe;
		this.m_createTime = m_createTime;
	}

	


	public AbstractModel(Integer m_id, String m_name, String m_state,
			String m_describe, String m_createTime, String m_type,
			Integer m_used, Integer m_collect, Admin m_admin,
			String algorithmString, Project m_project) {
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_state = m_state;
		this.m_describe = m_describe;
		this.m_createTime = m_createTime;
		this.m_type = m_type;
		this.m_used = m_used;
		this.m_collect = m_collect;
		this.m_admin = m_admin;
		this.algorithmString = algorithmString;
		this.m_project = m_project;
	}



	public Integer getM_id() {
		return m_id;
	}

	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_state() {
		return m_state;
	}

	public void setM_state(String m_state) {
		this.m_state = m_state;
	}

	public String getM_createTime() {
		return m_createTime;
	}

	public void setM_createTime(String m_createTime) {
		this.m_createTime = m_createTime;
	}

	public String getM_type() {
		return m_type;
	}

	public void setM_type(String m_type) {
		this.m_type = m_type;
	}

	public Integer getM_used() {
		return m_used;
	}

	public void setM_used(Integer m_used) {
		this.m_used = m_used;
	}

	public Integer getM_collect() {
		return m_collect;
	}

	public void setM_collect(Integer m_collect) {
		this.m_collect = m_collect;
	}



	public String getM_describe() {
		return m_describe;
	}



	public void setM_describe(String m_describe) {
		this.m_describe = m_describe;
	}



	public Admin getM_admin() {
		return m_admin;
	}



	public void setM_admin(Admin m_admin) {
		this.m_admin = m_admin;
	}



	public String getAlgorithmString() {
		return algorithmString;
	}



	public void setAlgorithmString(String algorithmString) {
		this.algorithmString = algorithmString;
	}



	public Project getM_project() {
		return m_project;
	}



	public void setM_project(Project m_project) {
		this.m_project = m_project;
	}
	
	
	
}
