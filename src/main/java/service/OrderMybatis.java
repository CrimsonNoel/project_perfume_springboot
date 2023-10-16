package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Order;
import model.OrderItem;

@Repository
public class OrderMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static final String NS = "mybatis.Order.";

	public int insertOrder(Order order) {
		return sqlSession.insert(NS + "insertOrder", order);
	}

	/*
	 * orderResult 1 = 주문 완료 2 = 배송 중 3 = 주문 취소 4 = 배송 완료 5 = 주문 확정
	 */

	public int insertOrderItem(OrderItem orderItem) {
		return sqlSession.insert(NS + "insertOrderItem", orderItem);
	}

	public List<Order> orderList(String id) { // 특정 회원의 주문 리스트
		return sqlSession.selectList(NS + "orderList", id);
	}

	public Order orderOne(String ordernum) { // 주문 정보
		return sqlSession.selectOne(NS + "orderOne", ordernum);
	}

	public List<OrderItem> orderItemList(String ordernum) { // 주문 상세 리스트
		return sqlSession.selectList(NS + "orderItemList", ordernum);
	}

	public int orderUpdate(Order order) { // 주문 상태 변경용
		return sqlSession.insert(NS + "orderUpdate", order);
	}

	public int orderCount() {
		return sqlSession.selectOne(NS + "orderCount");
	}

	public List<Order> orderListAdmin(int pageInt, int limit) { // 모든 회원의 주문 리스트 (관리자용)
		Map map = new HashMap();
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", pageInt * limit);
		return sqlSession.selectList(NS + "orderListAdmin", map);
	}
	
	public List<OrderItem> reviewOrderItem(int prodnum) {
		return sqlSession.selectList(NS + "reviewOrderItem", prodnum);
	}
	
}
