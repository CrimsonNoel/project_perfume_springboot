package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import model.Order;
import model.OrderItem;
import model.Product;
import service.CartMybatis;
import service.MemberMybatis;
import service.OrderMybatis;
import service.ProductMybatis;

@Controller
@RequestMapping("/order/")
public class OrderController {
	
	@Autowired
	CartMybatis cd;
	
	@Autowired
	ProductMybatis pd;
	
	@Autowired
	OrderMybatis od;
	
	@Autowired
	MemberMybatis md;
	
	Model m;
	HttpSession session;
	HttpServletRequest request;
	
	// 초기화 작업을 한다, 객체 초기화 시에 사용한다.
	@ModelAttribute
	void init (HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		session = request.getSession();
	}
	
	// 주문 페이지
	@RequestMapping("order")
	public String order() {
		String id = (String) session.getAttribute("id");
		String[] chk = request.getParameterValues("chk");

		Member member = md.oneMember(id);

		Cart cart = new Cart();
		List<Product> li = new ArrayList<Product>();
		List<List<Product>> list = new ArrayList<>();
		List<Integer> quantityList = new ArrayList<>();

		int quantity = 0;
		int prodnum = 0;

		m.addAttribute("member", member);

		if (chk == null) { // 상품 페이지에서 바로 주문한 경우
			prodnum = Integer.parseInt(request.getParameter("prodnum"));
			quantity = Integer.parseInt(request.getParameter("quantity"));
			li = pd.orderProductList(prodnum);
			Product product = pd.productOne(prodnum);
			m.addAttribute("li", li);
			m.addAttribute("quantity", quantity);
			if (product.getStock() < quantity) { // 주문 수량이 더 많은 경우
				String msg = "주문하시려는 수량이 재고보다 많습니다.";
				String url = "product/productDetail?prodnum=" + prodnum;
				m.addAttribute("msg", msg);
				m.addAttribute("url", url);
				return "alert";
			} else {
				System.out.println(li);
				return "order/order";
			}
		} else { // 장바구니에서 주문한 경우
			for (String s : chk) {
				int cartid = Integer.parseInt(s);
				cart = cd.cartOne(cartid);
				quantity = cart.getQuantity(); // 체크된 상품의 quantity
				prodnum = cart.getProdnum(); // 체크된 상품의 prodnum
				li = pd.orderProductList(prodnum);
				Product product = pd.productOne(prodnum);
				list.add(li);
				if (product.getStock() < quantity) { // 주문 수량이 해당 상품의 재고보다 많은 경우
					String msg = "주문하시려는 " + product.getName() + "상품의 수량이 재고보다 많습니다.";
					String url = "cart/cartList";
					m.addAttribute("msg", msg);
					m.addAttribute("url", url);
					return "alert";
				} else {
					quantityList.add(quantity);
				}

			}
			System.out.println(list);
			System.out.println(quantityList);
			m.addAttribute("list", list);
			m.addAttribute("quantityList", quantityList);
			return "order/order";
		}
	} // orderEnd
	
	// 주문
	@RequestMapping("orderPro")
	public String orderPro(Order order, OrderItem orderItem) {
		String id = (String) session.getAttribute("id");
		String msg = "";
		String url = "";

		// 주문 번호 만들기 용 (양식: id + 년월일시분초)
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddHHmmss");
		String ordernum = id + format.format(date);
		// 주문 완료 시 장바구니 삭제
		Cart cart = new Cart();
		
		order.setId(id);
		order.setResult(1);
		order.setOrdernum(ordernum); // 주문 번호 (id + 년도월일시분초)
		
		System.out.println(order);
		if (request.getParameterValues("multi-prodnum") == null) { // 상품 페이지 -> 주문서인 경우
			int prodnum = Integer.parseInt(request.getParameter("single-prodnum"));
			int quantity = Integer.parseInt(request.getParameter("single-quantity"));
			int price = Integer.parseInt(request.getParameter("single-price"));
			int totalPrice = Integer.parseInt(request.getParameter("single-total-price"));

			if (totalPrice > 50000) { // 5만원 이상인 경우 배송비 무료
				order.setDelivercost(0);
			} else {
				order.setDelivercost(2500);
			}
			orderItem.setProdnum(prodnum);
			orderItem.setPrice(price);
			orderItem.setQuantity(quantity);

			if (od.insertOrder(order) > 0) {
				orderItem.setOrdernum(order.getOrdernum()); // orderItem에 추가될 ordernum 설정
				od.insertOrderItem(orderItem); // order가 될 경우 orderItem에도 해당 상품들 추가
				// 재고 Update
				Product p = pd.productOne(prodnum);
				int stock = p.getStock() - quantity;
				p.setStock(stock);
				pd.stockUpdate(p);
				msg = "주문이 완료되었습니다.";
				url = "order/orderResult?ordernum=" + ordernum;
			} else {
				msg = "오류가 발생했습니다.";
				url = "product/productDetail?prodnum=" + prodnum;
			}
		} else { // 장바구니 -> 주문서인 경우 (상품이 여러개)
			String[] multiProdnum = request.getParameterValues("multi-prodnum");
			String[] multiQuantity = request.getParameterValues("multi-quantity");
			String[] multiPrice = request.getParameterValues("multi-price");
			String[] multiTotalPrice = request.getParameterValues("multi-total-price");

			int finalTotalPrice = 0;
			for (int i = 0; i < multiTotalPrice.length; i++) {
				finalTotalPrice += Integer.parseInt(multiTotalPrice[i]);
			}

			if (finalTotalPrice > 50000) { // 5만원 이상인 경우 무료배송
				order.setDelivercost(0);
			} else {
				order.setDelivercost(2500);
			}

			if (od.insertOrder(order) > 0) {
				for (int i = 0; i < multiProdnum.length; i++) {
					orderItem.setProdnum(Integer.parseInt(multiProdnum[i]));
					orderItem.setPrice(Integer.parseInt(multiPrice[i]));
					orderItem.setQuantity(Integer.parseInt(multiQuantity[i]));
					orderItem.setOrdernum(order.getOrdernum());
					od.insertOrderItem(orderItem);
					// 장바구니에서 삭제
					cart.setProdnum(Integer.parseInt(multiProdnum[i]));
					cart.setId(id);
					cd.orderedCartDelete(cart);
					// 재고 update
					Product p = pd.productOne(Integer.parseInt(multiProdnum[i]));
					int stock = p.getStock() - Integer.parseInt(multiQuantity[i]);
					p.setStock(stock);
					pd.stockUpdate(p);
				}
				msg = "주문이 완료되었습니다.";
				url = "order/orderResult?ordernum=" + ordernum;
			} else {
				msg = "오류가 발생했습니다.";
				url = "cart/cartList";
			}
		}
		
		m.addAttribute("ordernum", ordernum);
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // orderPro End
	
	// 주문내역
	@RequestMapping("orderList")
	public String orderList() {
		String id = (String) session.getAttribute("id");

		Member member = md.oneMember(id);

		List<Order> li = od.orderList(id); // 세션에 로그인 된 ID의 주문내역

		m.addAttribute("li", li);
		m.addAttribute("member", member);
		return "order/orderList";
	} // orderList End
	
	// 주문 상세 페이지
	@RequestMapping("orderDetail")
	public String orderDetail(@RequestParam("ordernum") String ordernum) {
		String id = (String) session.getAttribute("id");
		System.out.println(ordernum);

		List<OrderItem> li = od.orderItemList(ordernum);
		Order order = od.orderOne(ordernum);

		// 상품 이름 찍기
		int prodnum = 0;
		String prodname = "";
		List<String> prodnameLi = new ArrayList<String>(); // 상품 이름 리스트
		List<Integer> prodnumLi = new ArrayList<Integer>(); // 상품 prodnum 리스트 (해당 상품 페이지로 이동 가능하게)
		for (int i = 0; i < li.size(); i++) {
			prodnum = li.get(i).getProdnum();
			Product product = pd.productOne(prodnum);
			if (product != null) {
				prodnumLi.add(prodnum);
				prodname = product.getName();
				prodnameLi.add(prodname);
			} else {
				prodnameLi.add("deletedProduct");
			}
			
		}
		System.out.println(prodnameLi);

		m.addAttribute("id", id);
		m.addAttribute("order", order);
		m.addAttribute("ordernum", ordernum);
		m.addAttribute("prodnumLi", prodnumLi);
		m.addAttribute("prodnameLi", prodnameLi);
		m.addAttribute("li", li);
		return "order/orderDetail";
	} // orderDetail End
	
	// 주문 취소 페이지
	@RequestMapping("orderCancelForm")
	public String orderCancelForm(@RequestParam("ordernum") String ordernum) {

		m.addAttribute("ordernum", ordernum);
		return "order/orderCancelForm";
	} // ordeerCancelForm End
	
	// 주문 취소
	@RequestMapping("orderCancelPro")
	public String orderCancelPro(@RequestParam("ordernum") String ordernum) {
		String id = (String) session.getAttribute("id");

		String msg = "";
		String url = "";

		Order order = new Order();
		List<OrderItem> li = od.orderItemList(ordernum);
		int prodnum = 0;
		int quantity = 0;

		List<Integer> prodnumLi = new ArrayList<Integer>(); // 상품 prodnum 리스트 (해당 상품 페이지로 이동 가능하게)
		List<Integer> quantityLi = new ArrayList<Integer>(); // 수량 리스트
		for (int i = 0; i < li.size(); i++) {
			prodnum = li.get(i).getProdnum();
			quantity = li.get(i).getQuantity();
			prodnumLi.add(prodnum);
			quantityLi.add(quantity);
		}

		// 재고 update 용
		order.setOrdernum(ordernum);
		// 아이디 검사용
		Order orderOne = od.orderOne(ordernum);

		if (id.equals(orderOne.getId())) {
			// result 3: 주문 취소
			order.setResult(3);
			if (od.orderUpdate(order) > 0) {
				for (int i = 0; i < li.size(); i++) {
					// 주문 취소하면 해당 상품의 재고를 돌려놓기
					Product p = pd.productOne(prodnumLi.get(i));
					int stock = p.getStock() + quantityLi.get(i);
					p.setStock(stock);
					pd.stockUpdate(p);
				}
				msg = "주문이 취소되었습니다.";
				url = "order/orderList";
			} else {
				msg = "오류가 발생했습니다.";
				url = "order/orderDetail?ordernum=" + ordernum;
			}
		} else {
			msg = "해당 주문을 하신 유저만 주문 취소를 하실 수 있습니다.";
			url = "home/index";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // orderCancelPro End
	
	// 주문 결과 페이지
	@RequestMapping("orderResult")
	public String orderResult(@RequestParam("ordernum") String ordernum) {

		m.addAttribute("ordernum", ordernum);
		return "order/orderResult";
	} // orderResult End
	
	// 주문 확정
	@RequestMapping("orderConfirm")
	public String orderConfirm(@RequestParam("ordernum") String ordernum) {
		String id = (String) session.getAttribute("id");
		Order order = od.orderOne(ordernum);
		String msg = "";
		String url = "";

		if (id.equals(order.getId())) {
			order.setResult(5); // 5: 주문 확정
			if (od.orderUpdate(order) > 0) {
				msg = "주문이 확정되었습니다.";
				url = "order/orderList";
			}
		} else {
			msg = "해당 주문을 하신 유저만 주문 확정이 가능합니다.";
			url = "home/index";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // orderConfirm End
	
	// 주문 관리 페이지 (admin 전용)
	@RequestMapping("orderManagement")
	public String orderManagement() {
		session.setAttribute("pageNum", "1");
		if (request.getParameter("pageNum") != null) /* pageNum을 넘겨 받음 */ {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1"; // 넘겨받은 pageNum이 없으면 1페이지로
		

		int limit = 10; // 한 page 당 게시물 갯수
		int pageInt = Integer.parseInt(pageNum); // page 번호
		int orderCount = od.orderCount(); // 전체 게시물 갯수
		int orderNum = orderCount - ((pageInt - 1) * limit);

		List<Order> li = od.orderListAdmin(pageInt, limit);

		int bottomLine = 3;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1;

		int end = start + bottomLine - 1;
		int maxPage = (orderCount / limit) + (orderCount % limit == 0 ? 0 : 1);
		if (end > maxPage)
			end = maxPage;

		List<Integer> resultLi = new ArrayList<Integer>();
		int result = 0;

		for (int i = 0; i < li.size(); i++) {
			result = li.get(i).getResult();
			resultLi.add(result);
		}

		m.addAttribute("li", li);
		m.addAttribute("orderNum", orderNum);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("maxPage", maxPage);
		m.addAttribute("resultLi", resultLi);
		return "/order/orderManagement";
	} // orderManagement End
	
	// 주문 상태 수정 (admin 전용)
	@RequestMapping("orderStateUpdate")
	public String orderStateUpdate(@RequestParam("ordernum") String ordernum,
			@RequestParam("result") int result) {
		String msg = "";
		String url = "";

		Order order = od.orderOne(ordernum);
		order.setResult(result);

		if (od.orderUpdate(order) > 0) {
			System.out.println(result);
			msg = "주문 상태 수정이 완료되었습니다.";
			url = "order/orderManagement";
		} else {
			msg = "오류가 발생했습니다.";
			url = "order/orderManagement";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // orderStateUpdate End

} // OrderController End
