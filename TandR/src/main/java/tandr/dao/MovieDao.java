package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.Movie;


public class MovieDao {
	private static MovieDao instance = new MovieDao();
	private MovieDao() {}
	public static MovieDao getInstance() {
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
	public Movie select(int movieCode) {
		return (Movie) session.selectOne("movietr.select",movieCode);
	}
	
	
	public int getTotalClosed() {
		int total=0;
		return (int)session.selectOne("movietr.gettotalClosed",total);
	}
	public int getTotalNow() {
		int total=0;
		return (int)session.selectOne("movietr.gettotalNow",total);
	}
	public int getTotalComing() {
		int total=0;
		return (int)session.selectOne("movietr.gettotalComing",total);
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> selectList(int movieCode, int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("movieCode", movieCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("movietr.selectInfo",map);
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	
	public List<Movie> selectNowList(int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		return session.selectList("movietr.selectNowList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Movie> selectClosedList(int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		return session.selectList("movietr.selectClosedList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Movie> selectComingList(int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		return session.selectList("movietr.selectComingList",map);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Movie> selectTop10List(int top10) {
		HashMap<String, Integer>map=new HashMap<String, Integer>();
		map.put("top10", top10);
		return session.selectList("movietr.selectTop10List",map);
	}
	@SuppressWarnings("unchecked")
	public List<Movie> searchMovie(String result, String mresultnum) {
		HashMap<String, String> map=new HashMap<String,String>();
		map.put("result", result);
		map.put("mresultnum", mresultnum);
		return session.selectList("movietr.searchMovielist",map);
	}
	public int getTotal() {
		int total=0;
		return (int)session.selectOne("movietr.gettotal",total);
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> selectList(int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return session.selectList("movietr.selectList",map);
	}
	
	public int updateClosed(int movieCode) {
		
		return (int)session.update("movietr.updateClosed",movieCode);
	}
	
	public int updateNow(int movieCode) {
		
		return (int)session.update("movietr.updateNow",movieCode);
	}
	public String selectTitle(int movieCode) {
		
		return (String) session.selectOne("movietr.selectTitle", movieCode);
	}
	
	public int insert(Movie movie) {
		
		return session.insert("movietr.insert", movie);
	}
	public int selectMovieCode() {
		
		return (int)session.selectOne("movietr.selectMovieCode");
	}
	public int getStar(int movieCode) {
		
		return (int)session.selectOne("movietr.getStar",movieCode);
	}
	public int updateMovieStar(int nowstar, int movieCode) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("nowstar", nowstar);
		map.put("movieCode", movieCode);
		return (int)session.update("movietr.updateMovieStar",map);
	}
	
}