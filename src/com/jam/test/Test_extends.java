package com.jam.test;

public class Test_extends {
	/**
	 * @author by Jam
	 * 2015-2-11 下午4:54:27
	 */
	    public static void main(String[] args) {
	           new Z(); 								//1  Z的实例对象
	           System.out.println();
	           
	           Integer i= new Integer("22");
	           Integer j=new Integer(100);
	           System.out.println(i+j);
	           
	           /*Integer i11 = new Integer("A");
	           Integer i12 = new Integer("7");
	           Character i13 = new Character('a');
	           Boolean i14 = new Boolean(null);
	           Integer i15 = new Integer("0x10");*/

	           
	           System.out.println();
	           String s1 = new String("amit"); 
	           System.out.println(s1);
	           System.out.println(s1.replace('m','r')); //replace方法返回一个字符串，这个字符串当然是新的了，不会影响原来的s1
	           System.out.println(s1); 
	           String s3 = "arit";						//s3作为基础类型 被赋值为“arit”
	           String s4 = "arit"; 
	           String s2 = s1.replace('m','r');			//s2 ：arit 这里的s2是引用变量 指向 replace方法返回回来的String对象
	           System.out.println(s2);
	           System.out.println(s2 == s3);			//一个基础类型的变量和一个引用类型的变量相比 那肯定是不等
	           System.out.println(s3 == s4); 			//两个基础类型变量的比较
	           
	           String myString;   //局部变量必须在使用前初始化（为null时报空指针）
	                  int x = 100;
	                
	                  if(x < 100) myString = "x is less than 100";
	                  if(x > 100) myString = "x is greater than 100";
	                  myString = "";
	                  System.out.println(myString.length());


	    }

}
class X {
    Y b = new Y(); //2运行到这里，执行y的构造函数输出Y
    X(){    
            System.out.print("X");  //3这里 输出X
    }
}
 
class Y {
    Y(){
            System.out.print("Y");
    }
}
 
class Z extends X {//继承父类的所有的成员变量和成员方法也就是说 X中的b对象也被继承到子类中
    
Y y = new Y();  //4 输出Y
    Z(){
                System.out.print("Z");//5 输出 Z
    }
}

abstract class A11{
	public void add(){
		System.out.println("dd");
	}
}

