package com.hipo.account_book.vo;

import java.sql.Date;

public class GraphVo {
	private String category;
	private int cnt;
	private int ml;
	private int lsum;
	private Date day1;
	private long day;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getMl() {
		return ml;
	}
	public void setMl(int ml) {
		this.ml = ml;
	}
	public int getLsum() {
		return lsum;
	}
	public void setLsum(int lsum) {
		this.lsum = lsum;
	}
	public Date getDay1() {
		return day1;
	}
	public void setDay1(Date day1) {
		this.day1 = day1;
		this.setDay(day1.getTime());
	}
	public long getDay() {
		return day;
	}
	public void setDay(long day) {
		this.day = day;
	}
}
