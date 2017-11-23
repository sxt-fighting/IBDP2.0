package com.sdu.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sdu.biz.impl.AdminBizImpl;
import com.sdu.entity.Admin;

public class LoginAndRegisterAction extends ActionSupport implements RequestAware, SessionAware{

	private String name;
	private String password;
	private String type;
	private String username;
	private String userpassword;
	private String company;
	private String phone;
	private String email;
	AdminBizImpl adminBizImpl;
	Map<String, Object> session;
	Map<String, Object> request;
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setAdminBizImpl(AdminBizImpl adminBizImpl) {
		this.adminBizImpl = adminBizImpl;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String Login()
	{
		List<Admin> list;
		if("adminlogin".equals(type))
		{
			Admin condition =new Admin();
			condition.setName(name);
			condition.setPassword(password);
			list=adminBizImpl.Login(condition);
			System.out.println(list.size());
			if(list.size()>0)
				{
				session.put("user",list.get(0));
				System.out.println(list.get(0).getId());
				System.out.println("管理员账号登陆成功");
				return "login";
				}
			
		}else {
			Admin condition =new Admin();
			condition.setName(name);
			condition.setPassword(password);
			list=adminBizImpl.Login(condition);
			if(list.size()>0)
				{
				session.put("user",list.get(0));
				System.out.println(list.get(0).getId());
				System.out.println("普通用户登陆成功");
				return "login";
				}
			
		}
	
		return "fail";
	}
	public String register()
	{
		Admin user=new Admin();
		user.setCompany(company);
		user.setEmail(email);
		user.setName(username);
		user.setPassword(userpassword);
		user.setTelephone(phone);
		System.out.println(username+" "+userpassword+" "+email+" "+phone+" "+company);
		boolean register=adminBizImpl.Register(user);
		if(register==true)
		{
			session.put("user",user);
			return "login";
		}
		return "fail";
	}
	public String logout()
	{
		session.clear();
		return "success";
	}
}
