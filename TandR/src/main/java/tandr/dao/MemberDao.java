package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.Member;


public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}
	// database connection pool
	private static SqlSession session;
	static {	// 초기화 블록
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println("연결에러 : "+e.getMessage());
		}
	}
	public Member select(String id) {
		return (Member) session.selectOne("membertr.select",id);
	}
	public int insert(Member member) {
		return session.insert("membertr.insert", member);
	}

	public int changePassword(Member member2) {
		return session.update("membertr.update_pw",member2);
		
	}
	public int update(Member member) {
		return session.update("membertr.update",member);
	}
	public int getTotal() {
		int total=0;
		return (int)session.selectOne("membertr.gettotal",total);
	}
	@SuppressWarnings("unchecked")
	public List<Member> selectList(int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		return session.selectList("membertr.selectList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Member> selectListsearch(int startRow, int endRow, String search,String whereM) {
		HashMap<String, String> map=new HashMap<String,String>();
		String startRowS = Integer.toString(startRow);
		String endRowS = Integer.toString(endRow);

		map.put("startRow", startRowS);
		map.put("endRow", endRowS);
		map.put("search", search);
		map.put("whereM", whereM);
		System.out.println(startRowS+" "+endRowS+" "+search+" "+whereM);
		return session.selectList("membertr.selectSearchList",map);
	}
	public int getSerachTotal(String search,String whereM) {
		HashMap<String, String> map=new HashMap<String,String>();
		map.put("search", search);
		map.put("whereM", whereM);
		return (int)session.selectOne("membertr.gettotalsearch",map);
	}
	public int delete(String id, String del) {
		HashMap<String, String> map=new HashMap<String,String>();
		map.put("id", id);
		map.put("del", del);
		System.out.println(id+" "+del);
		return (int)session.update("membertr.delete",map);
	}
	public int selectScore(String id) {
		// TODO Auto-generated method stub
		return (int)session.selectOne("membertr.selectScore",id);
	}
	
	public int plusScore(String id) {
		return session.update("membertr.plusScore",id);
	}
	
	public int reduceScore(String id) {
		return session.update("membertr.reduceScore",id);
	} 
	public int rvScoreAdd(String id) {
		
		return session.update("membertr.rvScore",id);
	}
	
	

}
