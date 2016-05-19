package com.jam.test;
/**
 * @author by Jam
 * 2015-2-13 下午5:52:56
 */
public class Test_Codeblock {

	//构造代码块   --优于构造方法先执行，且每次实例化都会执行
	{
		int i=9;
		System.out.println(i);
	}
	//静态代码块  --最优先执行，且不管实例化多少次，都只执行一次
	static {
		int i=888;
		System.out.println(i);	
	}
	//构造方法
	Test_Codeblock(){
		System.out.println("无参构造");
	}
	public static void main(String[] args) {
		/**
		 * @author by Jam
		 * 2015-2-13 下午5:52:56
		 */
		//普通代码块
		{
			int i=1;
		System.out.println(i);
		}
		int i=111;
		System.out.println(i);
		
		//实例化对象
		new Test_Codeblock(); 
		new Test_Codeblock(); 
		new Test_Codeblock(); 
		
	}
}
