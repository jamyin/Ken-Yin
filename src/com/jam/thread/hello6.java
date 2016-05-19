package com.jam.thread;

/**
 * @author Ken Yin 线程的休眠
 * */
class hello6 implements Runnable {
    public void run() {
        for (int i = 0; i < 3; i++) {
            try {
                Thread.sleep(2000);
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(Thread.currentThread().getName() + i);
        }
    }
 
    public static void main(String[] args) {
        hello6 he = new hello6();
        Thread demo = new Thread(he, "线程");
        demo.start();
    }
}