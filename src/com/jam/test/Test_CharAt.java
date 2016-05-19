package com.jam.test;
/**
 * @author by Jam
 * 2015-2-13 上午10:36:54
 */
public class Test_CharAt {


	public static void main(String[] args) {
		System.out.println(test("abcdefg"));
	}
	/*
	 *      "1ABC123"作为参数。
	 *      "1ABC123"的长度是7，对应索引可看作0,1,2,3,4,5,6。
			s1=s.substring(1, s.length()-1);//表示从索引为1开始取字符，取到6-1为止，取出后的子字符串长度是6-1。所以s1=ABC12
			i=s1.indexOf("A");//表示第一次出现A的索引值。所以i=0
			s1=s1.charAt(i+1)+"";//表示索引值为i+1对应的值，所以此时s1=B
			s=s.toLowerCase();//s=1abc123
			i=s.indexOf('1',3);//表示从索引值为3开始往后，第一次出现‘1’的索引值，该索引值应从第一位(0)开始算,所以得到i=4
			s=s.substring(i);//表示从i开始取值，直到最后一位为止。s=123
			最后返回B123.

	 */
	public static String test(String s){
        String s1=s.substring(1, s.length()-1);
        System.out.println(s.length());
        System.out.println(s1);
        int i=s1.indexOf("A");
        if(i>=0)s1=s1.charAt(i+1)+"";
        s=s.toLowerCase();
        i=s.indexOf('1',3);
        if(i>0)s=s.substring(i);
        return s1+s;
    }

}
