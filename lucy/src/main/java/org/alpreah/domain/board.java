package org.alpreah.domain;

import java.sql.Timestamp;

public class board {
	private int b_no;
	private int b_owner;
	private String b_owner_nick; //닉네임을 구하기 위해 
	private String b_title;
	private String b_content;
	private Timestamp b_regdate;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getB_owner() {
		return b_owner;
	}
	public void setB_owner(int b_owner) {
		this.b_owner = b_owner;
	}
	public String getB_owner_nick() {
		return b_owner_nick;
	}
	public void setB_owner_nick(String b_owner_nick) {
		this.b_owner_nick = b_owner_nick;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Timestamp getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Timestamp b_regdate) {
		this.b_regdate = b_regdate;
	}
}
