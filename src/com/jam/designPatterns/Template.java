/*   */ package com.jam.designPatterns;
/*   */ 
/*   */ import java.io.PrintStream;
/*   */ 
/*   */ abstract class Template
/*   */ {
/*   */   public abstract void print();
/*   */ 
/*   */   public void update()
/*   */   {
/* 5 */     System.out.println("开始打印");
/* 6 */     for (int i = 0; i < 10; i++)
/* 7 */       print();
/*   */   }
/*   */ }

