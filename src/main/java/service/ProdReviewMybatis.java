package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ProdReview;


@Repository
public class ProdReviewMybatis {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private static final String NS = "mybatis.ProdReview.";
	
	public int insertProdReview(ProdReview prodReview) {
		return sqlSession.insert(NS + "insertProdReview", prodReview);
	}
	
	public int checkReview(ProdReview prodReview) { // 작성한 리뷰가 존재하는지 확인
		int result = 0;
		Map map = new HashMap();
		map.put("id", prodReview.getId());
		map.put("prodnum", prodReview.getProdnum());
		prodReview = sqlSession.selectOne(NS + "checkReview", map);
		if (prodReview != null)
			result = 1; // 이미 작성한 리뷰가 있는 경우
		return result;
	}
	
	public List<ProdReview> reviewList(int prodnum) {
		Map map = new HashMap();
		return sqlSession.selectList(NS + "reviewList", prodnum);
	}
		
	public int reviewTotal (int prodnum) {
		return sqlSession.selectOne(NS + "reviewTotal", prodnum);
	}
	
	public ProdReview reviewOne (int reviewnum) {
		return sqlSession.selectOne(NS + "reviewOne", reviewnum);
	}
	
	public int updateProdReview(ProdReview prodReview) {
		return sqlSession.insert(NS + "reviewUpdate", prodReview);
	}
	
	public int deleteProdReview(int reviewnum) {
		return sqlSession.insert(NS + "deleteReview", reviewnum);
	}
	
}
