package com.jam.cz;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @ClassName: ObjectSorting
 * @Description: 对象按照年龄进行排序
 * @author Ken Yin
 * @date 2016年5月9日 下午1:47:42
 *
 */
public class ObjectSorting{

     public static void main(String[] args) {
         List<Person> list = getData() ;
         //排序
         Collections.sort( list , comparator );
         
         for (Person person : list) {
             System.out.println(person);
         }
         
     }
 
     /**
      * 年龄按从小到大排序
      */
     static Comparator<Person> comparator = new Comparator<Person>() {
         @Override
         public int compare(Person p1 , Person p2 ) {
             if( p1.getAge() > p2.getAge() ){
               return 1 ;  //正数
             }else if ( p1.getAge() < p2.getAge()) {
                 return -1 ;  //负数
             }else {
                 return 0;  //相等为0
             }
         }
     };
 
     static private List<Person> getData() {
         List<Person> list = new ArrayList<>() ;
 
         Person p1 = new Person() ;
         p1.setAge( 10 ); 
         p1.setName( "p1" );
 
         Person p2 = new Person() ;
         p2.setAge( 30 ); 
         p2.setName( "p2" );
 
         Person p3 = new Person() ;
         p3.setAge( 20 ); 
         p3.setName( "p3" );
 
         Person p4 = new Person() ;
         p4.setAge( 15 ); 
         p4.setName( "p4" );
 
         list.add( p1 ) ;
         list.add( p2 ) ;
         list.add( p3 ) ;
         list.add( p4 ) ;
 
         return list ;
     }
 }

 class Person {

    private int age ;
    private String name ;
    
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
	@Override
	public String toString() {
		return "Person [age=" + age + ", name=" + name + "]";
	}
    
}
