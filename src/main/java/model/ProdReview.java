package model;

import java.util.Date;

public class ProdReview {

	private int reviewnum;
	private int prodnum;
	private String id;
	private String content;
	private int rating;
	private Date regdate;

	public int getReviewnum() {
		return reviewnum;
	}

	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}

	public int getProdnum() {
		return prodnum;
	}

	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ProdReview [reviewnum=" + reviewnum + ", prodnum=" + prodnum + ", id=" + id + ", content=" + content
				+ ", rating=" + rating + ", regdate=" + regdate + "]";
	}

}
