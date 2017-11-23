package com.sdu.entity;

import java.sql.Timestamp;

/**
 * Work entity. @author MyEclipse Persistence Tools
 */
public class Work extends AbstractWork implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Work() {
	}

	/** minimal constructor */
	public Work(Admin admin, String username, Integer worknumber,
			String workcontent, Timestamp workdate) {
		super(admin, username, worknumber, workcontent, workdate);
	}

	/** full constructor */
	public Work(Admin admin, String username, Integer worknumber,
			String workcontent, String workfile, String reusltText,
			String resultTxt, String resultPng, Timestamp workdate) {
		super(admin, username, worknumber, workcontent, workfile, reusltText,
				resultTxt, resultPng, workdate);
	}

}
