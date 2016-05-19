package com.jam.test;
/**
 * 在抽象类里面定义接口(同理，在接口里面也可定义内部抽象类，再引申-->在抽象类内部可以定义多个抽象类，在接口里面可以定义多个接口)
 * @author by Jam
 * 2015-2-27 下午1:27:23
 */
public class Test_InnerClass {
public static void main(String[] args) {
	A12.B12 b = new C12().new D12();
	b.fun2();
}
}
abstract class A12{                 //在抽象类里面定义接口
	public abstract void fun1();
	interface B12{
		public void fun2();	
	}
}
class C12 extends A12{

	public void fun1() {
		System.out.println("==C12==");
	}
	class D12 implements B12{

		public void fun2() {
			System.out.println("==D12==");
		}
		
	}
}