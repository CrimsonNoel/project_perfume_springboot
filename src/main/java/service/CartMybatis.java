package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Cart;

@Repository
public class CartMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static final String NS = "mybatis.Cart.";

	public int insertCart(Cart cart) { // 장바구니 추가
		return sqlSession.insert(NS + "insertCart", cart);
	}

	public int checkCart(Cart cart) { // 중복되는 상품 체크
		int result = 0;
		Map map = new HashMap();
		map.put("id", cart.getId());
		map.put("prodnum", cart.getProdnum());
		cart = sqlSession.selectOne(NS + "cartSelect", map);
		if (cart != null)
			result = 1; // 중복된 상품이 있는 경우
		return result;
	}

	public int checkUpdateCart(int quantity, String id, int prodnum) { // 중복되는 상품 존재할 시에 새로 입력한 수량으로 update
		Map map = new HashMap();
		map.put("quantity", quantity);
		map.put("id", id);
		map.put("prodnum", prodnum);
		return sqlSession.insert(NS + "quantityUpdate", map);
	}

	public List<Cart> cartList(String id) { // 장바구니 리스트
		return sqlSession.selectList(NS + "cartList", id);
	}

	public Cart cartOne(int cartid) { // 장바구니 정보
		return sqlSession.selectOne(NS + "cartOne", cartid);
	}

	public int cartUpdate(Cart cart) { // 장바구니 페이지에서 상품 수량 수정
		return sqlSession.insert(NS + "cartUpdate", cart);
	}

	public int CartDelete(int cartid) { // 장바구니 삭제
		return sqlSession.delete(NS + "cartDelete", cartid);
	}

	public int orderedCartDelete(Cart cart) { // 상품 주문 시 해당 상품 장바구니에서 삭제
		return sqlSession.delete(NS + "orderedCartDelete", cart);
	}

}
