package com.sdu.entity;

import java.util.List;

public class DataNew {
	private List<String> data;
	
	private int lineNo;

	public int getLineNo() {
		return lineNo;
	}

	public List<String> getData() {
		return data;
	}

	public void setData(List<String> data) {
		this.data = data;
	}
	
	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}

}
