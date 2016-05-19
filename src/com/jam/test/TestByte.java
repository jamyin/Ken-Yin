/*    */ package com.jam.test;
/*    */ 
/*    */ import java.io.PrintStream;
/*    */ 
/*    */ public class TestByte
/*    */ {
/*    */   public static void main(String[] args)
/*    */   {
/*  9 */     System.out.println("byte的二进制位数为：8");
/* 10 */     System.out.println("byte所占的字节数为：1");
/*    */ 
/* 12 */     System.out.println("short的二进制位数为：16");
/* 13 */     System.out.println("short所占的字节数为：2");
/*    */ 
/* 15 */     System.out.println("int的二进制位数为：32");
/* 16 */     System.out.println("int所占的字节数为：4");
/*    */ 
/* 18 */     System.out.println("long的二进制位数为：64");
/* 19 */     System.out.println("long所占的字节数为：8");
/*    */ 
/* 21 */     System.out.println("float的二进制位数为：32");
/* 22 */     System.out.println("float所占的字节数为：4");
/*    */ 
/* 24 */     System.out.println("double的二进制位数为：64");
/* 25 */     System.out.println("double所占的字节数为：8");
/*    */ 
/* 27 */     System.out.println("char的二进制位数为：16");
/* 28 */     System.out.println("char所占的字节数为：2");
/*    */ 
/* 30 */     char ch = '中';
/* 31 */     System.out.println(ch);
/*    */ 
/* 34 */     int max = 2147483647;
/* 35 */     int min = -2147483648;
/* 36 */     System.out.println("最大整型值：" + max + ";max+1=" + (max + 1));
/* 37 */     System.out.println("最小整型值：" + min + ";min-1=" + (min - 1));
/*    */   }
/*    */ }

