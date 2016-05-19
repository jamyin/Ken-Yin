package com.jam.singleton;
/**
 * 理解单例模式
 * @author YIn
 * @time:2015年8月19日 上午10:06:48
 */
public class Test_singleton02 {
	/**
	 * @author YIn
	 * @time:2015年8月19日 上午10:06:48
	 */
	private Test_singleton02(){
		System.out.println("access 私有构造!");
	}
	private static Test_singleton02 instance  = new Test_singleton02();
	void getInstance(){
		System.out.println(instance);
	}
	public static void main(String[] args) {
		System.out.println("=======================");
		Test_singleton02 a = new Test_singleton02(); 
		Test_singleton02 b = new Test_singleton02(); 
		Test_singleton02 c = new Test_singleton02(); 
		System.out.println("=======================");
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println("=======================");
		a.getInstance();
		b.getInstance();
		c.getInstance();
		System.out.println("=======================");
		a.getInstance();
	}

}
