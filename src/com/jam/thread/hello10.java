package com.jam.thread;

/**
 * @author Ken Yin 线程的礼让
 *
 */

class hello10 implements Runnable {
    @SuppressWarnings("static-access")         
	public void run() {
        for(int i=0;i<5;++i){
            System.out.println(Thread.currentThread().getName()+"运行"+i);
            if(i==3){
                System.out.println("线程的礼让");
                Thread.currentThread().yield();
            }
        }
    }
 
    public static void main(String[] args) {
        Thread h1=new Thread(new hello10(),"A");
        Thread h2=new Thread(new hello10(),"B");
        h1.start();
        h2.start();
         
    }
}