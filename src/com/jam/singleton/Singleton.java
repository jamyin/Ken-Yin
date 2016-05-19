package com.jam.singleton;


public class Singleton {
	/**
	 * @author by Jam
	 * 2015-2-7 上午11:00:55
	 * 单例模式是什么? 通俗的将就是一个人,没有兄弟姐们孤单单一个人.举个我们大家都比较熟悉的回收站.这就是电脑中很好的单例模式.所有桌面上面的东西,比如视频,文件等等,删除之后都会进入到它里面.专业术语讲:就是始终是一个对象实例.它对外不提供构造函数,因此我们不能够同时产生多个对象.
	 * 我们常见的工具类,数据库连接类等等就可以定义为单例类.我们将回收站定义为单例类.里面有个删除方法.
	 */
	private Singleton(){
		System.out.println("我就是那个私有构造，没内容时记得加括号");
	};   //私有化构造方法
	
	/*//懒汉式（线程安全的，多个线程进行访问时不会实例化多个对象，因为static属性只会被初始化一次，缺点是无论是否用到该实例都会被初始化，无故的开销变大。）
	private static Singleton instance =new Singleton(); 
	public static Singleton getInstance(){
		return instance;
	}*/
	
	
	/*//恶汉式（保证了只有在调用该类的时候对象才被初始化（延迟创建），但是缺点是线程不安全，当多个线程同时访问的时候，极可能实例化出多个对象。）
	private static Singleton instance=null;              
	public static Singleton getInstance(){
		if(instance==null){
			instance=new Singleton();
		}
		return instance;
	}*/
	
	
	//使用静态内部类(完美实现的实现线程安全又延迟加载的模式)
	public static class singleton1{
		private static final Singleton instance=new Singleton();
	}
	public static Singleton getInstance(){
		return singleton1.instance;
	}
	
	public static void main(String[] args) {
		/*System.out.println(Singleton.getInstance());
		Singleton s1=new Singleton();
		Singleton s2=new Singleton();
		Singleton s3=new Singleton();
		Singleton s4=new Singleton();
		System.out.println(s1);
		System.out.println(s2);
		System.out.println(s3);
		System.out.println(s4);*/
		System.out.println(Singleton.getInstance());
		Singleton s1=Singleton.getInstance();
		Singleton s2=Singleton.getInstance();
		System.out.println(s1);
		System.out.println(s2);

		

	}
	
}
