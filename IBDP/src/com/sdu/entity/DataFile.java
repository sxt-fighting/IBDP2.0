package com.sdu.entity;

import java.io.Serializable;
import java.util.Date;

public class DataFile extends AbstractDataFile implements Serializable {

	public DataFile() {
		
	}

	public DataFile(Integer d_id, String d_name, String d_size, String d_type,
			String d_suffix, String d_createTime, String d_localpath,
			String d_HDFSpath, Admin d_admin, Project d_project) {
		super(d_id, d_name, d_size, d_type, d_suffix, d_createTime, d_localpath,
				d_HDFSpath, d_admin, d_project);
		
	}

	public DataFile(String d_name, String d_size, String d_suffix) {
		super(d_name, d_size, d_suffix);
	}

	
	
}
