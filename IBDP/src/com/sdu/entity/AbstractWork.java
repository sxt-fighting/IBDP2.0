package com.sdu.entity;

import java.sql.Timestamp;

/**
 * AbstractWork entity provides the base persistence definition of the Work
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractWork implements java.io.Serializable {

	// Fields

	private Integer workid;
	private Admin admin;
	private String username;
	private Integer worknumber;
	private String workcontent;
	private String workfile;
	private String reusltText;
	private String resultTxt;
	private String resultPng;
	private Timestamp workdate;

	// Constructors

	/** default constructor */
	public AbstractWork() {
	}

	/** minimal constructor */
	public AbstractWork(Admin admin, String username, Integer worknumber,
			String workcontent, Timestamp workdate) {
		this.admin = admin;
		this.username = username;
		this.worknumber = worknumber;
		this.workcontent = workcontent;
		this.workdate = workdate;
	}

	/** full constructor */
	public AbstractWork(Admin admin, String username, Integer worknumber,
			String workcontent, String workfile, String reusltText,
			String resultTxt, String resultPng, Timestamp workdate) {
		this.admin = admin;
		this.username = username;
		this.worknumber = worknumber;
		this.workcontent = workcontent;
		this.workfile = workfile;
		this.reusltText = reusltText;
		this.resultTxt = resultTxt;
		this.resultPng = resultPng;
		this.workdate = workdate;
	}

	// Property accessors

	public Integer getWorkid() {
		return this.workid;
	}

	public void setWorkid(Integer workid) {
		this.workid = workid;
	}

	public Admin getAdmin() {
		return this.admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getWorknumber() {
		return this.worknumber;
	}

	public void setWorknumber(Integer worknumber) {
		this.worknumber = worknumber;
	}

	public String getWorkcontent() {
		return this.workcontent;
	}

	public void setWorkcontent(String workcontent) {
		this.workcontent = workcontent;
	}

	public String getWorkfile() {
		return this.workfile;
	}

	public void setWorkfile(String workfile) {
		this.workfile = workfile;
	}

	public String getReusltText() {
		return this.reusltText;
	}

	public void setReusltText(String reusltText) {
		this.reusltText = reusltText;
	}

	public String getResultTxt() {
		return this.resultTxt;
	}

	public void setResultTxt(String resultTxt) {
		this.resultTxt = resultTxt;
	}

	public String getResultPng() {
		return this.resultPng;
	}

	public void setResultPng(String resultPng) {
		this.resultPng = resultPng;
	}

	public Timestamp getWorkdate() {
		return this.workdate;
	}

	public void setWorkdate(Timestamp workdate) {
		this.workdate = workdate;
	}

}