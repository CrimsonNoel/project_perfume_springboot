package model;

import java.util.Date;

// 회원 모델 클래스
public class Member {

	private String id; // 회원 Id
	private String pass; // 회원 비밀번호
	private String name; // 회원 이름
	private int gender; // 회원 성별
	private String tel; // 회원 전화번호
	private String email; // 회원 이메일
	private String zipcode; // 회원 우편번호
	private String address; // 회원 주소
	private Date rdate; // 가입 날짜
	
	// setter, getter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	
	// toString
	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", name=" + name + ", gender=" + gender + ", tel=" + tel
				+ ", email=" + email + ", zipcode=" + zipcode + ", address=" + address + ", rdate=" + rdate + "]";
	}

}