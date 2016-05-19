/*     */ package com.jam.test;
/*     */ 
/*     */ import java.io.PrintStream;
/*     */ import java.util.ArrayList;
/*     */ import java.util.HashMap;
/*     */ import java.util.Iterator;
/*     */ import java.util.Map;
/*     */ import java.util.Map.Entry;
/*     */ import java.util.Set;
import org.junit.Test;
/*     */ 
/*     */ public class Test_JDK1_5
/*     */ {
/*     */   public void f1(int[] a)
/*     */   {
/*  19 */     for (int i = 0; i < a.length; i++)
/*  20 */       System.out.println(a[i]);
/*     */   }
/*     */ 
/*     */   public void f2(int[] a)
/*     */   {
/*  25 */     for (int i : a)
/*  26 */       System.out.println(i);
/*     */   }
/*     */ 
/*     */   @Test
/*     */   public void Test1() {
/*  31 */     int[] a1 = { 1, 2, 3, 4 };
/*  32 */     f1(a1);
/*  33 */     f2(a1);
/*     */   }
/*     */ 
/*     */   public void f1(ArrayList<String> a)
/*     */   {
/*  39 */     for (Iterator<String> it = a.iterator(); it.hasNext(); )
/*  40 */       System.out.println((String)it.next());
/*     */   }
/*     */ 
/*     */   public void f2(ArrayList<String> a)
/*     */   {
/*  46 */     for (String s : a)
/*  47 */       System.out.println(s);
/*     */   }
/*     */ 
/*     */   @Test
/*     */   public void Test2() {
/*  52 */     ArrayList<String> al = new ArrayList<String>();
/*  53 */     al.add("one");
/*  54 */     al.add("two");
/*  55 */     al.add("three");
/*  56 */     f1(al);
/*  57 */     f2(al);
/*     */   }
/*     */ 
/*     */   public void f1(Map<String, String> a)
/*     */   {
/*  62 */     Set<String> ss = a.keySet();
/*  63 */     for (String s : ss)
/*  64 */       System.out.println(s + "::" + (String)a.get(s));
/*     */   }
/*     */ 
/*     */   public void f2(Map<String, String> a)
/*     */   {
/*  70 */     for (Map.Entry s : a.entrySet())
/*  71 */       System.out.println((String)s.getKey() + "::" + (String)s.getValue());
/*     */   }
/*     */ 
/*     */   @Test
/*     */   public void Test3() {
/*  76 */     Map<String, String> al = new HashMap<String, String>();
/*  77 */     al.put("one", "哈哈");
/*  78 */     al.put("two", "呵呵");
/*  79 */     al.put("three", "嘿嘿");
/*  80 */     f1(al);
/*  81 */     f2(al);
/*     */   }
/*     */ 
/*     */   @Test
/*     */   public void Test4()
/*     */   {
/*  89 */     int[] a1 = { 12, 32, 4, 21, 43, 54, 35, 23, 75, 23, 13, 7, 13, 21 };
/*  90 */     int[] a2 = { 62, 32, 4, 21, 43, 54, 35, 23, 95, 23, 13, 1, 13, 21 };
/*     */ 
/*  92 */     System.arraycopy(a1, 2, a2, 3, 4);
/*  93 */     System.out.println("=======a1=======");
/*  94 */     for (int i : a1) {
/*  95 */       System.out.print(i + ";");
/*     */     }
/*  97 */     System.out.println();
/*  98 */     System.out.println("=======a2=======");
/*  99 */     for (int i : a2)
/* 100 */       System.out.print(i + ";");
/*     */   }
/*     */ 
/*     */   public void copy(int[] s, int s1, int[] o, int s2, int len) {
/* 104 */     for (int i = 0; i < len; i++)
/* 105 */       o[(s2 + i)] = s[(s1 + i)];
/*     */   }
/*     */ 
/*     */   @Test
/*     */   public void Test5()
/*     */   {
/* 114 */     System.out.println("不传递参数");
/* 115 */     fun(new int[0]);
/* 116 */     System.out.println("===========");
/* 117 */     System.out.println("传递一个参数");
/* 118 */     fun(new int[] { 1 });
/* 119 */     System.out.println();
/* 120 */     System.out.println("===========");
/* 121 */     System.out.println("传递五个参数");
/* 122 */     fun(new int[] { 1, 2, 3, 4, 5 });
/*     */   }
/*     */   public void fun(int[] is) {
/* 125 */     System.out.println(is.length);
/*     */ 
/* 129 */     for (int i : is)
/* 130 */       System.out.print(i + ";");
/*     */   }
/*     */ }

