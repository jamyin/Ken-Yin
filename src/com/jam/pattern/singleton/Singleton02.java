package com.jam.pattern.singleton;

/**
* @ClassName: SingleObject
* @Description: 单例模式的几种实现方式
* 2、懒汉式，线程安全
* 是否 Lazy 初始化：是
* 是否多线程安全：是
* 实现难度：易
* 描述：这种方式具备很好的 lazy loading，能够在多线程中很好的工作，但是，效率很低，99% 情况下不需要同步。
* 优点：第一次调用才初始化，避免内存浪费。
* 缺点：必须加锁 synchronized 才能保证单例，但加锁会影响效率。
* getInstance() 的性能对应用程序不是很关键（该方法使用不太频繁）。
* @author Ken Yin
* @date 2016年5月19日 下午5:17:16
*
 */
public class Singleton02 {

	private static Singleton02 instance;  
    private Singleton02 (){}  
    public static synchronized Singleton02 getInstance() {  
    if (instance == null) {  
        instance = new Singleton02();  
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
		Singleton02 object = Singleton02.getInstance();

		//显示消息
		object.showMessage();
	}


}
