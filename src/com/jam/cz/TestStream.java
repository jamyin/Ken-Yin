package com.jam.cz;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author 作者 E-mail:jamhihi@126.com
 * @date 创建时间：2015年10月19日 上午10:30:19
 * @version V1.0
 * @parameter
 * @since
 * @return
 */
public class TestStream {

	public static void main(String[] args) {
		/*// 读文件
		String path = "c:/jam.txt";
		FileInputStream in = null;
		try {
			// 打开流
			in = new FileInputStream(path);
			// 使用流读文件内容
			int b = in.read();
			while (b != -1) {
				System.out.print((char) b);
				b = in.read();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			// 释放资源
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}*/
		
		//拷贝文件
		String srcPath = "c:/a.txt";
		String destPath = "c:/b.txt";

		// 一定要使用字节流
		InputStream in = null;
		OutputStream out = null;
		try {
			// 打开流
			in = new FileInputStream(srcPath);
			out = new FileOutputStream(destPath);
			// 使用流
			byte[] buf = new byte[1024 * 8];
			for (int len = -1; (len = in.read(buf)) != -1;) {
				out.write(buf, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 释放资源
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				throw new RuntimeException(e);
			} finally {
				if (out != null) {
					try {
						out.close();
					} catch (IOException e) {
						throw new RuntimeException(e);
					}
				}
			}
		}
	}
	
	
	
	
	/**
	 * 判断字符是否是中文
	 *
	 * @param c 字符
	 * @return 是否是中文
	 */
	public static boolean isChinese(char c) {
	    Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);
	    if(ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS
	            || ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
	            || ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A
	            || ub == Character.UnicodeBlock.GENERAL_PUNCTUATION
	            || ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION
	            || ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {
	        return true;
	    }
	    return false;
	}
	
	/**
	 * 判断字符串是否是乱码
	 *
	 * @param strName 字符串
	 * @return 是否是乱码
	 */
	public static boolean isMessyCode(String strName) {
	    Pattern p = Pattern.compile("\\s*|\t*|\r*|\n*");
	    Matcher m = p.matcher(strName);
	    String after = m.replaceAll("");
	    String temp = after.replaceAll("\\p{P}", "");
	    char[] ch = temp.trim().toCharArray();
	    float chLength = ch.length;
	    float count = 0;
	    for(int i = 0; i < ch.length; i++) {
	        char c = ch[i];
	        if(!Character.isLetterOrDigit(c)) {
	            if(!isChinese(c)) {
	                count = count + 1;
	            }
	        }
	    }
	    float result = count / chLength;
	    if(result > 0.4) {
	        return true;
	    } else{
	        return false;
	    }
	 
	}
}
