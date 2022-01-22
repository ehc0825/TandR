package tandr.service.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.FboardDao;
import tandr.dao.MemberDao;
import tandr.dao.MovieDao;
import tandr.dao.ReplyDao;
import tandr.dao.ReviewDao;
import tandr.model.Fboard;
import tandr.model.Member;
import tandr.model.Reply;
import tandr.model.Review;

public class RvView implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		String pageNum = request.getParameter("pageNum");
		
		
		ReviewDao rd = ReviewDao.getInstance();
		rd.readcountUpdate(rvNum);   // 조회수 증가
		
		//리뷰 불러오기
		Review review = rd.select(rvNum);
		// 멤버불러오기
		String id = rd.selectId(rvNum);
		MemberDao md=MemberDao.getInstance();
		Member member=md.select(id);
		// 영화 제목 불러오기
		int movieCode = rd.selectCode(rvNum);
		MovieDao md2 = MovieDao.getInstance();
		String movieTitle = md2.selectTitle(movieCode); 
		
		request.setAttribute("movieCode", movieCode);
		request.setAttribute("movieTitle", movieTitle);
		request.setAttribute("member", member);
		request.setAttribute("review", review);
		request.setAttribute("rvNum", rvNum);
		request.setAttribute("pageNum", pageNum);
		return "rvView";
	}

}
