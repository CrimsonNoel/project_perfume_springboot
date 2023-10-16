package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import model.Cart;
import model.Member;
import model.Product;
import service.CartMybatis;
import service.MemberMybatis;
import service.ProductMybatis;

@Controller
@RequestMapping("/cart/")
public class CartController {

	@Autowired
	CartMybatis cd;

	@Autowired
	MemberMybatis md;

	@Autowired
	ProductMybatis pd;

	Model m;
	HttpSession session;
	HttpServletRequest request;

	// 초기화 작업을 한다, 객체 초기화 시에 사용한다.
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		session = request.getSession();
	}
	
	// 장바구니 추가
	@RequestMapping("cartPro")
	public String cartPro(@RequestParam("prodnum") int prodnum,
			@RequestParam("quantity") int quantity,
			@RequestParam("price") int price, Cart c) {
		String id = (String) session.getAttribute("id");
		String msg = "";
		String url = "";
		
		String prodname = request.getParameter("prodname");
		
		c.setId(id);
		c.setProdnum(prodnum);
		c.setProdname(prodname);
		c.setQuantity(quantity);
		c.setPrice(price);
		c.setResult(1); // 주문유무. 기본 1 = 주문 X 상태

		Product product = pd.productOne(prodnum);

		int result = cd.checkCart(c); // 장바구니에 있는지 확인

		if (result != 1) {
			if (product.getStock() < quantity) { // 주문 수량이 재고보다 많은 경우
				msg = "장바구니에 추가하실 수량이 재고보다 많습니다.";
				url = "product/productDetail?prodnum=" + prodnum;
			} else { // 주문 수량이 재고보다 적거나 같은 경우
				cd.insertCart(c);
				msg = "장바구니에 추가했습니다.";
				url = "cart/cartList";
			}
		} else {
			cd.checkUpdateCart(quantity, id, prodnum); // 이미 장바구니에 존재하는 경우 quantity update
			msg = "이미 장바구니에 존재하는 상품입니다.";
			url = "cart/cartList";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // cartPro End
	
	// 장바구니 페이지
	@RequestMapping("cartList")
	public String cartList() {
		String id = (String) session.getAttribute("id");
		List<Cart> li = cd.cartList(id); // 세션에 로그인 된 ID의 모든 장바구니 데이터 불러오기
		Member member = md.oneMember(id);

		m.addAttribute("member", member);
		m.addAttribute("li", li);
		m.addAttribute("id", id);
		return "cart/cartList";
	} // cartList end
	
	// 장바구니 업데이트 (수량 업데이트)
	@RequestMapping("cartUpdate")
	public String cartUpdate(@RequestParam("cartid") int cartid, 
			@RequestParam("quantity") int quantity, Cart c) {
		String msg = "오류가 발생했습니다.";
		String url = "cart/cartList";
		
		c.setCartid(cartid);
		c.setQuantity(quantity);
		Cart cart = cd.cartOne(cartid);
		int prodnum = cart.getProdnum();
		Product product = pd.productOne(prodnum);
		int stock = product.getStock();

		if (stock < quantity) { // 장바구니에 추가하려는 상품의 수량이 재고보다 많은 경우
			msg = "해당 상품의 재고보다 수량이 많습니다.";
			url = "cart/cartList";
		} else {
			cd.cartUpdate(c);
			msg = "수정되었습니다.";
			url = "cart/cartList";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // cartUpdate End
	
	// 장바구니 삭제
	@RequestMapping("cartDelete")
	public String cartDelete(@RequestParam("cartid") int cartid, Cart c) {
		String msg = "오류가 발생했습니다.";
		String url = "cart/cartList";

		c.setCartid(cartid);
		if (cd.CartDelete(cartid) > 0) {
			msg = "해당 상품이 장바구니에서 삭제되었습니다.";
			url = "cart/cartList";
		} else {
			msg = "해당 상품을 장바구니에서 삭제하는데 실패했습니다.";
			url = "cart/cartList";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // cartDelete End

} // cartController End
