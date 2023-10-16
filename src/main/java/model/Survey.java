package model;

public class Survey {

	private String id; // 설문한 회원의 id
	private int ser; // 설문 고유번호
	private int ansGender; // 설문정보 1 (1: 남자, 2: 여자)
	private String ans1; // 설문정보2 (선호향, 1: 과일 2: 꽃 3: 나무)
	private String ans2; // 설문정보3 (설문정보 2에 따른 선택지 4가지 씩 총 12개)
	private String prodname; // 설문 결과로 나온 상품의 이름
	private int doughnut; // 설문 시작 페이지에 나올 도넛 그래프 통계용
	
	// setter, getter
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

	public int getAnsGender() {
		return ansGender;
	}

	public void setAnsGender(int ansGender) {
		this.ansGender = ansGender;
	}

	public String getAns1() {
		return ans1;
	}

	public void setAns1(String ans1) {
		this.ans1 = ans1;
	}

	public String getAns2() {
		return ans2;
	}

	public void setAns2(String ans2) {
		this.ans2 = ans2;
	}

	public String getProdname() {
		return prodname;
	}

	public void setProdname(String prodname) {
		this.prodname = prodname;
	}

	public int getDoughnut() {
		return doughnut;
	}

	public void setDoughnut(int doughnut) {
		this.doughnut = doughnut;
	}
	
	// toString
	@Override
	public String toString() {
		return "Survey [id=" + id + ", ser=" + ser + ", ansGender=" + ansGender + ", ans1=" + ans1 + ", ans2=" + ans2
				+ ", prodname=" + prodname + ", doughnut=" + doughnut + "]";
	}

}