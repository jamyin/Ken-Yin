package com.jam.test;

/**
 * 比较两个对象，覆写Object里的.equals()方法
 * @author by Jam
 * 2015-2-27 下午6:23:27
 */
public class Test_CompareObj {

	public static void main(String[] args) {
		person11 p1=new person11("张三", 11);
		person11 p2=new person11("张三", 11);
		person11 p3=new person11("mery", 12);
		System.out.println(p1.equals(p2)?"P1和p2是同一个对象":"P1和p2不是同一个对象");
		System.out.println(p1.equals(p3)?"P1和p3是同一个对象":"P1和p3不是同一个对象");
		
		
	}

}
class person11{
	private String name;
	private Integer age;
	public person11(String name, Integer age) {
		super();
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public boolean equals(Object obj){
		if(this==obj){
			return true;
		}
		if(!(obj instanceof person11)){   //注意instanceof的用法。被包含的放在前面，而且没有点号 
			return false;
		}
		person11 p =(person11) obj;
		if(p.getAge()==this.getAge()&&p.getName().equals(this.getName())){
			return true;
		}else{
			return false;
		}
	}
}