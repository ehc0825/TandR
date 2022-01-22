package tandr.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.Likes;

public class LikesDao {
	private static LikesDao instance = new LikesDao();
	private LikesDao() { }
	public static LikesDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println("좋아요 DB연결 에러 : "+e.getMessage());
		}
	}
	public int insert(Likes likes) {
		
		return session.insert("likesns.insert", likes);
	}
	public String select(Likes likes) {
		
		return (String) session.selectOne("likesns.select",likes);
	}
	
}
