/*    */ package com.jam.designPatterns;
/*    */ 
/*    */ class TeacherWorkFactory
/*    */   implements IWorkFactory
/*    */ {
/*    */   public Work getWork()
/*    */   {
/* 37 */     return new Teacher();
/*    */   }
/*    */ }

