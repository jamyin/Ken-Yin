package com.jam.thread;

/**
 <p>实现Runnable接口比继承Thread类所具有的优势：
	1）：适合多个相同的程序代码的线程去处理同一个资源
	2）：可以避免java中的单继承的限制
	3）：增加程序的健壮性，代码可以被多个线程共享，代码和数据独立。
 </p>
* @ClassName: hello3
* @Description: TODO(这里用一句话描述这个类的作用)
* @author Ken Yin
* @date 2016年5月5日 上午11:50:09
*
 */
class hello3 implements Runnable {
    private  int count = 5;     //加static变成全局的了.   
    private String name;
    
    public hello3() {
    	 
    }
 
    public hello3(String name) {
        this.name = name;
    }
    public void run() {
        for (int i = 0; i < 7; i++) {
            if (count > 0) {
                System.out.println(Thread.currentThread().getName()+";count= " + count--);
            }
        }
    }
 
    public static void main(String[] args) {
    	//System.out.println("count= " + count);
        hello3 h1 = new hello3("h1");
        hello3 h2 = new hello3("h2");
        hello3 h3 = new hello3("h3");
        
       /* Thread t1 = new Thread(h1); 
        Thread t2 = new Thread(h2); 
        Thread t3 = new Thread(h3); 
        t1.start();
        t2.start();
        t3.start();*/
        
        //如果我们没有指定名字的话，系统自动提供名字。类似"Thread-0";
        new Thread(h1,"t1").start();
        new Thread(h1,"t2").start();
        new Thread(h1,"t3").start();
    }
 

}