/*    */ package com.jam.test;
/*    */ 
/*    */ import java.io.PrintStream;
/*    */ import org.junit.Test;
/*    */ 
/*    */ class StudentB extends Student
/*    */ {
/*    */   public void eat()
/*    */   {
/* 36 */     System.out.println("我是大胃王！");
/*    */   }
/*    */   public void play() {
/* 39 */     System.out.println("我是调皮王！");
/*    */   }
/*    */   abstract class A extends Person {
/*    */     A() {  } 
/* 44 */     @Test
/*    */     public void sys() { System.out.println(this.name); }
/*    */ 
/*    */   }
/*    */ }

