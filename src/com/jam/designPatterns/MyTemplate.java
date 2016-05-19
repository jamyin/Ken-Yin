package com.jam.designPatterns;

public class MyTemplate
{
  public static void main(String[] args)
  {
	  IWorkFactory studentWorkFactory = new StudentWorkFactory();
	  studentWorkFactory.getWork().doWork();
	  IWorkFactory teacherWorkFactory =new TeacherWorkFactory();
	  teacherWorkFactory.getWork().doWork();
  }
}

