package model;

import java.util.Date;

public class Product {
	
	private int prodnum; // 상품 번호
	private String name; // 상품 이름
	private int price; // 상품 가격
	private int stock; // 상품 재고
	private String info; // 상품 정보
	private String image; // 상품 이미지
	private int prodgender; // 상품 설문정보1 (성별)
	private String prodans1; // 상품 설문정보2 (과일, 나무, 꽃)
	private String prodans2; // 상품 설문정보3 (상세)
	private Date regdate; // 상품 등록 날짜
	private String detail; // 상품 상세 이미지
	
	// setter, getter
	public int getProdnum() {
		return prodnum;
	}

	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getProdgender() {
		return prodgender;
	}

	public void setProdgender(int prodgender) {
		this.prodgender = prodgender;
	}

	public String getProdans1() {
		return prodans1;
	}

	public void setProdans1(String prodans1) {
		this.prodans1 = prodans1;
	}

	public String getProdans2() {
		return prodans2;
	}

	public void setProdans2(String prodans2) {
		this.prodans2 = prodans2;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	// toString
	@Override
	public String toString() {
		return "Product [prodnum=" + prodnum + ", name=" + name + ", price=" + price + ", stock=" + stock + ", info="
				+ info + ", image=" + image + ", prodgender=" + prodgender + ", prodans1=" + prodans1 + ", prodans2="
				+ prodans2 + ", regdate=" + regdate + ", detail=" + detail + "]";
	}

}