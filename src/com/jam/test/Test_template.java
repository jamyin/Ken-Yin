package com.jam.test;
/**
 * 测试设计模式之模板（eg:人可以说话，但说话的具体内容由学生或工人决定）
 * @author by Jam
 * 2015-2-26 上午11:30:27
 */
public class Test_template {
	public static void main(String[] args) {
		Person_04 p1 = new Student_04("jam", 29);
		Person_04 p2 = new Worker_04("yin", 20);
		p1.getContent();
		p2.getContent();
		
	}
}
abstract class Person_04{
	private String name;
	private Integer age;
	public Person_04(String name, Integer age) {
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
	public abstract void getContent();

}
class Student_04 extends Person_04{
	private float score=(float) 88.5;
	
	public Student_04(String name, Integer age) {
		super(name, age);
	}

	public  void getContent(){
		System.out.println("我是学生"+getName()+getAge()+getScore());
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

}
class Worker_04 extends Person_04{
	private float salary=2000.0f;
	public Worker_04(String name, Integer age) {
		super(name, age);
	}

	public  void getContent(){
		System.out.println("我是工人"+getName()+getAge()+getSalary());
	}

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}
	
}
