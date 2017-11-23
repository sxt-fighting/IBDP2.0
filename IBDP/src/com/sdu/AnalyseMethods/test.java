package com.sdu.AnalyseMethods;

import java.lang.reflect.Method;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			//利用java中的反射机制
			Class cls=Class.forName("com.sdu.AnalyseMethods.bayesAction");
			Object analyseClass= cls.newInstance();
			Method analyseMethod=cls.getMethod("beiginAnalyse");
			analyseMethod.invoke(analyseClass);
			
			//利用父类化为子类之间的继承关系
			Class c=Class.forName("com.sdu.AnalyseMethods.bayesAction");
			BasicMethod basicCLass=(BasicMethod) c.newInstance();
			//basicCLass.beiginAnalyse();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
