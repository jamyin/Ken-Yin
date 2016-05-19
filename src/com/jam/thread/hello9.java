package com.jam.thread;

/**
 * @author Ken Yin 线程的优先级
 * 不要误以为优先级越高就先执行。谁先执行还是取决于谁先去的CPU的资源、另外，主线程的优先级是5.
 *
 */

class hello9 implements Runnable {
    public void run() {
        for(int i=0;i<5;++i){
            System.out.println(Thread.currentThread().getName()+"运行"+i);
        }
    }
 
    public static void main(String[] args) {
        Thread h1=new Thread(new hello9(),"A");
        Thread h2=new Thread(new hello9(),"B");
        Thread h3=new Thread(new hello9(),"C");
        h1.setPriority(8);
        h2.setPriority(2);
        h3.setPriority(6);
        h1.start();
        h2.start();
        h3.start();
         
    }
}