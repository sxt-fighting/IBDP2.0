package com.sdu.ToolsUse;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class SparklyrExample {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RConnection c=null;
		try {
			c = new RConnection("211.87.227.9");
			System.out.println("Rserve连接成功");
	    	c.eval("library(sparklyr)");
	    	c.eval("library(dplyr)");
	    	c.eval("library(ggplot2)");
	    	c.eval("Sys.setenv(SPARK_HOME='/usr/hdp/2.4.3.0-227/spark')");
	    	c.eval("Sys.setenv(JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.65-3.b17.el7.x86_64')");
	    	

	    	c.eval("Sys.setenv(HADOOP_CONF_DIR='/usr/hdp/current/hadoop-client/conf')");
	    	c.eval("Sys.setenv(YARN_CONF_DIR='/etc/hadoop/2.4.3.0-227/0')");
	    	REXP r = c.parseAndEval("try(sc <- spark_connect(master = 'yarn-client'),silent=TRUE)");
	    	if (r.inherits("try-error")) 
	    		System.err.println("Error: "+r.asString());
	    	else
	    	  System.out.println("链接spark成功");
	    	//c.eval("iris_tbl <- copy_to(sc, iris, \"iris\", overwrite = TRUE)");
	    	//c.eval("kmeans_model <- iris_tbl %>% select(Petal_Width, Petal_Length) %>% ml_kmeans(centers = 3)");
	    	//c.eval("sink(\"D:/kmeans.txt\")");
	    	//c.eval("print(kmeans_model)");
	    	//c.eval("sink()");
	    	//System.out.println(model);
			c.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}

}
