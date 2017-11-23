package com.sdu.entity;

import java.io.Serializable;

public abstract class AbstractAdvice implements Serializable {

	private Integer a_id;
	private String a_name;
	private String a_content;//内容
	private String a_time;
	private Boolean a_isread;//是否已读
	private String a_type;
	private Admin advice_admin;
	
	
	public AbstractAdvice() {
		
	}
	public AbstractAdvice(Integer a_id, String a_name) {
		this.a_id = a_id;
		this.a_name = a_name;
	}
	public AbstractAdvice(Integer a_id, String a_name, String a_content,
			String a_time, Boolean a_isread, String a_type, Admin advice_admin) {
		this.a_id = a_id;
		this.a_name = a_name;
		this.a_content = a_content;
		this.a_time = a_time;
		this.a_isread = a_isread;
		this.a_type = a_type;
		this.advice_admin = advice_admin;
	}
	public Integer getA_id() {
		return a_id;
	}
	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getA_time() {
		return a_time;
	}
	public void setA_time(String a_time) {
		this.a_time = a_time;
	}
	public Boolean getA_isread() {
		return a_isread;
	}
	public void setA_isread(Boolean a_isread) {
		this.a_isread = a_isread;
	}
	public String getA_type() {
		return a_type;
	}
	public void setA_type(String a_type) {
		this.a_type = a_type;
	}
	public Admin getAdvice_admin() {
		return advice_admin;
	}
	public void setAdvice_admin(Admin advice_admin) {
		this.advice_admin = advice_admin;
	}
		
}
