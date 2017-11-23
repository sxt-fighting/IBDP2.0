package com.sdu.sparklyr;

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
			c = new RConnection();
			System.out.println("Rserve连接成功");
	    	c.eval("library(sparklyr)");
	    	c.eval("library(dplyr)");
	    	c.eval("library(ggplot2)");
	    	c.eval("sc <- spark_connect(master = \"local\")");
	    	c.eval("iris_tbl <- copy_to(sc, iris, \"iris\", overwrite = TRUE)");
	    	c.eval("kmeans_model <- iris_tbl %>% select(Petal_Width, Petal_Length) %>% ml_kmeans(centers = 3)");
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
