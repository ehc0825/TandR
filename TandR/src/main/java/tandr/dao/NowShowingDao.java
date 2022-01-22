package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.NowShowing;


public class NowShowingDao {
	private static NowShowingDao instance = new NowShowingDao();
	private NowShowingDao() {}
	public static NowShowingDao getInstance() {
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
	
	public NowShowing select(int nsCode) {
		return (NowShowing) session.selectOne("nowShowingtr.select",nsCode);
	}
	
	public NowShowing selectNsCode(int movieCode, int theaterCode, int screenCode, String showingDay) {
		HashMap<String, String> map=new HashMap<String,String>();
		
		String movieCode2 = Integer.toString(movieCode);
		String theaterCode2 = Integer.toString(theaterCode);
		String screenCode2 = Integer.toString(screenCode);
		
		map.put("movieCode", movieCode2);
		map.put("theaterCode", theaterCode2);
		map.put("screenCode", screenCode2);
		map.put("showingDay", showingDay);
		
		return (NowShowing) session.selectOne("nowShowingtr.selectNsCode",map);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<NowShowing> selectDayList(int movieCode, int theaterCode) {
		
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("movieCode", movieCode);
		map.put("theaterCode", theaterCode);
		
		return session.selectList("nowShowingtr.selectDayList",map);
	}
	
	public int selectNsCode2(int movieCode, int theaterCode, int screenCode, String showingDay) {
		HashMap<String, String> map=new HashMap<String,String>();
		
		String movieCode2 = Integer.toString(movieCode);
		String theaterCode2 = Integer.toString(theaterCode);
		String screenCode2 = Integer.toString(screenCode);
		
		map.put("movieCode", movieCode2);
		map.put("theaterCode", theaterCode2);
		map.put("screenCode", screenCode2);
		map.put("showingDay", showingDay);
		
		return (int) session.selectOne("nowShowingtr.selectNsCode2",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<NowShowing> selectList(int startRow, int endRow) {
		
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return session.selectList("nowShowingtr.selectList",map);
	}
	
	public int getTotal() {
		int total=0;
		return (int)session.selectOne("nowShowingtr.gettotal",total);
	}
	
	public int updatePchk(String showingDay, int screenTime) {
		HashMap<String, String> map=new HashMap<String,String>();
		
		String screenTime2 = Integer.toString(screenTime);
		
		map.put("screenTime", screenTime2);
		map.put("showingDay", showingDay);
		
		return (int)session.update("nowShowingtr.updatePchk",map);
	}
	
	public int updatePchk2(String showingDay, int screenTime) {
		
		HashMap<String, String> map=new HashMap<String,String>();
		
		String screenTime2 = Integer.toString(screenTime);
		
		map.put("screenTime", screenTime2);
		map.put("showingDay", showingDay);
	
		return (int)session.update("nowShowingtr.updatePchk2",map);
	}
	
	public int insert(NowShowing nowShowing) {
		// TODO Auto-generated method stub
		return session.insert("nowShowingtr.insert",nowShowing);
	}
	@SuppressWarnings("unchecked")
	public List<NowShowing> selectNsCode3(int scCode,String showingDay) {
		HashMap<String, String> map=new HashMap<String,String>();
		String scCode2 = Integer.toString(scCode);
		map.put("scCode", scCode2);
		map.put("showingDay", showingDay);
		
		
		return session.selectList("nowShowingtr.selectNsCode3",map);
	}
	
	
}
