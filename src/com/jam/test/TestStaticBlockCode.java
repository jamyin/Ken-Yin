package com.jam.test;

public class TestStaticBlockCode {
	/**
	 * @author by Jam
	 * 2015-2-25 上午9:16:10
	 */
	static{
		System.out.println("静态代码块优于main方法执行");
		System.exit(1);
	}
}
