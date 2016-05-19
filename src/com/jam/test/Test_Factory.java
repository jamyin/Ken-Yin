package com.jam.test;
/**
 * @author by Jam
 * 2015-2-26 下午4:41:21
 * 设计模式之工厂模式
 */
public class Test_Factory {
	public static void main(String[] args) {
		System.out.println(args.length);
		Fruit f = Factory.getIntance(args[0]); //输入参数
		if(f!=null){
			f.eat();
		}
	}
	
}
interface Fruit{
	public void eat();
}
class Apple implements Fruit{

	public void eat() {
		System.out.println("吃苹果");
	}
}
class Orange implements Fruit{
	
	public void eat() {
		System.out.println("吃橘子");
	}
}
class Factory{                          //定义工厂，得到实例化对象，避免修改客户端
	public static Fruit getIntance(String classname){
		Fruit f=null;
		if("apple".equals(classname)){
			f=new Apple();
		}
		if("orange".equals(classname)){
			f=new Orange();
		}
		return f;
	}
}