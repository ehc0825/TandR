package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.Theater;


public class TheaterDao {
	private static TheaterDao instance = new TheaterDao();
	private TheaterDao() {}
	public static TheaterDao getInstance() {
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
	public Theater select(int theaterCode) {
		return (Theater) session.selectOne("theatertr.select",theaterCode);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Theater> selectTheaterList(int movieCode) {
		/*
		 * HashMap<String, Integer> map=new HashMap<String,Integer>();
		 * map.put("movieCode", movieCode);
		 */			
		return session.selectList("theatertr.selectTheaterList",movieCode);
	}
	@SuppressWarnings("unchecked")
	public List<Theater> getTheaterlist() {
		// TODO Auto-generated method stub
		return session.selectList("theatertr.getTheaterlist");
	}
	
}