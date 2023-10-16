package model;

import java.util.Date;

// 주문 모델 클래스
public class Order {

	private String ordernum; // 주문번호
	private String id; // 주문한 회원 id
	private String name; // 받는 사람 이름
	private String tel; // 받는 사람 전화번호
	private String zipcode; // 받는 사람 우편번호
	private String address; // 받는 사람 주소
	private String detailaddress; // 받는 사람 상세 주소
	private int result; // 주문 상태
	private int delivercost; // 배송비
	private Date regdate; // 주문 날짜

	// setter, getter
	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public int getDelivercost() {
		return delivercost;
	}

	public void setDelivercost(int delivercost) {
		this.delivercost = delivercost;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	// toString
	@Override
	public String toString() {
		return "Order [ordernum=" + ordernum + ", id=" + id + ", name=" + name + ", tel=" + tel + ", zipcode=" + zipcode
				+ ", address=" + address + ", detailaddress=" + detailaddress + ", result=" + result + ", delivercost="
				+ delivercost + ", regdate=" + regdate + "]";
	}

}
