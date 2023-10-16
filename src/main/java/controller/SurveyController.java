package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import model.Product;
import model.Survey;
import service.SurveyMybatis;

//@Controller
@Controller
@RequestMapping("/survey/")
public class SurveyController {

	@Autowired
	SurveyMybatis surbd;

	Model m;
	HttpSession session;
	HttpServletRequest request;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		session = request.getSession();
	}

	// 설문 1페이지 (성별)
	@RequestMapping("survey01")
	public String survey01() {
		return "survey/survey01";
	} // survey01 End

	// 설문 2페이지 (선호향)
	@RequestMapping("survey02")
	public String survey02() {
		return "survey/survey02";
	} // survey02 End

	// 설문 3페이지 (상세 - 과일)
	@RequestMapping("survey03fruit")
	public String survey03fruit() {
		return "survey/survey03fruit";
	} // survey03fruit End

	// 설문 3페이지 (상세 - 꽃)
	@RequestMapping("survey03flower")
	public String survey03flower() {
		return "survey/survey03flower";
	} // survey03flower End

	// 설문 3페이지 (상세 - 나무)
	@RequestMapping("survey03wood")
	public String survey03wood() {
		return "survey/survey03wood";
	} // survey03wood End

	// 설문 결과페이지 
	@RequestMapping("surveyResult")
	public String surveyResult() {
		return "survey/surveyResult";
	} // surveyResult End

	@RequestMapping("weatherajax")
	@ResponseBody
	public List<String> weatherajax(@RequestParam(value = "nowWeather", required = false) String nowWeather) {
		// openweathermap api main부분 날씨만 case로 나눠서 인사글보내기
		// Main종류 : Thunderstorm, Drizzle, Rain, Snow, Clear, Clouds
		// msg 전달. 프론트에서 받은 main 날씨로 db에 던져서 조건에 맞는 상품중 랜덤으로 하나 긁어오기
		// ajax 데이터받아서 다시 보내주는 부분
		String msg = "1";
		String pimage = " ";
		String pname = " ";
		String ans1 = " ";
		int prodimagenum = 1;

		if (nowWeather != null) {
			switch (nowWeather) {
			
			case "Clouds":
			case "Drizzle":
				msg = "우중충한 오늘 날씨를<br>한층 낭만적으로<br>만들어주는 향수";
				ans1 = "fruit";
				break;

			case "Rain":
			case "Snow":
				msg = "오늘처럼 습한 날씨에<br>이런 향수는<br>어떠신가요?";
				ans1 = "flower";
				break;

			case "Clear":
				msg = "오늘처럼 화창한 날씨에<br>잘어울리는 은은하고<br>포근한 우디향수";
				ans1 = "wood";
				break;

			case "Thunderstorm":
				msg = "나도 달래주고<br>날씨도 달래주는<br>향수";
				ans1 = "fruit";
				break;

			default:
				msg = "상쾌하면서도<br>지친 마음을 달래주는<br>그런 향수";
				ans1 = "wood";
			}
			// 날씨 값 받아 상품페이지에서 사진 이름 상품번호 가져오기
			Product p = surbd.ProductImage3(ans1);
			pimage = p.getImage();
			pname = p.getName();
			prodimagenum = p.getProdnum();
			// System.out.println(nowWeather+"\n"+p + "\n" + pimage + "\n" + pname + "\n" + prodimagenum);
		}

		// ajax로 얻은 데이터 리스트로 다시 던져주기
		
		List<String> li = new ArrayList<>();
		li.add(msg);
		li.add(pimage);
		li.add(Integer.toString(prodimagenum));
		return li;
	} // weatherajax End

	// 날씨에 추천상품 사진누르면 링크이동
	@RequestMapping("weather")
	public String weather() {
		String url = " ";
		String pnum = request.getParameter("prodimagenum");
		System.out.println("pnum :" + pnum);

		if (pnum != null) {
			url = "product/productDetail?prodnum=" + pnum;
			m.addAttribute("url", url);
			return "survey/alert";
		}

		return "survey/surveyStart";
	} // weather End

	// 설문 시작 페이지
	@RequestMapping("surveyStart")
	public String surveyStart(Survey s) {
		// 설문 시작화면에 통계표 구현
		// 각 성별 선호 향 도넛그래프로 표시
		// db 비어있을경우 1출력
		String Arr[] = {"flower","fruit","wood"};
		List<Survey> MaleD = new ArrayList<>();
		List<Survey> FemaleD = new ArrayList<>();
		
		for(int i=0; i<3; i++) {
		    List<Survey> resultck = surbd.AnswerDoughnut(1, Arr[i]);
		    Survey maleSurvey = new Survey();
		    if(resultck.isEmpty() || resultck == null) {
		        maleSurvey.setDoughnut(1);
		        System.out.println("1:"+Arr[i]+"는 값이 없어서 1추가 되었습니다");
		    } else {
		        maleSurvey.setDoughnut(resultck.get(0).getDoughnut());
		    }
		    MaleD.add(maleSurvey); 
		}
		
		for(int i=0; i<3; i++) {
		    List<Survey> resultck = surbd.AnswerDoughnut(2, Arr[i]);
		    Survey femaleSurvey = new Survey();
		    if(resultck.isEmpty() || resultck == null) {
		        femaleSurvey.setDoughnut(1);
		        System.out.println("2:"+Arr[i]+"는 값이 없어서 1추가 되었습니다");
		    } else {
		        femaleSurvey.setDoughnut(resultck.get(0).getDoughnut());
		    }
		    FemaleD.add(femaleSurvey); 
		}
		
		m.addAttribute("MaleD", MaleD); 
		m.addAttribute("FemaleD", FemaleD);
		return "survey/surveyStart";
	} // surveyStart End

	// 설문 답변에 따라 다르게 로딩되는 페이지 (설문 2, 설문 3, 설문 결과)
	@RequestMapping("RadioCheckedPro")
	public String RadioCheckedPro(@RequestParam("page") String page, @RequestParam("ck1gender") int ansGender,
			@RequestParam("ck2favorite") String ans1, Survey survey) {
		String msg = "";

		// value 확인
		System.out.println("page:" + page);
		System.out.println("성별: " + ansGender);
		System.out.println("선호향: " + ans1);
		System.out.println("과일?: " + request.getParameter("ck3fruit"));
		System.out.println("꽃?: " + request.getParameter("ck3flower"));
		System.out.println("나무?: " + request.getParameter("ck3wood"));

		switch (page) {

		case "surveyStart":

			return "survey/surveyStart";

		case "survey01":

			return "survey/survey01";

		case "survey02":
			m.addAttribute("ck1gender", ansGender);
			m.addAttribute("ck2favorite", ans1);
			return "survey/survey02";

		case "survey03fruit":
			m.addAttribute("ck1gender", ansGender);
			m.addAttribute("ck2favorite", ans1);
			return "survey/survey03fruit";

		case "survey03flower":
			m.addAttribute("ck1gender", ansGender);
			m.addAttribute("ck2favorite", ans1);
			return "survey/survey03flower";

		case "survey03wood":
			m.addAttribute("ck1gender", ansGender);
			m.addAttribute("ck2favorite", ans1);
			return "survey/survey03wood";

		case "surveyResult":
			m.addAttribute("ck1gender", ansGender);
			m.addAttribute("ck2favorite", ans1);
			m.addAttribute("ck3fruit", request.getParameter("ck3fruit"));
			m.addAttribute("ck3flower", request.getParameter("ck3flower"));
			m.addAttribute("ck3wood", request.getParameter("ck3wood"));

			String ans2 = "";
			if (request.getParameter("ck3fruit") != null && !request.getParameter("ck3fruit").equals("")) {
				ans2 = request.getParameter("ck3fruit");
			}
			if (request.getParameter("ck3flower") != null && !request.getParameter("ck3flower").equals("")) {
				ans2 = request.getParameter("ck3flower");
			}
			if (request.getParameter("ck3wood") != null && !request.getParameter("ck3wood").equals("")) {
				ans2 = request.getParameter("ck3wood");
			}
			
			// 설문 결과창 가운데
			// 설문 문항 따라서 보이는 제품사진//제품이름
			// product db에서 사진, 상품이름,번호 가져오기
			Product p = surbd.ProductImage(ansGender, ans1, ans2);
			if (p == null) {
				p = surbd.ProductImage2(ansGender, ans1);
				System.out.println("==p2실행==");
			} else {
				p = surbd.ProductImage(ansGender, ans1, ans2);
				System.out.println("==정상실행==");
			}
			System.out.println("resultpage출력 : " + ansGender + "," + ans1 + "," + ans2);

			String image = p.getImage();
			String pname = p.getName();
			int prodimagenum = p.getProdnum();

			System.out.println("상품명: " + pname);
			System.out.println("상품사진: " + image);
			System.out.println("상품번호: " + prodimagenum);
			m.addAttribute("pname", pname);
			m.addAttribute("image", image);
			m.addAttribute("prodimagenum", prodimagenum);

			// 설문결과창 좌측
			// 이전 설문 결과 표시 창
			// Answer db에서 id가 가지고잇는 자료들 리스트 출력
			String id = (String) session.getAttribute("id");
			String prodName = " ";
			survey.setId(id);
			List<Survey> anslist = surbd.surveyList(id);
			System.out.println("anslist: " + anslist);
			List<String> anslistImage = new ArrayList<>();
			List<String> anslistImageName = new ArrayList<>();
			List<Integer> anslistProdnum = new ArrayList<>();
			for (int i = 0; i < anslist.size(); i++) {
				ansGender = anslist.get(i).getAnsGender();
				prodName = anslist.get(i).getProdname();
				p = surbd.ProductImageN(prodName, ansGender);
				if (p != null) {
					anslistImage.add(p.getImage());
					anslistImageName.add(prodName);
					anslistProdnum.add(p.getProdnum());
				}
			}
			System.out.println("anslistImage: " + anslistImage);
			System.out.println("prodname: " + anslistImageName);
			System.out.println("prodnum: " + anslistProdnum);

			if (anslistImage != null && anslistImage.size() != 0) {
				msg = "이전 결과";
			}
			m.addAttribute("msg", msg);
			m.addAttribute("anslistImage", anslistImage);
			m.addAttribute("anslistImageName", anslistImageName);
			m.addAttribute("anslistProdnum", anslistProdnum);
			
			// 설문 결과창 우측
			// 가장많은 설문결과를 얻어낸 향수찾아 띄우기. 성별 구분.
			Product Male = surbd.surveyNo1(1);
			Product Female = surbd.surveyNo1(2);

			m.addAttribute("Male", Male);
			m.addAttribute("Female", Female);

			return "survey/surveyResult";
		}

		return page;
	} // RadioCheckedPro End

	// 설문 결과 DB에 저장
	// 이미 설문 조사한 사람도 여러번 참여가능하며 같은 아이디 다른 시퀀스로 설문한 자료 저장됨
	@RequestMapping("surveyInsertPro")
	public String surveyInsertPro(@RequestParam("page") String page, @RequestParam("ck1gender") int ansGender,
			@RequestParam("ck2favorite") String ans1, Survey survey) {
		String url = " ";
		System.out.println(page);

		m.addAttribute("ck1gender", ansGender);
		m.addAttribute("ck2favorite", ans1);
		m.addAttribute("ck3fruit", request.getParameter("ck3fruit"));
		m.addAttribute("ck3flower", request.getParameter("ck3flower"));
		m.addAttribute("ck3wood", request.getParameter("ck3wood"));
		m.addAttribute("pname", request.getParameter("pname"));
		m.addAttribute("prodimagenum", request.getParameter("prodimagenum"));
		m.addAttribute("pnum", request.getParameter("pnum"));

		String id = (String) session.getAttribute("id");
		// String id = "1048";
		String ans2 = " ";
		if (request.getParameter("ck3fruit") != null && !request.getParameter("ck3fruit").equals("")) {
			ans2 = request.getParameter("ck3fruit");
		}
		if (request.getParameter("ck3flower") != null && !request.getParameter("ck3flower").equals("")) {
			ans2 = request.getParameter("ck3flower");
		}
		if (request.getParameter("ck3wood") != null && !request.getParameter("ck3wood").equals("")) {
			ans2 = request.getParameter("ck3wood");
		}

		// 설문 결과저장하기
		// 카테고리 중복 상품, 포함되지 않는 카테고리 외 추천상품 랜덤선택
		// 랜덤선택이기에 창에 띄어져있는 parameter 값 받아서 저장하도록
		Product p = surbd.ProductImage(ansGender, ans1, ans2);
		if (p == null) {
			p = surbd.ProductImage2(ansGender, ans1);
			System.out.println("==p2실행==");
		} else {
			p = surbd.ProductImage(ansGender, ans1, ans2);
			System.out.println("==정상실행==");
		}

		String prodname = request.getParameter("pname");
		int prodnum = Integer.parseInt(request.getParameter("prodimagenum"));
		String anslistProdnum = request.getParameter("pnum");

		survey.setId(id);
		survey.setAnsGender(p.getProdgender());
		survey.setAns1(p.getProdans1());
		survey.setAns2(p.getProdans2());
		survey.setProdname(prodname);
		System.out.println(prodname + ":" + prodnum);
		
		switch (page) {
		// 홈페이지로 클릭시 저장 - 홈페이지 이동
		case "surveyStart":

			int num = surbd.insertSurvey(survey);
			if (num > 0) {
				url = "/home/index";
				System.out.println("저장성공 - 홈페이지로");
			} else {
				System.out.println("저장실패");
			}
			m.addAttribute("url", url);
			return "survey/alert";

		// 설문결과 사진 클릭시 저장 - 상품 상세페이지 이동
		case "product":
			
			num = surbd.insertSurvey(survey);
			if (num > 0) {
				System.out.println("저장성공 - 설문결과추천상품");
				url = "product/productDetail?prodnum=" + prodnum;
			} else {
				System.out.println("저장실패");
			}
			m.addAttribute("url", url);
			return "survey/alert";
			
			// 설문이전결과, 다수추천상품 사진 클릭시 저장 - 상품 상세페이지 이동
		case "product2":

			num = surbd.insertSurvey(survey);
			if (num > 0) {
				System.out.println("저장성공 - 이전결과추천상품 & 다수추천상품");
				url = "product/productDetail?prodnum=" + anslistProdnum;
			} else {
				System.out.println("저장실패");
			}
			m.addAttribute("url", url);
			return "survey/alert";
		}
		return null;
	} // surveyInsertPro End

} // end