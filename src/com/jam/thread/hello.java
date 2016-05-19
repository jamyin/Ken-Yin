package com.jam.thread;

class hello extends Thread {
	 
    public hello() {
 
    }
 
    public hello(String name) {
        this.name = name;
    }
 
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(name + "运行     " + i);
        }
    }
 
    public static void main(String[] args) {
        hello h1=new hello("A");
        hello h2=new hello("B");
        //h1.run();
        //h2.run();
        
        h1.start();
        h2.start();
    }
 
    private String name;
}
	

