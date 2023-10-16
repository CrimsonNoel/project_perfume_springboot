package model;

public class OrderItem {

	private int oditemnum; // 주문 상세번호
	private String ordernum; // 주문번호
	private int prodnum; // 주문한 상품의 상품번호
	private int quantity; // 주문한 상품 수량
	private int price; // 주문한 상품의 가격

	// setter, getter
	public int getOditemnum() {
		return oditemnum;
	}

	public void setOditemnum(int oditemnum) {
		this.oditemnum = oditemnum;
	}

	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}

	public int getProdnum() {
		return prodnum;
	}

	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	// toString
	@Override
	public String toString() {
		return "orderItem [oditemnum=" + oditemnum + ", ordernum=" + ordernum + ", prodnum=" + prodnum + ", quantity="
				+ quantity + ", price=" + price + "]";
	}

}
