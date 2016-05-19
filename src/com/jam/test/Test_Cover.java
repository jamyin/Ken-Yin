package com.jam.test;
/**
 * @author by Jam
 * 2015-2-25 下午6:08:13
 * 测试继承之覆盖
 */
public class Test_Cover {
	public static void main(String[] args) {
		student_05 s = new student_05();
		s.print();
	}
	
}
class person_05{
	private void print(){
		System.out.println("person");
	}
}
class student_05 extends person_05{
	 void print(){
		System.out.println("student");
	}
}
