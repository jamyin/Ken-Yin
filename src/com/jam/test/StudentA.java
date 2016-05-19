/*    */ package com.jam.test;
/*    */ 
/*    */ import java.io.PrintStream;
/*    */ 
/*    */ public class StudentA extends Student
/*    */ {
/*    */   public void eat()
/*    */   {
/*  4 */     System.out.println("我是大胃王！");
/*    */   }
/*    */   public void play() {
/*  7 */     System.out.println("我是玩皮头！");
/*    */   }
/*    */   public String FindFriends() {
/* 10 */     System.out.println("找呀找呀找盆友！");
/* 11 */     String i = "找到一个好盆友！";
/* 12 */     System.out.println(i);
/* 13 */     return i;
/*    */   }
/*    */   public static void main(String[] args) {
/* 16 */     StudentA a = new StudentA();
/* 17 */     a.work();
/* 18 */     a.eat();
/* 19 */     a.play();
/* 20 */     a.buy();
/* 21 */     a.FindFriends();
/*    */   }
/*    */ }

