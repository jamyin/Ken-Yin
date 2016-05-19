package com.jam.cz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

/**
 *@   java集合练习
 *@author  作者 E-mail:jamhihi@126.com 
 *@date 创建时间：2015年9月30日 下午1:49:48
 *@version V1.0
 *@parameter
 *@since
 *@return  
 */
public class Test {

	public static void main(String[] args) {
		// 遍历数组：
		String[] arr = new String[] { "xx", "yy", "zz" };

		// 1，增强的for循环
		for (String elt : arr) {
			System.out.println(elt);
		}

		// 2，下标的方式
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}


	
	// 遍历List：
	List<String> list = new ArrayList<String>();
	list.add("aa");
	list.add("bb");
	list.add("cc");

	// 1，增强的for循环
	for (String elt : list) {
		System.out.println(elt);
	}

	// 2，下标
	for (int i = 0; i < list.size(); i++) {
		System.out.println(list.get(i));
	}

	// 3，迭代器
	for (Iterator<String> iter = list.iterator(); iter.hasNext();) {
		String elt = iter.next();
		System.out.println(elt);
	}
	
	// 遍历Set：
		Set<String> set = new HashSet<String>();
		set.add("dd");
		set.add("ee");
		set.add("ff");

		// 1，增强的for循环
		for (String elt : set) {
			System.out.println(elt);
		}
		
		// 2，迭代器
		for(Iterator<String> iter = set.iterator(); iter.hasNext() ; ){
			String elt = iter.next();
			System.out.println(elt);
		}
		
		// 遍历Map：
		Map<String, String> map = new HashMap<String, String>();
		map.put("aa", "xx");
		map.put("bb", "yy");
		map.put("cc", "zz");
		map.put("jam", "yin");

		// 1，增强的for循环（Entry集合）
		for (Entry<String, String> entry : map.entrySet()) {
			System.out.println(entry);
		}
		
		// 2，增强的for循环（Key集合）
		for(String key : map.keySet()){
			System.out.println(key + " = " + map.get(key));
		}
		
		// 3，遍历值的集合
		for(String value : map.values()){
			System.out.println(value);
		}
	
	}
}
