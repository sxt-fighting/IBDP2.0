package com.sdu.entity;

import java.io.Serializable;
import java.util.Set;

public class Model extends AbstractModel implements Serializable {

	public Model() {
		
	}

	public Model(Integer m_id, String m_name, String m_state,
			String m_describe, String m_createTime, String m_type,
			Integer m_used, Integer m_collect, Admin m_admin,
			String algorithmString, Set<Project> m_project) {
		super(m_id, m_name, m_state, m_describe, m_createTime, m_type, m_used,
				m_collect, m_admin, algorithmString, m_project);
		// TODO Auto-generated constructor stub
	}

	
	
}
