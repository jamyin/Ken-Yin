package com.jam.test;

public class Test_1 {
	/**
	 * @author by Jam 2015-2-10 上午9:14:49
	 */
	void doSomething() {
		String s = "";
		int l = s.length();
		System.out.println(l);
	}
	public static void main(String[] args) {
		new C1().pX();
		Test_1 t=new Test_1();
		t.doSomething();
	}
}

interface A1 {
	int x = 0;
}

class B1 {
	 static int x = 1; //為啥要是static
}

class C1 extends B1 implements A1 {
	public void pX() {
		System.out.println(A1.x);
		System.out.println(B1.x);
	}
}
	

