package com.jam.thread;

class hello1 extends Thread {
	 
    public hello1() {
 
    }
 
    public hello1(String name) {
        this.name = name;
    }
 
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(name + "运行     " + i);
        }
    }
 
    public static void main(String[] args) {
        hello1 h1=new hello1("A");
        Thread demo1= new Thread(h1);
        hello1 h2=new hello1("B");
        Thread demo2= new Thread(h2);
        //h1.run();
        //h2.run();
        
        demo1.start();
        demo2.start();
    }
 
    private String name;
}
	

