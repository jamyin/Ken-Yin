package com.jam.test;

public class Test_FinallyWithReturn {

	/**
	 * java中的return和finally谁先执行？
	 * finally先执行.可以形象的说,方法在顺序化的一直往下走,走着走着,发现了Rerurn(并未执行),它知道它快活不下去了,临死前.他就去找Finally,让Finally把事情做完.这种情况在Debug的时候比较明显,走到Return所在行,就进Finally,然后在回到Rerurn,做返回
	 * @author by Jam
	 * 2015-2-9 下午4:59:30
	 */
	public static void main(String[] args) {
		System.out.println(new Test_FinallyWithReturn().test_FinallyWithReturn());
	}
	
	Test_FinallyWithReturn(){
		System.out.println("我是构造函数");
	}
	 int test_FinallyWithReturn(){
		int i=1;
		try{
			System.out.println("==1==");
			return i;                                       //注意最后返回的是1，而不是2！！！
		}catch (Exception e) {
			try {
				throw new Exception();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			System.out.println("==2==");
			i++;
			System.out.println("i="+i);
		}
		System.out.println("==3==");                 //以下未执行
		return i;
	}

}
