package com.sdu.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sdu.biz.impl.AdviceBizImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.Advice;

public class AdviceAction extends ActionSupport{
	private AdviceBizImpl adviceBiz;
	private List<Advice> list;
	private Map<String,Object> map;
	private int a_id;
	//--------------------------------
	public List<Advice> getList() {
		return list;
	}
	
	public Map<String, Object> getMap() {
		return map;
	}

	public void setAdviceBiz(AdviceBizImpl adviceBiz) {
		this.adviceBiz = adviceBiz;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	//----------------------------------
	
	public String QueryNotRead(){
		list = new ArrayList<Advice>();
		map = new HashMap<String, Object>();
		list = adviceBiz.getNotReadById(1);
		if(list.size()>0){
			JSONArray ja = new JSONArray(list);
			map.put("count",list.size());
			map.put("data", ja.toString());
		}else{
			map.put("count", 0);
		}
		return SUCCESS;
	}
	public String markRead(){
		map = new HashMap<String,Object>();
		map.put("message","success");
		adviceBiz.markRead(a_id);
		return SUCCESS;
	}
}
