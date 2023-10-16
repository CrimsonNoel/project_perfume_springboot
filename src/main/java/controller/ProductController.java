package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import model.OrderItem;
import model.ProdReview;
import model.Product;
import service.OrderMybatis;
import service.ProdReviewMybatis;
import service.ProductMybatis;

@Controller
@RequestMapping("/product/")
public class ProductController {

	@Autowired
	ProductMybatis pd;

	@Autowired
	ProdReviewMybatis prd;
	
	@Autowired
	OrderMybatis od;
	

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

	// 상품 입력 페이지
	@RequestMapping("productForm")
	public String productForm() {

		return "product/productForm";
	} // productForm End

	// 상품 업로드
	@RequestMapping("productPro")
	public String productPro(@RequestParam("f1") MultipartFile multipartFile1,
			@RequestParam("f2") MultipartFile multipartFile2, Product product) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/product/images"; // 사진 파일 경로
		String msg = "상품 등록에 실패하였습니다.";
		String url = "product/productForm";

		String filename1 = " ";
		String filename2 = " ";

		if (!multipartFile1.isEmpty() && !multipartFile2.isEmpty()) {
			File file1 = new File(path, multipartFile1.getOriginalFilename()); // 상품 이미지
			File file2 = new File(path, multipartFile2.getOriginalFilename()); // 상세 이미지

			filename1 = multipartFile1.getOriginalFilename();
			filename2 = multipartFile2.getOriginalFilename();
			try {
				multipartFile1.transferTo(file1);
				multipartFile2.transferTo(file2);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		product.setImage(filename1);
		product.setDetail(filename2);

		int num = pd.insertProduct(product);
		if (num > 0) {
			msg = "상품이 등록되었습니다.";
			url = "/product/productManagement?prodans1=all&order=prodnumt";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // productPro End

	// 상품 페이지
	@RequestMapping("shop")
	public String productList() {
		
		// 상품 카테고리
		String prodans1 = request.getParameter("prodans1");
		if ( prodans1!= null) /* */ {
			session.setAttribute("pageNum", "1");
		}
		String order = request.getParameter("order");
		
		if (request.getParameter("pageNum") != null) /* pageNum을 넘겨 받음 */ {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1"; // 넘겨받은 pageNum이 없으면 1페이지로
		if (order == null)
			order = "prodnum";
		
		
		if (prodans1==null) prodans1="all";
		int limit = 6; // 한 page 당 게시물 갯수
		int pageInt = Integer.parseInt(pageNum); // page 번호
		
		
		int productCount = pd.productCount(prodans1); // 전체 게시물 갯수
		int prodNum = productCount - ((pageInt - 1) * limit);

		List<Product> li = pd.productList(pageInt, limit, prodans1, order);
	    System.out.println(li.size());
	
		// 상품 카테고리 이름
		String ansName = "";
		
		switch (prodans1) {
		case "all":
			ansName = "전체 상품";
			break;
		case "wood":
			ansName = "우디";
			break;
		case "flower":
			ansName = "플로럴";
			break;
		case "fruit":
			ansName = "프루티";
			break;	
		}
		

		int bottomLine = 3;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1;

		int end = start + bottomLine - 1;
		int maxPage = (productCount / limit) + (productCount % limit == 0 ? 0 : 1);
		if (end > maxPage) 	end = maxPage;
		
		List prodnumLi = new ArrayList();
		List<ProdReview> reviewList = new ArrayList();
		List ratingList = new ArrayList();
		int totalRating = 0;
		double avgRating = 0;
		for (int i = 0; i < li.size(); i++) {
			int prodnum = li.get(i).getProdnum();
			prodnumLi.add(prodnum);
			reviewList = prd.reviewList(prodnum);
			if (reviewList.isEmpty() != true) { // 리뷰가 있는 경우
				if (reviewList.size() > 1) {
					for (int j = 0; j < reviewList.size(); j++) {
						totalRating += reviewList.get(j).getRating();
					}
					avgRating = (double) totalRating / reviewList.size();
					ratingList.add(Math.round(avgRating*10)/10.0);
				} else {
					ratingList.add(reviewList.get(0).getRating());
				}				
			} else { // 리뷰가 없는 경우
				ratingList.add(0);
			}
		}
		System.out.println(start+":"+end);
		m.addAttribute("ratingList", ratingList);
		m.addAttribute("li", li);
		m.addAttribute("prodNum", prodNum);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("maxPage", maxPage);
		m.addAttribute("order", order);
		m.addAttribute("prodans1", prodans1);
		m.addAttribute("ansName",ansName);
		return "product/shop";
	} // productList End

	// 상품 관리 페이지 (admin 전용)
	@RequestMapping("productManagement")
	public String productManagement() {
		if (request.getParameter("prodans1") != null) /* */ {
			session.setAttribute("prodans1", request.getParameter("prodans1"));
			
			
		session.setAttribute("pageNum", "1");
		}
		
		if (request.getParameter("pageNum") != null) /* pageNum을 넘겨 받음 */ {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		
		
		String prodans1 = (String) session.getAttribute("prodans1");
		
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1"; // 넘겨받은 pageNum이 없으면 1페이지로
		

		int limit = 6; // 한 page 당 게시물 갯수
		int pageInt = Integer.parseInt(pageNum); // page 번호
		int productCount = pd.productCount(prodans1); // 전체 게시물 갯수
		int prodNum = productCount - ((pageInt - 1) * limit);
		 String order = request.getParameter("order");
		List<Product> ma = pd.productList(pageInt, limit, prodans1, order);

		int bottomLine = 5;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1;

		int end = start + bottomLine - 1;
		int maxPage = (productCount / limit) + (productCount % limit == 0 ? 0 : 1);
		if (end > maxPage)
			end = maxPage;

		m.addAttribute("prodNum", prodNum);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("maxPage", maxPage);
		m.addAttribute("ma", ma);
		return "product/productManagement";
	} // productManagement End

	// 상품 정보 수정 페이지 (admin 전용)
	@RequestMapping("productUpdateForm")
	public String productUpdateForm(@RequestParam("prodnum") int prodnum) {

		Product product = pd.productOne(prodnum);

		m.addAttribute("product", product);
		return "product/productUpdateForm";
	} // productUpdateForm End

	// 상품 정보 수정 (admin 전용)
	@RequestMapping("productUpdatePro")
	public String productUpdatePro(@RequestParam("f1") MultipartFile multipartFile1,
			@RequestParam("f2") MultipartFile multipartFile2, @RequestParam("prodnum") int prodnum, Product product) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/product/images"; // 사진 파일 경로
		String msg = "";
		String url = "";

		Product productOne = pd.productOne(prodnum);

		String filename1 = productOne.getImage();
		String filename2 = productOne.getDetail();

		if (!multipartFile1.isEmpty()) {
			File file1 = new File(path, multipartFile1.getOriginalFilename()); // 상품 이미지
			filename1 = multipartFile1.getOriginalFilename();
			try {
				multipartFile1.transferTo(file1);
				product.setImage(filename1);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		if (!multipartFile2.isEmpty()) {
			File file2 = new File(path, multipartFile2.getOriginalFilename()); // 상세 이미지
			filename2 = multipartFile2.getOriginalFilename();
			try {
				multipartFile2.transferTo(file2);
				product.setDetail(filename2);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		if (pd.productUpdate(product) > 0) /* Update OK */ {
			msg = "수정을 완료했습니다.";
			url = "/product/productManagement?prodans1=all&order=prodnum";
		} else { // update fail
			msg = "수정을 실패했습니다.";
			url = "/product/productUpdateForm?prodnum=" + product.getProdnum(); // 해당 게시물의 UpdateForm으로 이동
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // productUpdatePro End

	// 상품 삭제 페이지 (admin 전용)
	@RequestMapping("productDeleteForm")
	public String productDeleteForm(@RequestParam("prodnum") int prodnum) {

		m.addAttribute("prodnum", prodnum);
		return "product/productDeleteForm";
	} // productDeleteForm End

	// 상품 삭제 (admin 전용)
	@RequestMapping("productDeletePro")
	public String productDeletePro(@RequestParam("prodnum") int prodnum) {

		String msg = "";
		String url = "";
		if (pd.productDelete(prodnum) > 0) {
			msg = "상품이 삭제 되었습니다.";
			url = "/product/productManagement?prodans1=all&order=prodnum";
		} else {
			msg = "상품 삭제에 실패했습니다.";
			url = "/product/productManagement?prodans1=all&order=prodnum";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // productDeletePro End

	// 상품 상세 페이지
	@RequestMapping("productDetail")
	public String productDetail(@RequestParam("prodnum") int prodnum) {
		String id = (String) session.getAttribute("id");
		Product product = pd.productOne(prodnum);
		
		List<ProdReview> list = prd.reviewList(prodnum);
		
		int myReviewNum = 0;
		List reviewIdList = new ArrayList();
		
		for (int i = 0; i < list.size(); i++) {
			int reviewnum = list.get(i).getReviewnum();
			if (prd.reviewOne(reviewnum).getId().equals(id)) {
				myReviewNum = reviewnum;
				reviewIdList.add(prd.reviewOne(reviewnum).getId());
			}
		}
		ProdReview myReview = prd.reviewOne(myReviewNum);
		
		// 구매했는지 확인 (구매한 경우에만 리뷰 작성 가능)
		List<OrderItem> orderItemList = od.reviewOrderItem(prodnum);
		List<String> ordernumList = new ArrayList<String>(); // 모든 ordernum 리스트
		List<String> splitOrdernumList = new ArrayList<String>(); // ordernumList를 split("_")한 배열의 요소를 추가한 리스트
		int availableReview = 0; // 리뷰 작성 가능상태 (0 = 리뷰 작성 불가, 1 = 리뷰 작성 가능)
		
		if (orderItemList.isEmpty() != true) { // 한 번이라도 누군가 주문한 적이 있는 상품인 경우
			for (int i = 0; i < orderItemList.size(); i++) {
				String ordernum = orderItemList.get(i).getOrdernum();
				if (od.orderOne(ordernum).getResult() == 5) { // 주문 확정한 상품인 경우 (주문 확정한 상품에 대해서만 리뷰 작성 가능)
					String[] ordernumArr = ordernum.split("_"); // ordernum을 split("_")한 배열
					for (int j = 0; j < ordernumArr.length; j++) {
						String splitOrdernum = ordernumArr[j];
						splitOrdernumList.add(splitOrdernum); // 해당 배열의 요소들을 splitOrdernumList에 추가
					}
				}
			}
			if (splitOrdernumList.contains(id)) { // splitOrdernumList에 현재 세션의 id가 있는 경우
				availableReview = 1;
			}
		}
		
		m.addAttribute("availableReview", availableReview);
		m.addAttribute("reviewIdList", reviewIdList);
		m.addAttribute("myReview", myReview);
		m.addAttribute("list", list);
		m.addAttribute("id", id);
		m.addAttribute("product", product);
		return "product/productDetail";
	} // productDetail End

	// 리뷰 등록 페이지 테스트
	@RequestMapping("reviewEnroll/{id}")
	public String reviewEnrollWindowGET(@PathVariable("id") String id, @RequestParam("prodnum") int prodnum) {
		Product product = pd.productOne(prodnum);
		
				
		m.addAttribute("product", product);
		m.addAttribute("id", id);
		return "product/reviewEnroll";
	}
	
	/* 리뷰 수정 팝업창 */
	@RequestMapping("reviewUpdate")
	public String reviewUpdateWindowGET(ProdReview prodReview,
			@RequestParam("reviewnum") int reviewnum,
			@RequestParam("prodnum") int prodnum) {
		String id = (String) session.getAttribute("id");
		Product product = pd.productOne(prodnum);
		ProdReview review = prd.reviewOne(reviewnum);
		
		m.addAttribute("product", product);
		m.addAttribute("review", review);
		m.addAttribute("id", id);
		return "product/reviewUpdate";
	}
	
	/* 리뷰 삭제 팝업창 */
	@RequestMapping("reviewDelete")
	public String reviewDeleteWindowGET(ProdReview prodReview,
			@RequestParam("reviewnum") int reviewnum) {
		String id = (String) session.getAttribute("id");
		ProdReview review = prd.reviewOne(reviewnum);
		
		m.addAttribute("id", id);
		m.addAttribute("review", review);
		return "product/reviewDelete";
	}
	
	

} // ProductController End