package com.jam.pattern.singleton;

/**
 * @ClassName: SingleObject
 * @Description: 单例模式的几种实现方式
 * 3、饿汉式
 * 是否 Lazy 初始化：否
 * 是否多线程安全：是
 * 实现难度：易
 * 描述：这种方式比较常用，但容易产生垃圾对象。
 * 优点：没有加锁，执行效率会提高。
 * 缺点：类加载时就初始化，浪费内存。
 * 它基于 classloder 机制避免了多线程的同步问题，不过，instance 在类装载时就实例化，虽然导致类装载的原因有很多种，在单例模式中大多数都是调用 getInstance 方法， 但是也不能确定有其他的方式（或者其他的静态方法）导致类装载，这时候初始化 instance 显然没有达到 lazy loading 的效果。
 * getInstance() 的性能对应用程序不是很关键（该方法使用不太频繁）。
 * @author Ken Yin
 * @date 2016年5月19日 下午5:17:16
 *
 */
public class Singleton03 {

	private static Singleton03 instance = new Singleton03();  
	private Singleton03 (){}  
	public static Singleton03 getInstance() {  
		return instance;  
	}  
	public void showMessage(){
		System.out.println("Hello World!");
	}

	public static void main(String[] args) {
		//不合法的构造函数
		//编译时错误：构造函数 SingleObject() 是不可见的
		//SingleObject object = new SingleObject();

		//获取唯一可用的对象
		Singleton03 object = Singleton03.getInstance();

		//显示消息
		object.showMessage();
	}


}
