package com.jam.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

/**
 *@author  作者 E-mail:jamhihi@126.com 
 *@date 创建时间：2015年12月17日 上午10:48:39
 *@version V1.0
 *@parameter
 *@since
 *@return  
 */
public class testYin {
	@Test
	public void testString(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Date d = new Date();
		System.out.println("当前时间是:" + sdf.format(d));
		String userid="admin";
		String str="viewUID=AuthUserPermissionTabView&timemode=view&dataKey="+userid;
		System.out.println(str);
		String str1="viewUID=AuthUserPermissionTabView&timemode=view&dataKey="+userid+"&time="+sdf.format(d);
		System.out.println(str1);
	}

	@Test
	public void testDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Date d = new Date();
		System.out.println("1.当前时间是:" + sdf.format(d));

		long start = System.currentTimeMillis();  
		System.out.println("2.当前时间是:" + sdf.format(start));

		System.out.println("现在的日期是 = " + new Date().toString());
		System.out.println("自1970年1月1日0时0分0秒开始至今所经历的毫秒数 = " + new Date().getTime()); 
	}

	@Test
	public void testZhengze() {
		String reg="((([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]" +
				"|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+" +
				"(\\.([a-z]|\\d|[!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]" +
				"|[\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF])+)*)|((\\x22)" +
				"((((\\x20|\\x09)*(\\x0d\\x0a))?(\\x20|\\x09)+)?" +
				"(([\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x7f]|\\x21|[\\x23-\\x5b]|" +
				"[\\x5d-\\x7e]|" +
				"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|" +
				"(\\([\\x01-\\x09\\x0b\\x0c\\x0d-\\x7f]|" +
				"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*" +
				"(((\\x20|\\x09)*(\\x0d\\x0a))?" +
				"(\\x20|\\x09)+)?(\\x22))@" +
				"((([a-z]|\\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|" +
				"(([a-z]|\\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])" +
				"([a-z]|\\d|-|\\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*" +
				"([a-z]|\\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\\.)" +
				"+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|" +
				"(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])" +
				"([a-z]|\\d|-|\\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*" +
				"([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))";
		String email ="345wqrrrrrrrrrrrr@sina.com";
		System.out.println(email.matches(reg));
	}
}
