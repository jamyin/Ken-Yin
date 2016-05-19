package com.jam.test;
/**
 * @author by Jam 2015-2-11 上午11:11:01
 */
public class Test_reference_03 {
	
	public static void main(String[] args) {
		String a="coco";
		String b="coco";
		System.out.println(a==b);
		String c=new String("coco");
		System.out.println(a+"   "+a.hashCode());
		a="aoao";
		System.out.println(a+"   "+a.hashCode());
		System.out.println(b+"   "+b.hashCode());
		System.out.println(c+"   "+c.hashCode());
		System.out.println(a==b);
		System.out.println(b.equals(c));
		System.out.println(b==c);
		
		Demo1 d = new Demo1();
		System.out.println("实例化后:"+d.i);
		d.i = "haha";
		System.out.println("调用方法fun之前：" + d.i);
		d.fun(d);
		System.out.println("调用方法fun之后：" + d.i);
		fun1(d);
		System.out.println("调用方法fun1之后：" + d.i);
		
		String m="momo";
		System.out.println("调用方法fun之前：" + m);
		fun2(m);
		System.out.println("调用方法fun之前：" + m);
	}
	
	private static void fun2(String m) {
		/**
		 * @author by Jam
		 * 2015-2-11 上午11:58:18
		*/
		m="bangbang";
	}

	public static void fun1(Demo1 a){
		a.i = "xixi";
	}
}

class Demo1 {
	String i = "hehe";

	public void fun(Demo1 a) {
		/**
		 * @author by Jam 2015-2-11 上午11:14:09
		 */
		a.i = "heihei";
	}
}
