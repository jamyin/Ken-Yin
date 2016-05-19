/*    */ package com.jam.test;
/*    */ 
/*    */ import java.io.PrintStream;
/*    */ 
/*    */ abstract class Student
/*    */   implements Man
/*    */ {
/*  6 */   public String o1 = "我是公开的的哟";
/*  7 */   protected String o2 = "我是受保护的哟";
/*  8 */   String o3 = "我是默认的哟";
/*  9 */   private String o4 = "我是私有的哟";
/*    */ 
/* 11 */   public void work() { System.out.println("我是工作狂-S！"); }
/*    */ 
/*    */   public String buy() {
/* 14 */     System.out.println("我是购物狂-S");
/* 15 */     return "我是购物狂-S！";
/*    */   }
/*    */   public static void main(String[] args) {
/* 18 */     StudentB b = new StudentB();
/* 19 */     b.work();
/* 20 */     b.eat();
/* 21 */     b.play();
/* 22 */     b.buy();
/*    */   }
/*    */ }

