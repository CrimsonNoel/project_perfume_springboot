package model;

import java.text.SimpleDateFormat;
import java.util.Date;

// 댓글 모델 클래스
public class BoardComment {
	private int ser; // 댓글 고유번호
	private int num; // 댓글을 달 게시글의 고유번호
	private String id;
	private String name; // 댓글 작성자 이름
	private String content; // 댓글 내용
	private Date regdate; // 댓글 작성 날짜
	private SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd"); // toString 작성 날짜 확인용

	// setter, getter
	public int getSer() {
		return ser;
	}

	public void setSer(int ser) {
		this.ser = ser;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "BoardComment [ser=" + ser + ", num=" + num + ", id=" + id + ", name=" + name + ", content=" + content
				+ ", regdate=" + regdate + ", sd=" + sd + "]";
	}

}
