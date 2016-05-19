package com.jam.test;
/**
 * @author by Jam 2015-2-11 上午11:11:01
 */
public class Test_reference_02 {
	
	public static void main(String[] args) {
		Demo3 d = new Demo3();
		d.setI(200);
		System.out.println(d.getI());
		d.fun(d);
		System.out.println(d.getI());
	}

}
class Demo3{
	private int i =50;

	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}
void fun(Demo3 t){
	t.i=100;
}
}

