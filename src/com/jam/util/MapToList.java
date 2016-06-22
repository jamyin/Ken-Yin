package com.jam.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.junit.Test;

/**
 * @ClassName: MapToList
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author Ken Yin
 * @date 2016年5月30日 下午2:18:08
 *
 */
public class MapToList {
	@Test
	public void MapToList(){
		Map<String, String> map = new HashMap<String, String>();  
	       map.put("a", "a1");  
	       map.put("b", "b1");  
	       map.put("c", "c1");  
	  
	       List<String> listKey = new ArrayList<String>();  
	       List<String> listValue = new ArrayList<String>();  
	       Iterator<String> it = map.keySet().iterator();  
	       while (it.hasNext()) {  
	           String key = it.next().toString();  
	           listKey.add(key);  
	           listValue.add(map.get(key));  
	       }  
	       for(Entry<String, String> entry: map.entrySet()) {
	    	   System.out.print(entry.getKey() + ":" + entry.getValue() + "\t");
	    	  }
	       System.out.println("Convert Finished !");  
	         
	       for(int i =0 ;i<listKey.size();i++){  
	           System.out.print("Key :"+listKey.get(i));  
	           System.out.println("     Value :"+listValue.get(i));  
	       }  
	}
}
