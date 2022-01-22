package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.Screen;


public class ScreenDao {
	private static ScreenDao instance = new ScreenDao();
	private ScreenDao() {}
	public static ScreenDao getInstance() {
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
	public Screen select(int screenCode) {
		return (Screen) session.selectOne("screensc.select",screenCode);
	}
	@SuppressWarnings("unchecked")
	public List<Screen> selectScreenNum(int movieCode,int theaterCode) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("movieCode", movieCode);
		map.put("theaterCode", theaterCode);
		
		
		return session.selectList("screensc.selectScreenNum",map);
	}
	
	public Screen selectScreenCode(int movieCode,int theaterCode,int screenTime) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("movieCode", movieCode);
		map.put("theaterCode", theaterCode);
		map.put("screenTime", screenTime);
		
		return (Screen) session.selectOne("screensc.selectScreenCode",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Screen> selectScreenList(int movieCode, int theaterCode, String showingDay) {
		
		HashMap<String, String> map=new HashMap<String,String>();
		
		String movieCode2 = Integer.toString(movieCode);
		String theaterCode2 = Integer.toString(theaterCode);
		
		
		map.put("movieCode", movieCode2); 
		map.put("theaterCode", theaterCode2);
		map.put("showingDay", showingDay);
		 
		return session.selectList("screensc.selectScreenList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Screen> getScreenlist() {
		// TODO Auto-generated method stub
		return session.selectList("screensc.getScreenlist");
	}
	@SuppressWarnings("unchecked")
	public List<Screen> selectScreenCode3( Integer screenTime) {
		HashMap<String, String> map=new HashMap<String,String>();
		
		String screenTime1 = Integer.toString(screenTime);

		map.put("screenTime", screenTime1);
		
		return session.selectList("screensc.selectScreenCode3",map);
	}

}
