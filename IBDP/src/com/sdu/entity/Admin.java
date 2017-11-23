package com.sdu.entity;

import java.util.Set;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */
public class Admin extends AbstractAdmin implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String name, String password) {
		super(name, password);
	}
	/** full constructor */
	public Admin(Integer id, String name, String password, String company,
			String telephone, String email, Set a_project, Set a_model,
			Set a_datafile, Set admin_advices) {
		super(id, name, password, company, telephone, email, a_project, a_model,
				a_datafile, admin_advices);
		
	}

}
