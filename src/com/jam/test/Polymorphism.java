/*    */ package com.jam.test;
/*    */ 
/*    */ import java.io.PrintStream;
/*    */ 
/*    */ public class Polymorphism
/*    */ {
/*    */   public static void main(String[] args)
/*    */   {
/* 16 */     A a1 = new A();
/* 17 */     A a2 = new B();
/* 18 */     B b = new B();
/* 19 */     C c = new C();
/* 20 */     D d = new D();
/* 21 */     System.out.println("①" + a1.show(b));
/* 22 */     System.out.println("②" + a1.show(c));
/* 23 */     System.out.println("③" + a1.show(d));
/* 24 */     System.out.println("④" + a2.show(b));
/* 25 */     System.out.println("⑤" + a2.show(c));
/* 26 */     System.out.println("⑥" + a2.show(d));
/* 27 */     System.out.println("⑦" + b.show(b));
/* 28 */     System.out.println("⑧" + b.show(c));
/* 29 */     System.out.println("⑨" + b.show(d));
/*    */   }
/*    */ }
