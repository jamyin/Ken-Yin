package com.jam.test;
/**
 * @author by Jam
 * 2015-2-26 下午5:11:06
 * 设计模式之代理
 */
public class Test_Proxy {
	public static void main(String[] args) {
		new Proxy(new Real()).browse();
	}
}
interface NetWork{
	public void browse();
}
class Real implements NetWork{
	public void browse() {
	System.out.println("上网浏览信息");	
	}
}
class Proxy implements NetWork{
	private NetWork netWork;
	
	public Proxy(NetWork netWork) {
		super();
		this.netWork = netWork;
	}
	public void check(){
		System.out.println("检查用户是否合法");   //与上网相关的操作
	}
	public void browse() {
		this.check();
		this.netWork.browse();   				//调用真实上网操作
	}
}
