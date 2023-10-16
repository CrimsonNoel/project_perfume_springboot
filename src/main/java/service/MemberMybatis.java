package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Member;
import mybatis.MemberAnno;

@Repository
public class MemberMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMember(Member m) {
		int num = sqlSession.getMapper(MemberAnno.class).insertMember(m);
		return num;
	}

	public Member oneMember(String id) {

		return sqlSession.getMapper(MemberAnno.class).oneMember(id);
	}

	public int updateMember(Member m) {
		System.out.println(m);
		int num = sqlSession.getMapper(MemberAnno.class).updateMember(m);
		return num;

	}

	public int deleteMember(String id) {

		int num = sqlSession.getMapper(MemberAnno.class).deleteMember(id);
		return num;

	}

	public int changePass(String id, String newPass) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("pass", newPass);
		int num = sqlSession.getMapper(MemberAnno.class).changePass(map);
		return num;
	}

	public List<Member> memberList() {

		return sqlSession.getMapper(MemberAnno.class).memberList();
	}
	
	public int checkId(String id) {
		int result = sqlSession.getMapper(MemberAnno.class).checkId(id);
		return result;
	}
}