package com.jam.test;
/**
 * 宠物商店
 * @author by Jam
 * 2015-2-27 下午3:24:34
 */
public class Test_PetShop {
	public static void main(String[] args) {
		PetShop ps=new PetShop(8);
		ps.add(new Cat("小白", "白色", 3));
		ps.add(new Cat("小黑", "黑色", 2));
		ps.add(new Cat("小花", "花色", 1));
		ps.add(new Dog("泰迪", "白色", 1));
		ps.add(new Dog("比熊", "灰色", 2));
		ps.add(new Dog("摩萨", "白色", 3));
		ps.add(new Dog("柯基", "白色", 1));
		ps.add(new Dog("小白", "白色", 1));
		ps.add(new Dog("小辉", "白色", 1));
		Print(ps.serach("小白"));
	}

	private static void Print(Pet[] p) {
		for(int i=0;i<p.length;i++){
			if(p[i]!=null){
				System.out.println(p[i].getClass().getSimpleName()+"  姓名："+p[i].getName()+"   颜色："+p[i].getColor()+"   年龄："+p[i].getAge());
			}
		}
	}
}
interface Pet{
	public String getName();
	public String getColor();
	public Integer getAge();
	
}
class Cat implements Pet{
	private String name;
	public String color;
	public Integer age;
	public Cat(String name,String color,Integer age){
		this.name=name;
		this.color=color;
		this.age=age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	
}

class Dog implements Pet{
		private String name;
		public String color;
		public Integer age;
		public Dog(String name,String color,Integer age){
			this.name=name;
			this.color=color;
			this.age=age;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getColor() {
			return color;
		}
		public void setColor(String color) {
			this.color = color;
		}
		public Integer getAge() {
			return age;
		}
		public void setAge(Integer age) {
			this.age = age;
		}

}

class PetShop{
	private Pet[] Pets;                    //定义对象数组
	private int foot;                      //数据保存的位置
	public PetShop(int len){
		if(len>0){
			this.Pets=new Pet[len];
		}else {
			this.Pets=new Pet[1];          //至少开辟一个空间
		}
	}
	public boolean add(Pet Pet){
		if(this.foot<this.Pets.length){
			this.Pets[this.foot]=Pet;
			this.foot++;
			return true;
		}else {
			return false;
		}
	}
	public Pet[] serach(String keyword){
		Pet p[]=null;
		int count=0;
		for(int i=0;i<this.Pets.length;i++){
			if(this.Pets[i]!=null){
				if(this.Pets[i].getName().indexOf(keyword)!=-1){
					count++;
					
				}
			}
		}
		p=new Pet[count];
		int f=0;
		for(int i=0;i<this.Pets.length;i++){
			if(this.Pets[i]!=null){
				if(this.Pets[i].getName().indexOf(keyword)!=-1){
					p[f]=this.Pets[i];
					f++;
				}
			}
		}
		return p;
	}
}
