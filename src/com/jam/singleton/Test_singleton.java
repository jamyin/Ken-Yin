package com.jam.singleton;

/**
 * 测试设计模式之单例模式
 * @author by Jam
 * 2015-2-25 上午9:28:13
 */
 class  A{

	private static A instance = new A();
	private A(){
		System.out.println("私有构造");
	}
	public static A getInstance(){
		return instance;
	}
	public void print(){
		System.out.println("hello world");
	}
	
}
 public class Test_singleton{
	public static void main(String[] args) {
		A t1=A.getInstance();
		A t2=A.getInstance();
		A t3=A.getInstance();
		t1.print();
		t2.print();
		t3.print();
	}
}
