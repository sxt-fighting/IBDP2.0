package com.sdu.ToolsUse;

import org.rosuda.REngine.Rserve.RConnection;

public class LinkHDP {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RConnection c=null;
		try {
			c = new RConnection("211.87.227.53");
			System.out.println("Rserve连接成功");
	    	;
	    	//System.out.println(model);
			c.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
