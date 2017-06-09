package com.hipo.account_book.vo;

public class OptionVo {

	private int categoryId;
	private String category;
	private int postCount;
	private String limit;
	private String id;
	private String resetPassword;
	private String operations;


	public String getOperations() {
		return operations;
	}

	public void setOperations(String operations) {
		this.operations = operations;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	@Override
	public String toString() {
		return "OptionVo [categoryId=" + categoryId + ", category=" + category + ", postCount=" + postCount + ", limit="
				+ limit + ", id=" + id + ", resetPassword=" + resetPassword + ", operations=" + operations + "]";
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
	
	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}
	
	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getResetPassword() {
		return resetPassword;
	}

	public void setResetPassword(String resetPassword) {
		this.resetPassword = resetPassword;
	}
	
}
