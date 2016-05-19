package com.jam.test;
/**
 * @author by Jam
 * 2015-2-27 下午1:14:25
 */
public class Test_Interface_01 {
	public static void main(String[] args) {
	A5 a1=new A15();                         //向上转型（自动）
	a1.fun1();
	a1.fun2();
	System.out.println("====");
	
	A15 a2 = (A15) a1;                       //向下转型之前要先进行向下转型，否则出错
	a2.fun1();
	a2.fun2();
	a2.fun3();
	a2.fun4();
	a2.fun5();
	
	System.out.println("====");
	A15 a3=new A15();
	a3.fun1();
	a3.fun2();
	a3.fun3();
	a3.fun4();
	a3.fun5();
	}
}
interface A5{
	public void fun1();
	public void fun2();
}
interface B5{
	public void fun3();
	public void fun4();

}
interface C5 extends A5,B5{
	public void fun5();
}
class A15 implements C5{

	public void fun1() {
		System.out.println("FUN1");
		
	}

	public void fun2() {
		System.out.println("FUN2");

	}

	public void fun3() {
		System.out.println("FUN3");

	}

	public void fun4() {
		System.out.println("FUN4");

	}

	public void fun5() {
		System.out.println("FUN5");

	}
	
}