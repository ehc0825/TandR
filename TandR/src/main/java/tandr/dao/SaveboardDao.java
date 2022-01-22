package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.Saveboard;
import tandr.model.SearchCount;



public class SaveboardDao {
	private static SaveboardDao instance = new SaveboardDao();
	private SaveboardDao() {}
	public static SaveboardDao getInstance() {
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
	public Saveboard select(String id) {
		
		return (Saveboard)session.selectOne("saveboardsb.select",id);
	}
	public void delete(String id) {
		session.delete("saveboardsb.delete",id);
		
	}
	public int save(Saveboard saveboard) {
		return (int) session.insert("saveboardsb.insert", saveboard);
	}

	

}