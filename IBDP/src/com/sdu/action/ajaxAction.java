package com.sdu.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class ajaxAction extends ActionSupport implements SessionAware{
    private String address;
    Map<String, Object> session;
    
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
    
	public String execute()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
//		if(request.getAttribute("corMatrix")!=null)
//			request.removeAttribute("corMatrix");
//		if(request.getAttribute("picture")!=null)
//			request.removeAttribute("picture");
//		if(request.getAttribute("result.txt")!=null)
//			request.removeAttribute("result.txt");
		//System.out.println(request.getAttribute("picture"));
		
		if(address.equals("regression"))
			{
			 session.put("pageN","线性回归" );
			 return "regression";
			}
		else if(address.equals("MyR"))
			{
			session.put("pageN","运行自己的R程序" );
			return "MyR";
			}
		else if(address.equals("Statistics"))
			{
			session.put("pageN","统计量分析" );
			return "Statistics";
			}
		else if(address.equals("correlation"))
			{
			session.put("pageN","相关性分析" );
			return "correlation";
			}
		else if(address.equals("Logistic"))
		{
			session.put("pageN","Logistic回归" );
			return "Logistic";
		}
		else if(address.equals("Kmeans"))
			{
			session.put("pageN","k-means" );
			return "Kmeans";
			}
		else if(address.equals("PAM"))
			{
			session.put("pageN","PAM算法" );
			return "PAM";
			}
		else if(address.equals("Hcluster"))
			{
			session.put("pageN","层此聚类" );
			return "Hcluster";
			}
		else if(address.equals("DecisionTree"))
			{
			session.put("pageN","决策树" );
			return "DecisionTree";
			}
		else if(address.equals("BP"))
			{
			session.put("pageN","BP神经网络" );
			return "BP";
			}
		else if(address.equals("Apriori"))
			{
			session.put("pageN","Apriori算法" );
			return "Apriori";
			}
		else if(address.equals("Probility"))
			{
			session.put("pageN","概率分布" );
			return "Probility";
			}
		else if(address.equals("Profile"))
			{
			session.put("pageN","用户信息" );
			return "Profile";
			}
		else if(address.equals("PCA"))
		{
		session.put("pageN","PCA" );
		return "PCA";
		}
		return "basic";
	}

}
