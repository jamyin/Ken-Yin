package com.jam.test;
/**
 * 测试模拟链表
 * @author by Jam
 * 2015-2-25 下午3:57:41
 */
public class Test_Link {
	public static void main(String[] args) {
		Node root = new Node("火车头");
		Node node1 = new Node("车厢1");
		Node node2 = new Node("车厢2");
		Node node3 = new Node("车厢3");
		Node node4 = new Node("车厢4");
		root.setNext(node1);
		node1.setNext(node2);
		node2.setNext(node3);
		node3.setNext(node4);
		printnode(root);
	}
		public static  void printnode(Node node) {
			/**
			 * @author by Jam
			 * 2015-2-25 下午4:05:07
			*/
			System.out.println(node.getData());
			if(node.getNext()!=null){
				printnode(node.getNext());
			}
		}
		
	}


class Node{
	private String data;
	private Node next;
	public Node(String data){
		this.data = data;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public Node getNext() {
		return next;
	}
	public void setNext(Node next) {
		this.next = next;
	}
}