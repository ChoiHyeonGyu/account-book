package com.hipo.account_book.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class UserVo {
	@NotEmpty
	private String id;
	@NotEmpty
	private String password;
	@NotEmpty
	private String name;
	private String gender;
	@Pattern(regexp = "^[0~9]{4}$", message = "생년을 선택하세요.")
	private int birthYear;
	@Pattern(regexp = "^[0~9]{1,2}$", message = "생월을 선택하세요.")
	private int birthMonth;
	@Pattern(regexp = "^[0~9]{1,2}$", message = "생일을 선택하세요.")
	private int birthDay;
	private String age;
	private String photo;
	private String total;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(int birthYear) {
		this.birthYear = birthYear;
	}

	public int getBirthMonth() {
		return birthMonth;
	}

	public void setBirthMonth(int birthMonth) {
		this.birthMonth = birthMonth;
	}

	public int getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(int birthDay) {
		this.birthDay = birthDay;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "UserVo [id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender + ", birthYear="
				+ birthYear + ", birthMonth=" + birthMonth + ", birthDay=" + birthDay + ", age=" + age + ", photo="
				+ photo + ", total=" + total + "]";
	}

}
