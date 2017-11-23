package com.sdu.biz.impl;

import java.util.List;

import com.sdu.dao.impl.DataFileDaoImpl;
import com.sdu.dao.impl.ModelDaoImpl;
import com.sdu.entity.Model;

public class ModelBizImpl {
	private ModelDaoImpl modelDaoImpl;
	public ModelDaoImpl getModelDaoImpl() {
		return modelDaoImpl;
	}
	public void setModelDaoImpl(ModelDaoImpl modelDaoImpl) {
		this.modelDaoImpl = modelDaoImpl;
	}
	public ModelBizImpl() {
		//System.out.println("ModelBizImpl构造函数被调用");
	}
	
	
	
	public boolean addModel(Model model){//参数不应该是Model，最好是json转化的对象，将来再改
//		System.out.println("biz层：addmodel");
		return modelDaoImpl.createModel(model);
	}
	 public Model getModelById(int m_id){
		return modelDaoImpl.getModelById(m_id);
	}
}
