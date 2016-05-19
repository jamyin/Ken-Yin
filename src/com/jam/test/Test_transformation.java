package com.jam.test;
/**
 * 测试多态之向上及向下转型
 * @author by Jam
 * 2015-2-26 上午10:33:40
 */
public class Test_transformation {
	public static void main(String[] args) {
		B_01 b1=new B_01();
		A_01 a1=b1;          //向上自动转型
		a1.fun1();
		a1.fun2();
		System.out.println("======");
		A_01 a2=new B_01();  //向上自动转型
		B_01 b2=(B_01) a2;   //向下强制转型
		b2.fun1();
		b2.fun2();
		b2.fun3();
		
		/* 不能直接向上转型，向上转型之前一定要先进行向下转型，否则会运行时会出现错误
		A_01 a3=new A_01();
		B_01 b3=(B_01) a3;
		b3.fun1();
		b3.fun2();
		b3.fun3()*/;
		
	}
}
class A_01{
	public void fun1(){
		System.out.println("A-fun1");
	}
	public void fun2(){
		System.out.println("A-fun2");
	}
}
class B_01 extends A_01{
	public void fun1(){
		System.out.println("B-fun1");
	}
	public void fun3(){
		System.out.println("B-fun3");
	}
}