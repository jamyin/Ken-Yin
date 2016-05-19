package com.jam.thread;
/**
 * 
* @ClassName: hello11
* @Description: 同步和死锁(卖票的例子).当多个线程共享一个资源的时候需要进行同步，但是过多的同步可能导致死锁。此处列举经典的生产者和消费者问题。
* @author Ken Yin
* @date 2016年5月6日 上午10:50:27
*
 */
class Info {
	 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public int getAge() {
        return age;
    }
 
    public void setAge(int age) {
        this.age = age;
    }
 
    private String name = "Ken";
    private int age = 22;
}
 
/**
 * 生产者
 * */
class Producer implements Runnable{
    private Info info=null;
    Producer(Info info){
        this.info=info;
    }
     
    public void run(){
        boolean flag=false;
        for(int i=0;i<25;++i){
            if(flag){
                this.info.setName("Jam");
                try{
                    Thread.sleep(100);
                }catch (Exception e) {
                    e.printStackTrace();
                }
                this.info.setAge(20);
                flag=false;
            }else{
                this.info.setName("Yin");
                try{
                    Thread.sleep(100);
                }catch (Exception e) {
                    e.printStackTrace();
                }
                this.info.setAge(100);
                flag=true;
            }
        }
    }
}
/**
 * 消费者类
 * */
class Consumer implements Runnable{
    private Info info=null;
    public Consumer(Info info){
        this.info=info;
    }
     
    public void run(){
        for(int i=0;i<25;++i){
            try{
                Thread.sleep(100);
            }catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(this.info.getName()+"<---->"+this.info.getAge());
        }
    }
}
 
/**
 * 测试类
 * */
class hello13{
    public static void main(String[] args) {
        Info info=new Info();
        Producer pro=new Producer(info);
        Consumer con=new Consumer(info);
        new Thread(pro).start();
        new Thread(con).start();
    }
}	

