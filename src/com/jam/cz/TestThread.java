package com.jam.cz;
/**
 *@author  作者 E-mail:jamhihi@126.com 
 *@date 创建时间：2015年10月19日 下午5:42:53
 *@version V1.0
 *@parameter
 *@since
 *@return  
 */
public class TestThread {
	private static int count = 100;
	public static void main(String[] args) {
		// 用继承Thread类的方式启动一个线程
		new Thread() {
			public void run() {
				synchronized (TestThread.class) {
					while (count > 50) {
						count--;
						System.out.println(Thread.currentThread() + "A卖了一张票，还剩" + count);
					}
				}
			}
		}.start();

		// 用实现Runnable接口的方式启动一个线程
		new Thread(new Runnable() {
			public void run() {
				synchronized (TestThread.class) {
					while (count > 0) {
						count--;
						System.out.println(Thread.currentThread() + "B卖了一张票，还剩" + count);
					}
				}
			}
		}).start();

	}

}
