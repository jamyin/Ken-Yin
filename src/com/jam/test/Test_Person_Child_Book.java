package com.jam.test;
/**
 * @author by Jam
 * 2015-2-13 上午11:23:51
 */
public class Test_Person_Child_Book {
	
	public static void main(String[] args) {
		Person_01 p1=new Person_01("张三", 36);
		Person_01 c1=new Person_01("张小草", 12);
		Book_01 b1=new Book_01("一千零一夜",26.5f);
		Book_01 b2=new Book_01("飞鸟集",40.5f);
		p1.setBook(b1);
		//b1.setPerson(p1);    //不关闭会报堆栈溢出
		c1.setBook(b2);
		//b2.setPerson(c1);
		p1.setChild(c1);
		
		System.out.println(p1);
		System.out.println(c1);
		System.out.println(b1);
		System.out.println(b2);
		
	}
}
class Person_01 {
	private String name;
	private Integer age;
	private Book_01 book;
	private Person_01 child;
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
	public Book_01 getBook() {
		return book;
	}
	public void setBook(Book_01 book) {
		this.book = book;
	}
	public Person_01 getChild() {
		return child;
	}
	public void setChild(Person_01 c1) {
		this.child = c1;
	}
	public Person_01(String name, Integer age) {
		super();
		this.name = name;
		this.age = age;
	}
	@Override
	public String toString() {
		return "Person_01 [name=" + name + ", age=" + age + ", book=" + book
				+ ", child=" + child + "]";
	}
	
	
	
}
class Book_01{
	private String title;
	private float price;
	private Person_01 person;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Person_01 getPerson() {
		return person;
	}
	public void setPerson(Person_01 person) {
		this.person = person;
	}
	public Book_01(String title, float price) {
		super();
		this.title = title;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Book_01 [title=" + title + ", price=" + price + ", person="
				+ person + "]";
	}
	
	
}