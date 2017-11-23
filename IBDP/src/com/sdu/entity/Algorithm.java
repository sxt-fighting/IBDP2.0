package com.sdu.entity;

import java.util.Date;

public class Algorithm {
	private Integer algorithmid;				
	private String name;			//算法名称
	private String type;			//算法类型
	
	public Algorithm() {
		super();
		// TODO Auto-generated constructor stub
		System.out.println("Algorithm构造函数被调用!");
	}
	public Integer getAlgorithmid() {
		return algorithmid;
	}
	public void setAlgorithmid(Integer algorithmid) {
		this.algorithmid = algorithmid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
