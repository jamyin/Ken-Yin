package com.jam.test;

/**
 * @author by Jam
 * 2015-2-28 下午5:27:50
 */
public class Test_Thread {
	public static void main(String[] args) {
		MyThread1 m1=new MyThread1("A线程");
		MyThread1 m2=new MyThread1("B线程");
		//m1.run();
		//m2.run();
		m1.start();
		m2.start();
		//m2.start();                  //不能调用多次，否则会抛出java.lang.IllegalThreadStateException异常
		//System.out.println("=================");          //此句无用。。。。。注意是线程。。。。
		MyThread2 m3=new MyThread2("A线程");
		MyThread2 m4=new MyThread2("B线程");
		Thread m5=new Thread(m3);
		Thread m6=new Thread(m4);
		m5.start();
		m6.start();
		
	}
}
class MyThread1 extends Thread{
	private String name;
	public MyThread1(String name){
		this.name=name;
	}
	public void run(){
		for(int i=0;i<10;i++){
			System.out.println(name+"运行"+"i="+i);
		}
	}
	
} 
class MyThread2 implements Runnable{
	private String name;
	public MyThread2(String name){
		this.name=name;
	}
	public void run(){
		for(int i=0;i<10;i++){
			System.out.println(name+"运行"+"i="+i);
		}
	}
}