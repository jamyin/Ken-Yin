package com.jam.thread;

class hello2 extends Thread {
    private static int count = 5;     //加static变成全局的了.   
    private String name;
    
    public hello2() {
    	 
    }
 
    public hello2(String name) {
        this.name = name;
    }
    public void run() {
        for (int i = 0; i < 7; i++) {
            if (count > 0) {
                System.out.println("name="+name+";count= " + count--);
            }
        }
    }
 
    //main方法其实也是一个线程。在java中所以的线程都是同时启动的，至于什么时候，哪个先执行，完全看谁先得到CPU的资源。
    public static void main(String[] args) {
    	//System.out.println("count= " + count);
        hello2 h1 = new hello2("h1");
        hello2 h2 = new hello2("h2");
        hello2 h3 = new hello2("h3");
        h1.start();
        h2.start();
        h3.start();
    }
 

}