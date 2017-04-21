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
	@Pattern(regexp="^[0~9]*$", message="생년을 선택하세요.")
	private String birthYear;
	@Pattern(regexp="^[0~9]*$", message="생월을 선택하세요.")
	private String birthMonth;
	@Pattern(regexp="^[0~9]*$", message="생일을 선택하세요.")
	private String birthDay;
	private int age;
	private String photo;
	private int total;

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
<<<<<<< HEAD
	
	public String getBirthYear() {
		return birthYear;
=======

	public String getBirth() {
		return birth;
>>>>>>> branch 'master' of https://github.com/ChoiHyeonGyu/account-book.git
	}
<<<<<<< HEAD
	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}
	public String getBirthMonth() {
		return birthMonth;
	}
	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
=======

	public void setBirth(String birth) {
		this.birth = birth;
>>>>>>> branch 'master' of https://github.com/ChoiHyeonGyu/account-book.git
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhoto() {
		return photo;
	}
<<<<<<< HEAD
	public void setPhoto(String photo) {
=======

	public void setPhoth(String photo) {
>>>>>>> branch 'master' of https://github.com/ChoiHyeonGyu/account-book.git
		this.photo = photo;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
<<<<<<< HEAD
	
=======

	@Override
	public String toString() {
		return "UserVo [id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender + ", birth="
				+ birth + ", age=" + age + ", photo=" + photo + ", total=" + total + "]";
	}

>>>>>>> branch 'master' of https://github.com/ChoiHyeonGyu/account-book.git
}
