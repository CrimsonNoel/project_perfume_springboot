package model;

import java.util.Date;

// 장바구니 모델 클래스
public class Cart {

	private int cartid; // 장바구니id
	private String id; // 회원아이디
	private int ser; // 장바구니번호
	private int prodnum; // 상품 /번호 외래키(Product)
	private String prodname; // 상품 이름
	private int quantity; // 수량
	private int price; // 가격
	private int result; // 주문 유무 /default: 1 / 주문 전: 1 / 주문 완료: 2
	private Date regdate; // 장바구니 생성 날짜
	
	// setter, getter
	public int getCartid() {
		return cartid;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSer() {
		return ser;
	}

	public void setSer(int ser) {
		this.ser = ser;
	}

	public int getProdnum() {
		return prodnum;
	}

	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}

	public String getProdname() {
		return prodname;
	}

	public void setProdname(String prodname) {
		this.prodname = prodname;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getResult() {
		return result;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setResult(int result) {
		this.result = result;
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
		return "Cart [id=" + id + ", ser=" + ser + ", prodnum=" + prodnum + ", quantity=" + quantity + ", result="
				+ result + ", regdate=" + regdate + "]";
	}

}