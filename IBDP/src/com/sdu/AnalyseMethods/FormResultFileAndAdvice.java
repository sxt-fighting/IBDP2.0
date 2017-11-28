package com.sdu.AnalyseMethods;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sdu.ToolsUse.AdviceHibernate;
import com.sdu.entity.Admin;
import com.sdu.entity.Advice;
import com.sdu.entity.DataFile;
import com.sdu.entity.Project;

public class FormResultFileAndAdvice {
    
	public static DataFile formFile(Admin user, Project project,String filename,String localPath)
	{
		DataFile resultFile=new DataFile();
		resultFile.setD_admin(user);
		resultFile.setD_project(project);
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		resultFile.setD_createTime(sdf.format(date));
		resultFile.setD_name(filename);
		resultFile.setD_suffix("txt");
		resultFile.setD_hasheader("FALSE");
		resultFile.setD_localpath(localPath);
		File f= new File(localPath);  
		if (f.exists() && f.isFile())  
		        resultFile.setD_size(f.length()/1024.0+"KB");
		else {
		resultFile.setD_size("Unknown");
		}
		
		
		return resultFile;
	}
	public static void FormAdvice(Admin user, Project project)
	{
		Advice advice=new Advice();
		advice.setA_content(project.getP_name()+"分析结果完成");
		advice.setA_isread(false);
		Date date2=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		advice.setA_time(sdf.format(date2));
		advice.setA_name(project.getP_name()+"分析结果完成");
		advice.setAdvice_admin(user);
		advice.setA_type("AnalyseDone");
		AdviceHibernate.CreateAdvice(advice);
	}
}
