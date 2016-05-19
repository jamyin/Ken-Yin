package com.jam.test;

public class Test_Interface {
	/**
	 * @author by Jam
	 * 2015-2-26 下午1:14:25
	 */
	public static void main(String[] args) {
		Computer.plugin(new Flash());
		Computer.plugin(new Print());
		
	}
}
interface Usb{
	public void start();
	public void end();
}
class Computer{
	public static void plugin(Usb usb){
		usb.start();
		System.out.println("====usb开始工作====");
		usb.end();
	}
}
class Flash implements Usb{

	public void start() {
		/**
		 * @author by Jam
		 * 2015-2-26 下午1:19:58
		*/
		System.out.println("u盘开始工作");
	}

	public void end() {
		/**
		 * @author by Jam
		 * 2015-2-26 下午1:19:58
		*/
		System.out.println("u盘停止工作");
	}
	
}
class Print implements Usb{
	
	public void start() {
		/**
		 * @author by Jam
		 * 2015-2-26 下午1:19:58
		 */
		System.out.println("打印机开始工作");
	}
	
	public void end() {
		/**
		 * @author by Jam
		 * 2015-2-26 下午1:19:58
		 */
		System.out.println("打印机停止工作");
	}
	
}