package com.hipo.account_book.vo;

public class AndroidCategoryChartVo {

	private String category;
	private Integer sum;
	private String id;
	private String maxDate;
	private String minDate;

	
	public String getCategory() {
		return category;
	}

	

	public String getMaxDate() {
		return maxDate;
	}



	public void setMaxDate(String maxDate) {
		this.maxDate = maxDate;
	}



	public String getMinDate() {
		return minDate;
	}



	public void setMinDate(String minDate) {
		this.minDate = minDate;
	}



	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getSum() {
		return sum;
	}

	public void setSum(Integer sum) {
		this.sum = sum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "AndroidCategoryChartVo [category=" + category + ", sum=" + sum + ", id=" + id + ", maxDate=" + maxDate
				+ ", minDate=" + minDate + "]";
	}

}
