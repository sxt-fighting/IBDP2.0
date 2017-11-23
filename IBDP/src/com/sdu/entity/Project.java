package com.sdu.entity;

import java.io.Serializable;
import java.util.Set;

public class Project extends AbstractProject implements Serializable {

	public Project() {
		
	}

	public Project(Integer p_id, String p_name, String p_describe,
			String p_createTime, Admin p_admin, Set p_datefile, Model p_model) {
		super(p_id, p_name, p_describe, p_createTime, p_admin, p_datefile, p_model);
		// TODO Auto-generated constructor stub
	}

	public Project(String p_name, String p_describe, String p_createTime) {
		super(p_name, p_describe, p_createTime);
		// TODO Auto-generated constructor stub
	}

	
}
