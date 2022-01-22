package tandr.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.Reply;


public class ReplyDao {
	private static ReplyDao instance = new ReplyDao();
	private ReplyDao() { }
	public static ReplyDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println("댓글 DB연결 에러 : "+e.getMessage());
		}
	}
	public Reply select(String id) {
		return (Reply) session.selectOne("replyns.select",id);
	}

	/* 댓글 카운트 */
	@SuppressWarnings("unchecked")
	public List<Reply> rpList(int fbNum) {

		return session.selectList("replyns.rpList", fbNum);
	}

	/* 삭제된 댓글도 포함된 정보 */
	@SuppressWarnings("unchecked")
	public List<Reply> rpList2(int fbNum) {
		return session.selectList("replyns.rpList2",fbNum);
	}
	
	public int update(Reply reply) {
		
		return session.update("replyns.update", reply);
	}
	public int insert(Reply reply) {
		
		return session.insert("replyns.insert", reply);
	}
	/* ref_step 구하기 */
	public int selectStep(int ref) {
		
		return (int) session.selectOne("replyns.selectStep", ref);
	}
	// 대댓글 입력
	public int insertRe(Reply reply) {
		
		return session.insert("replyns.insertRe", reply);
	}
	public int delete(int replyNum) {
		
		return session.delete("replyns.delete", replyNum);
	}
	
}
