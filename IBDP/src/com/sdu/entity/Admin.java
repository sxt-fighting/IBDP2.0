package com.sdu.entity;

import java.util.Set;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */
public class Admin extends AbstractAdmin  {

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String name, String password) {
		super(name, password);
	}

	public Admin(Integer id, String name, String password, String company,
			String telephone, String email, int isAdmin, Set a_project,
			Set a_model, Set a_datafile, Set admin_advices, String imgName) {
		super(id, name, password, company, telephone, email, isAdmin, a_project,
				a_model, a_datafile, admin_advices, imgName);
	}
	
}
