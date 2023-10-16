package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberAnno {

	@Insert("insert into member2 values (#{id},#{pass},#{name},#{gender},#{tel},#{email},#{zipcode},#{address}, sysdate)")
	int insertMember(Member m);

	@Select("select * from member2 where id = #{id}")
	Member oneMember(String id);

	@Update("update member2 set name=#{name}, gender=#{gender}, tel=#{tel}, "
			+ "	    		 email=#{email}, zipcode=#{zipcode}, address=#{address} where id = #{id}")
	int updateMember(Member m);

	@Delete(" delete from member2 where  id = #{id} ")
	int deleteMember(String id);

	@Update("update member2 set pass=#{pass} where id = #{id}")
	int changePass(Map map);

	@Select("select * from member2")
	List<Member> memberList();
	
	@Select("select count(*) from member2 where id = #{id}")
	int checkId(String id);
}