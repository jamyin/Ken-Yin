package com.jam.thread;

/**
 * @author ken 判断线程是否启动
 * */
class hello5 implements Runnable {
    public void run() {
        for (int i = 0; i < 3; i++) {
            System.out.println(Thread.currentThread().getName());
        }
    }
 
    public static void main(String[] args) {
        hello5 he = new hello5();
        Thread demo = new Thread(he);
        System.out.println("线程启动之前---》" + demo.isAlive());
        demo.start();
        System.out.println("线程启动之后---》" + demo.isAlive());
    }
}