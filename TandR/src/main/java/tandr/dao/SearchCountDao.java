package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.SearchCount;



public class SearchCountDao {
	private static SearchCountDao instance = new SearchCountDao();
	private SearchCountDao() {}
	public static SearchCountDao getInstance() {
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
	public SearchCount select(String result) {
		
		return (SearchCount) session.selectOne("searchCountsc.select",result);
	}
	public void insert(String result) {
		session.insert("searchCountsc.insert",result);
	}
	public void update(String result) {
		session.update("searchCountsc.update",result);
		
	}
	public int getTotal() {
		int total=0;
		return (int)session.selectOne("searchCountsc.gettotal",total);
	}
	@SuppressWarnings("unchecked")
	public List<SearchCount> selectList(int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("searchCountsc.selectList",map);
	}
	

}