package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import model.Board;
import model.ProdReview;
import service.ProdReviewMybatis;

@RestController
@RequestMapping("/prodReview/")
public class ProdReviewController {
	
	@Autowired
	ProdReviewMybatis prd;
	
	Model m;
	HttpSession session;
	HttpServletRequest request;

	// 초기화 작업을 한다, 객체 초기화시에 사용한다
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		session = request.getSession();

	}
	
	// 리뷰 등록
	@PostMapping("enroll")
	public void enrollReview(ProdReview prodReview) {
		prd.insertProdReview(prodReview);
	}
	
	// 리뷰 체크 (이미 작성한 리뷰가 있는지)
	@PostMapping("check")
	public String checkReview(ProdReview prodReview) {
		
		int result = prd.checkReview(prodReview);
		
		if (result != 1) { // 작성한 리뷰가 없는 경우
			return "0";
		} else { // 이미 작성한 리뷰가 있는 경우
			return "1";
		}
	}
	
	// 리뷰 수정
	@PostMapping("update")
	public void updateReview(ProdReview prodReview) {

		prd.updateProdReview(prodReview);
	}
	
	// 리뷰 삭제
	@PostMapping("delete")
	public void deleteReview(int reviewnum) {
		
		prd.deleteProdReview(reviewnum);
	}
	
	
}
