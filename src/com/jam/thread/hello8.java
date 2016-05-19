package com.jam.thread;

/**
 * @author Ken Yin 后台线程
 *
 */
class hello8 implements Runnable {
    public void run() {
        while (true) {
            System.out.println(Thread.currentThread().getName() + "在运行");
        }
    }
 
    public static void main(String[] args) {
        hello8 he = new hello8();
        Thread demo = new Thread(he, "线程");
        demo.setDaemon(true);            	   //设置为后台进程
        demo.start();
        //demo.interrupt();
    }
}