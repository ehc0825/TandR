package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.Fboard;
import tandr.model.Review;

public class ReviewDao {
	private static ReviewDao instance = new ReviewDao();
	private ReviewDao() { }
	public static ReviewDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println("리뷰게시판 DB연결 에러 : "+e.getMessage());
		}
	}
	public Review select(String id) {
		return (Review) session.selectOne("reviewns.select",id);
	}
	public int getTotal() {
		
		return (int) session.selectOne("reviewns.getTotal");
	}
	@SuppressWarnings("unchecked")
	public List<Review> selectList(int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		return session.selectList("reviewns.list",map);
	}
	@SuppressWarnings("unchecked")
	public List<Review> searchReviw(String result, String resultnum) {
		HashMap<String, String> map=new HashMap<String,String>();
		map.put("result", result);
		map.put("resultnum", resultnum);
		return session.selectList("reviewns.searchreviewlist",map);
	}
	@SuppressWarnings("unchecked")
	public List<Review> selectmainList() {
		
		return session.selectList("reviewns.selectmainList");
	}
	@SuppressWarnings("unchecked")
	public List<Review> selectmyList(int startRow2, int endRow2, String id) {
		HashMap<String, String> map=new HashMap<String,String>();
		String startRow = Integer.toString(startRow2);
		String endRow = Integer.toString(endRow2);
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("id", id);
		return session.selectList("reviewns.mylist",map);
	}
	public int getmyTotal(String id) {

		return (int) session.selectOne("reviewns.getmyTotal",id);
	}
	public int insert(Review review) {
	
		return session.insert("reviewns.insert", review);
	}
	public void readcountUpdate(int rvNum) {
		session.update("reviewns.readcount", rvNum);
	}
	public Review select(int rvNum) {
		
		return (Review) session.selectOne("reviewns.selectOne", rvNum);
	}
	public String selectId(int rvNum) {
		
		return (String) session.selectOne("reviewns.selectId", rvNum);
	}
	public int selectCode(int rvNum) {
		
		return (int) session.selectOne("reviewns.selectCode", rvNum);
	}
	public int update(Review review) {
		
		return (int) session.update("reviewns.update", review);
	}
	public int delete(int rvNum) {
		
		return (int) session.delete("reviewns.delete", rvNum);
	}
	public void updateLike(int rvNum) {
	
		session.update("reviewns.likeUpdate", rvNum);
	}
	public int suspend(int rvNum) {
		
		return (int) session.update("reviewns.suspend", rvNum);
	}
	public int getSearchTotal(String rvsearch, String whereRv) {
		HashMap<String, String> map=new HashMap<String,String>();
		map.put("rvsearch", rvsearch);
		map.put("whereRv", whereRv);
		return (int)session.selectOne("reviewns.gettotalsearch",map);
	}
	@SuppressWarnings("unchecked")
	public List<Review> selectListsearch(int startRow, int endRow, String rvsearch, String whereRv) {
		HashMap<String, String> map=new HashMap<String,String>();
		String startRowS = Integer.toString(startRow);
		String endRowS = Integer.toString(endRow);

		map.put("startRow", startRowS);
		map.put("endRow", endRowS);
		map.put("rvsearch", rvsearch);
		map.put("whereRv", whereRv);
		return session.selectList("reviewns.selectSearchList",map);
	}
	public int getCodeTotal(int movieCode) {
		// TODO Auto-generated method stub
		return (int)session.selectOne("reviewns.getCodeTotal",movieCode);
	}
	
	 
}
