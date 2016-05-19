package com.jam.test;
/**
 * @author by Jam
 * 2015-2-13 下午5:40:18
 * Run As ->  Run Configurations...，在弹出的窗口中选择Arguments,
 * 然后在Program Arguments 文本框中输入要传入main方法的参数，最后点击下面的Run即运行。
 * 需要注意的是，main方法的参数是一数组，如果需要多个参数，则参数之间用空格隔开，
 * 在main方法中通过数组下标的方式访问任意参数。
 */
public class Test_Args {

	/**
	 * @author by Jam
	 * 2015-2-13 下午5:40:18
	 */
	public static void main(String[] args) {

		if(args.length!=3){
			System.out.println("输入的参数不等于3，请重新输入");
			System.exit(1);
		}else {
			System.out.println("输入的参数等于3，OK!");
		}
	}
	
}
