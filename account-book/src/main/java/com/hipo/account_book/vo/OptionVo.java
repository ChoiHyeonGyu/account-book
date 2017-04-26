package com.hipo.account_book.vo;

public class OptionVo {

	private int categoryId;
	private String category;
	
	@Override
	public String toString() {
		return "OptionVo [categoryId=" + categoryId + ", category=" + category + "]";
	}
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategeoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
