package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Product;

@Repository
public class ProductMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static final String NS = "mybatis.Product.";

	public int insertProduct(Product product) {
		return sqlSession.insert(NS + "insertProduct", product);
	}

	public int productCount(String prodans1) {
		 
		if (prodans1 != null && !prodans1.equals("all")) {		
			prodans1 =" where prodans1 = '"+prodans1+"'"; }
		else  prodans1="";
		Map map = new HashMap();
		map.put("prodans1",prodans1);
		return sqlSession.selectOne(NS + "productCount", map);
	}

	public List<Product> productList(int pageInt, int limit, String prodans1, String order) {
		System.out.println(prodans1);
		// 상품 카테고리 관련 추가
		
		Map map = new HashMap();
		if (prodans1 != null && !prodans1.equals("all")) {		
			prodans1 =" where prodans1 = '"+prodans1+"'"; }
		else  prodans1="";
		
		if (order.equals("stock")) {
			order="order by stock asc";
		}
		else if(order.equals("priceasc")) 
			order= "order by price asc";
		else if(order.equals("pricedesc")) 
			order= "order by price desc";
		else {
			order="order by prodnum desc";
		}
		
		map.put("order",order);
		map.put("prodans1",prodans1);
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", pageInt * limit);
        System.out.println(map);
		return sqlSession.selectList(NS + "productList", map);
	}

	public Product productOne(int prodnum) {
		return sqlSession.selectOne(NS + "productOne", prodnum);
	}

	public List<Product> productManagement(int pageInt, int limit) {
		Map map = new HashMap();
		
		
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", pageInt * limit);
		return sqlSession.selectList(NS + "productManagement", map);
	}

	public int productUpdate(Product product) {
		return sqlSession.insert(NS + "productUpdate", product);
	}

	public int productDelete(int prodnum) {
		sqlSession.delete(NS + "productDelete2", prodnum);
		return sqlSession.delete(NS + "productDelete", prodnum);
	}

	public List<Product> orderProductList(int prodnum) { // 주문서에서 찍어낼 product list
		return sqlSession.selectList(NS + "orderProductList", prodnum);
	}

	public int stockUpdate(Product product) {
		return sqlSession.insert(NS + "stockUpdate", product);

	}

}