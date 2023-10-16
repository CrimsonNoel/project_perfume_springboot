package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Product;
import model.Survey;

@Repository
public class SurveyMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static final String NS = "mybatis.Survey.";

	public int insertSurvey(Survey survey) {
		return sqlSession.insert(NS + "insertSurvey", survey);
	}

	public Product ProductImage(int ansGender, String ans1, String ans2) {
		Map map = new HashMap();
		map.put("ansGender", ansGender);
		map.put("ans1", ans1);
		map.put("ans2", ans2);
		
		return sqlSession.selectOne(NS + "ProductImage", map);
		
	}
	public Product ProductImageN(String prodName,int ansGender) {
		Map map = new HashMap();
		map.put("prodname", prodName);
		map.put("ansGender", ansGender);
		return sqlSession.selectOne(NS + "ProductImageN", map);
	}
	
	public Product ProductImage2(int ansGender, String ans1) {
		Map map = new HashMap();
		map.put("ansGender", ansGender);
		map.put("ans1", ans1);
		return sqlSession.selectOne(NS + "ProductImage2", map);
	}
	
	public Product ProductImage3(String ans1) {
		Map map = new HashMap();
		map.put("ans1", ans1);
		System.out.println("날씨"+map);
		return sqlSession.selectOne(NS + "ProductImage3", map);
	}

	public List<Survey> surveyList(String id) {

		Map map = new HashMap();
		map.put("id", id);
		return sqlSession.selectList(NS + "surveyList", map);
	}

	public List<Survey> AnswerDoughnut(int ansGender, String ans1) {
		Map map = new HashMap();
		map.put("ansGender", ansGender);
		map.put("ans1", ans1);
		return sqlSession.selectList(NS + "AnswerDoughnut", map);
	}
	
	public Product surveyNo1(int ansGender) {
		
		return sqlSession.selectOne(NS + "surveyNo1", ansGender);
	}
	
	
	
}// end