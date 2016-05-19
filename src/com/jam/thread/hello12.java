package com.jam.thread;
/**
 * 
* @ClassName: hello11
* @Description: 同步和死锁(卖票的例子)
* 这里出现了-1，显然这个是错的。，应该票数不能为负值。如果想解决这种问题，就需要使用同步。所谓同步就是在统一时间段中只有有一个线程运行，其他的线程必须等到这个线程结束之后才能继续执行。
* 采用同步的话，可以使用同步代码块和同步方法两种来完成。
* @author Ken Yin
* @date 2016年5月6日 上午10:50:27
*
 */
class hello12 implements Runnable {
    public void run() {
        for(int i=0;i<10;++i){
        	sale();
        }
    }
    
    public synchronized void sale() {      			//采用同步方法解决卖票为负数的问题。
        if (count > 0) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println(count--);
        }
    }
    public static void main(String[] args) {
        hello12 he=new hello12();
        Thread h1=new Thread(he);
        Thread h2=new Thread(he);
        Thread h3=new Thread(he);
        h1.start();
        h2.start();
        h3.start();
    }
    private int count=5;
}
	

