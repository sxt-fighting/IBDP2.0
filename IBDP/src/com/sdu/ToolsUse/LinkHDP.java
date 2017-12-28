package com.sdu.ToolsUse;

import org.rosuda.REngine.Rserve.RConnection;

public class LinkHDP {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
/*	
		RConnection c=null;
		try {
			c = new RConnection("211.87.227.53");
			System.out.println("Rserve连接成功");
	    	;
			c.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
*/
    String abc="12312，3123";
    abc=abc.replaceAll("，", ",");
    System.out.println(abc);
	}

}
