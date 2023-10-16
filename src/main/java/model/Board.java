package model;

import java.text.SimpleDateFormat;
import java.util.Date;

// 게시글 모델 클래스
public class Board {
	private int num; // 게시글 고유번호
	private String boardid; // 게시글 카테고리 (공지사항 / 이벤트)
	private String name; // 게시글 작성자 id
	private String subject; // 게시글 제목
	private String content; // 게시글 내용
	private String image; // 게시글 첨부 이미지
	private Date regdate; // 게시글 작성 날짜
	private int readcnt; // 게시글 조회수
	private SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd"); // toString 작성 날짜 확인용

	// setter, getter
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getBoardid() {
		return boardid;
	}

	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	// toString
	@Override
	public String toString() {
		return "board [num=" + num + ", boardid=" + boardid + ", name=" + name + ", subject=" + subject + ", content="
				+ content + ", image=" + image + ", regdate=" + regdate + ", sd=" + sd + ", readcnt=" + readcnt + "]";
	}
}
