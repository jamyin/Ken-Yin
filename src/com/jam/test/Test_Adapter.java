package com.jam.test;
/**
 * 设计模式之适配器   （注意和模板设计模式的区别）
 * @author by Jam
 * 2015-2-26 下午5:46:42
 */
public class Test_Adapter {
	public static void main(String[] args) {
		Window impl = new WindowImpl();
		impl.open();
		impl.close();
	}
	
}
interface Window{                       //定义窗口操作
	public void open();
	public void close();
	public void activated();            //窗口活动
	public void iconified();            //窗口最小化
	public void deiconified();          //窗口恢复大小
}
abstract class WindowAdapter implements Window{        //采用适配器类，有选择的实现接口中的方法
	public void activated(){};          //窗口活动               ------方法后加这个分号编译也能通过？貌似不能加的吧
	public void iconified(){}          //窗口最小化
	public void deiconified(){}
}
class WindowImpl extends WindowAdapter{

	public void open() {
		System.out.println("打开窗户");
	}

	public void close() {
		System.out.println("关闭窗户");
	}
	
}