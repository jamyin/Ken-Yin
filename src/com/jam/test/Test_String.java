package com.jam.test;

/**
 * @author by Jam
 * 2015-2-9 下午4:38:54
 */
public class Test_String {

	public static void main(String[] args) {
		String a=new String("abc");
		String b=new String("abc");
		String c="abc";
		String d="abc";
		System.out.println(a==b);
		System.out.println(a.equals(b));
		System.out.println(a==c);
		System.out.println(c==d);
		System.out.println(c=="abc");
		System.out.println(a.hashCode());   //96354
		System.out.println(b.hashCode());   //96354
		System.out.println(c.hashCode());   //96354

	}
}
