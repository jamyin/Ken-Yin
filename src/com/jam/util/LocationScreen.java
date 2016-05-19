package com.jam.util;

import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.image.BufferedImage;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

/**
 *@author  作者 E-mail:jamhihi@126.com 
 *@date 创建时间：2015年9月28日 下午3:22:17
 *@version V1.0
 *@parameter
 *@since
 *@return  
 */
public class LocationScreen {

	public static void main(String[] args) throws Exception {
		System.out.println("国庆快乐！");
		int op = JOptionPane.showConfirmDialog(null, "请求控制对方电脑？", "jAM远程协助系统",1 );
		//点击”否“
		if(op == JOptionPane.NO_OPTION){
			return; 
		}
		//输出show ip 地址输入框
		JOptionPane.showInputDialog("请输入要链接的服务器（含端口号）：", "127.0.0.1:10000");
		//构造一个初始化窗体
		JFrame jf = new JFrame("JAM-人工智能远程桌面系统");
		jf.setSize(600, 600);
		jf.setVisible(true);
		jf.setAlwaysOnTop(true);//窗口置顶
		
		//定义方法能够直接访问本级操作系统
		java.awt.Toolkit tk =java.awt.Toolkit.getDefaultToolkit();
		//获取屏幕大小
		Dimension dm = tk.getScreenSize();
		//建立一个图像显示区域（容器）
		JLabel imageLabel =new JLabel();
		jf.add(imageLabel);
		
		Robot robot = new Robot(); 
		
		while(true){
		//指定坐标的空间区域
		Rectangle rec =new Rectangle(jf.getWidth(), 0, (int)dm.getWidth()-jf.getWidth(), (int)dm.getHeight());
		BufferedImage bufimg = robot.createScreenCapture(rec);
		//定义组件显示图像
		imageLabel.setIcon(new ImageIcon(bufimg));
	    //设置操作延时
		Thread.sleep(0);
		}
			
	}

}
