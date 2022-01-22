package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import tandr.model.Event;

public class EventDao {
	private static EventDao instance = new EventDao();
	private EventDao() { }
	public static EventDao getInstance() {
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
	public Event select(int eventNum) {
		
		return (Event) session.selectOne("eventns.selectOne",eventNum);
	}
	public int getTotal() {
		// TODO Auto-generated method stub
		return (int) session.selectOne("eventns.getTotal");
	}
	@SuppressWarnings("unchecked")
	public List<Event> selectList(int startRow, int endRow) {
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return session.selectList("eventns.list",map);
	}
	public int insert(Event event) {

		return session.insert("eventns.insert", event);
	}
	public String selectId(int eventNum) {
		
		return (String) session.selectOne("eventns.selectId", eventNum);
	}
	public int update(Event event) {

		return session.update("eventns.update", event);
	}
	public int close(int eventNum) {
		
		return session.update("eventns.close", eventNum);
	}
	public void readcountUpdate(int eventNum) {

		session.update("eventns.readcount", eventNum);	
	}
}
