package com.jam.test;
/**
 *@author  作者 E-mail:jamhihi@126.com 
 *@date 创建时间：2015年8月26日 下午2:43:47
 *@version V1.0
 *@parameter
 *@since
 *@return
 *.必须先有外部类的对象才能生成内部类的对象，因为内部类的作用就是为了访问外部类中的成员变量  
 */

/**
 * 内部类访问外部类属性
 * @author YIn
 * @time:2015年8月26日 下午2:59:24
 * @ClassName: Out
 * @Description: TODO
 * @
 */
class Out{
	private String name = "jam";
	class In{
		public void print(){
			System.out.println("Hello  " + name +"!");    //内部类可以随意使用外部类的成员变量（包括私有）而不用生成外部类的对象，这也是内部类的唯一优点
		}
	}

}

/**
 * 内部类中的变量访问形式
 * @author YIn
 * @time:2015年8月26日 下午3:00:11
 * @ClassName: Out_01
 * @Description: TODO
 * @
 */

class Out_01 {
    private int age = 12;
     
    class In_01 {
        private int age = 13;
        public void print() {
            int age = 14;
            System.out.println("局部变量：" + age);
            System.out.println("内部类变量：" + this.age);
            System.out.println("外部类变量：" + Out_01.this.age);
        }
    }
}

/**
 * 静态内部类
 * @author YIn
 * @time:2015年8月26日 下午3:04:25
 * @ClassName: Out
 * @Description: TODO
 * @
 */
class Out_02 {
    private static int age = 12;
    private static  String name = "katherine";
     
    static class In_02 {
        public void print() {
            System.out.println(age);
            System.out.println(name);  //只能访问静态属性。不然报错
        }
    }
}
/**
 * 如果一个内部类只希望被外部类中的方法操作，那么可以使用private声明内部类
 * 下面的代码中，我们必须在Out类里面生成In类的对象进行操作，而无法再使用Out.In in = new Out().new In() 生成内部类的对象
 * 私有内部类
 * @author YIn
 * @time:2015年8月26日 下午3:07:29
 * @ClassName: Out
 * @Description: TODO
 * @
 */
class Out_03 {
    private int age = 12;
     
    private class In_03 {
        public void print() {
            System.out.println(age);
        }
    }
    public void outPrint() {
        new In_03().print();
    }
}

/**
 * 方法内部类
 * 此时我们需要往外部类的方法中传入参数，那么外部类的方法形参必须使用final定义,至于final在这里并没有特殊含义，只是一种表示形式而已
 * @author YIn
 * @time:2015年8月26日 下午3:32:09
 * @ClassName: Out
 * @Description: TODO
 * @
 */
class Out_04 {
    private int age = 12;
 
    public void Print(final int x) {   //final 作用域
        class In_04 {
            public void inPrint() {
                System.out.println(x);
                System.out.println(age);
            }
        }
        new In_04().inPrint();
    }
}

public class TestInnerClass {

	public static void main(String[] args) {
		Out.In in =new Out().new In();
		in.print();
		System.out.println("=========1==========");
		Out_01.In_01 in_01 =new Out_01().new In_01();
		in_01.print();
		System.out.println("=========2==========");
		//Out_02.In_02 in_02 =new Out_02().new In_02();  此种写法报错喔
		Out_02.In_02 in_02 =new Out_02.In_02();
		in_02.print();
		System.out.println("=========3==========");
		//Out_03.In_03 in_03 =new Out_03().new In_03();  此种写法报错喔
		 Out_03 out_03 = new Out_03();
	     out_03.outPrint();
	     System.out.println("=========4==========");
	     Out_04 out_04 = new Out_04();
	     out_04.Print(3);
		
	}

}
