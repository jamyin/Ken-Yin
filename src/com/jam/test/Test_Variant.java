package com.jam.test;

public class Test_Variant {

	/**
	 * @author by Jam
	 * 2015-2-9 上午11:23:15
	 * 测试static
	 */
	public static int staticVar = 0;
	public int instanceVar = 0;
	public Test_Variant(){
	staticVar++;
	instanceVar++;
	System.out.println("staticVar=" + staticVar + ",instanceVar="+ instanceVar);
	}
	public static void main(String[] args) {
	Test_Variant t1=new Test_Variant();
	System.out.println(t1);
	Test_Variant t2=new Test_Variant();
	System.out.println(t2);
	Test_Variant t3=new Test_Variant();
	System.out.println(t3);
	Test_Variant t4=new Test_Variant();
	System.out.println(t4);
	
	}

}
