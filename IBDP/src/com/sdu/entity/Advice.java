package com.sdu.entity;

import java.io.Serializable;

public class Advice extends AbstractAdvice implements Serializable {

	public Advice() {
	}

	public Advice(Integer a_id, String a_name, String a_content, String a_time,
			Boolean a_isread, String a_type, Admin advice_admin) {
		super(a_id, a_name, a_content, a_time, a_isread, a_type, advice_admin);
		
	}

	public Advice(Integer a_id, String a_name) {
		super(a_id, a_name);
		
	}

	
	
}
