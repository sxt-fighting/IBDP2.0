package com.sdu.AnalyseMethods;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonArray;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class BasicMethod {
    
//	public  Admin user;
//	public  Project project;
//	public 	JSONArray algorithmJSON;
//	public 	DataFile dataFile;
	
	public DataFile beiginAnalyse(int index, DataFile dataFile, Admin user, Project project, JSONObject projectJSON, JSONArray algorithmJSON)
	{
		System.out.println("basic method");
		return dataFile;
		
	}
}
