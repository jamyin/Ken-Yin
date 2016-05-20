package com.jam.pattern.singleton;

/**
 * @ClassName: SingleObject
 * @Description: 单例模式的几种实现方式
 * 4、双检锁/双重校验锁（DCL，即 double-checked locking）
 *JDK 版本：JDK1.5 起
 *是否 Lazy 初始化：是
 *是否多线程安全：是
 *实现难度：较复杂
 *描述：这种方式采用双锁机制，安全且在多线程情况下能保持高性能。
 *getInstance() 的性能对应用程序很关键。
 * @author Ken Yin
 * @date 2016年5月19日 下午5:17:16
 *
 */
public class Singleton04 {

	private volatile static Singleton04 singleton;  
    private Singleton04 (){}  
    public static Singleton04 getInstance() {  
    if (singleton == null) {  
        synchronized (Singleton04.class) {  
        if (singleton == null) {  
            singleton = new Singleton04();  
        }  
        }  
    }  
    return singleton;  
    }    
	public void showMessage(){
		System.out.println("Hello World!");
	}

	public static void main(String[] args) {
		Singleton04 object = Singleton04.getInstance();
		object.showMessage();
	}


}
