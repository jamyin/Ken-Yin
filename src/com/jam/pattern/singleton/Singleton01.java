package com.jam.pattern.singleton;

/**
* @ClassName: SingleObject
* @Description: 单例模式的几种实现方式
* 1、懒汉式，线程不安全
* 是否 Lazy 初始化：是
* 是否多线程安全：否
* 实现难度：易
* 描述：这种方式是最基本的实现方式，这种实现最大的问题就是不支持多线程。因为没有加锁 synchronized，所以严格意义上它并不算单例模式。
* 这种方式 lazy loading 很明显，不要求线程安全，在多线程不能正常工作。
* @author Ken Yin
* @date 2016年5月19日 下午5:17:16
*
 */
public class Singleton01 {

	private static Singleton01 instance;  
    private Singleton01 (){}  
  
    public static Singleton01 getInstance() {  
    if (instance == null) {  
        instance = new Singleton01();  
    }  
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
		Singleton01 object = Singleton01.getInstance();

		//显示消息
		object.showMessage();
	}


}
