package com.jam.test;
/**
 * @author by Jam 2015-2-11 上午11:11:01
 */
public class Test_reference_01 {
	public static void main(String[] args) {
		Demo d = new Demo();
		d.i = 100;
		System.out.println("调用方法之前：" + d.i);
		d.fun(d);
		System.out.println("调用方法之后：" + d.i);
	}
}

class Demo {
	int i = 50;

	public void fun(Demo a) {
		/**
		 * @author by Jam 2015-2-11 上午11:14:09
		 */
		a.i = 200;
	}
}
