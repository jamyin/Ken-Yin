/*    */ package com.jam.designPatterns;
/*    */ 
/*    */ class StudentWorkFactory
/*    */   implements IWorkFactory
/*    */ {
/*    */   public Work getWork()
/*    */   {
/* 31 */     return new Student();
/*    */   }
/*    */ }

