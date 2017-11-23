package com.sdu.sparklyr;

import org.rosuda.REngine.Rserve.RConnection;

public class DplyrExample {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RConnection c=null;
		try {
			c = new RConnection();
			System.out.println("Rserve连接成功");
	    	c.eval("library(dplyr)");
	    	c.eval("datafile <- read.csv(\"D:/MyEclipseProjects/.metadata/.me_tcat7/webapps/JiNing/MyUploadFile/iris.csv\",header=TRUE,sep=\",\")");      	  
	    	
	       	c.eval("kmeans_model <- datafile %>% select(1:3)");
	    	c.eval("sink(\"D:/kmeans.txt\")");
	    	c.eval("print(kmeans_model)");
	    	c.eval("sink()");
	    	//System.out.println(model);
			c.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
