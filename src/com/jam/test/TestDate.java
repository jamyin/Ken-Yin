package com.jam.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestDate {

	public static void main(String[] args) {
		String dateString = "2012-12-06"; 
		Date date = null;
		try  
		{  
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    date = sdf.parse(dateString);  
		}  
		catch (ParseException e)  
		{  
		    System.out.println(e.getMessage());  
		} 
       System.out.println(date);
       System.out.println("===============================");
       
       //获取当前时间 下面两种都是得到一个当前的时间的long型的时间的毫秒值，这个值实际上是当前时间值与1970年一月一号零时零分零秒相差的毫秒数。 
	   Date date2 = new Date();
	   System.out.println(date2.getTime());   //其他方法现在都不用了,有个横杆,废弃了
	   
	   //还有一种方式，使用System.currentTimeMillis(); 
	   System.out.println(System.currentTimeMillis());
	   
	}
	
}
