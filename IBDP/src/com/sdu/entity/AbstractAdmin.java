package com.sdu.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractAdmin entity provides the base persistence definition of the Admin
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAdmin implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String password;
	private String company;
	private String telephone;
	private String email;
    private Set a_project=new HashSet(0);//拥有的项目
    private Set a_model=new HashSet(0);//创建的模型
    private Set a_datafile = new HashSet(0);//导入的数据
    private Set admin_advices=new HashSet(0);//日志通知
	// Constructors

	/** default constructor */
	public AbstractAdmin() {
	}

	/** minimal constructor */
	public AbstractAdmin(String name, String password) {
		this.name = name;
		this.password = password;
	}

	

	public AbstractAdmin(Integer id, String name, String password,
			String company, String telephone, String email, Set a_project,
			Set a_model, Set a_datafile, Set admin_advices) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.company = company;
		this.telephone = telephone;
		this.email = email;
		this.a_project = a_project;
		this.a_model = a_model;
		this.a_datafile = a_datafile;
		this.admin_advices = admin_advices;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set getA_project() {
		return a_project;
	}

	public void setA_project(Set a_project) {
		this.a_project = a_project;
	}

	public Set getA_model() {
		return a_model;
	}

	public void setA_model(Set a_model) {
		this.a_model = a_model;
	}

	public Set getA_datafile() {
		return a_datafile;
	}

	public void setA_datafile(Set a_datafile) {
		this.a_datafile = a_datafile;
	}

	public Set getAdmin_advices() {
		return admin_advices;
	}

	public void setAdmin_advices(Set admin_advices) {
		this.admin_advices = admin_advices;
	}

	
}