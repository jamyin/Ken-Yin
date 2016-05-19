package com.jam.singleton;

/**
 * 测试设计模式之单例模式实例--回收站
 * @author by Jam
 * 2015-8-19 上午9:28:13
 */
 class  Recyle{

	private static Recyle instance = new Recyle();   //懒汉式
	private Recyle(){
		System.out.println("good morning,我是回收站");
	}
	public static Recyle getInstance(){
		return instance;
	}
	public void delete(){
		System.out.println("file已经被删除!");
	}
	
}
 public class Test_singleton01{
	public static void main(String[] args) {
		Recyle t1=Recyle.getInstance();
		Recyle t2=Recyle.getInstance();
		Recyle t3=Recyle.getInstance();
		t1.delete();
		t2.delete();
		t3.delete();
	}
}
