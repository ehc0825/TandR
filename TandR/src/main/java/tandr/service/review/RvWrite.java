package tandr.service.review;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tandr.dao.FboardDao;
import tandr.dao.MemberDao;
import tandr.dao.MovieDao;
import tandr.dao.ReservationDao;
import tandr.dao.ReviewDao;
import tandr.model.Fboard;
import tandr.model.Reservation;
import tandr.model.Review;

public class RvWrite implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Review review = new Review();
		
		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("images/review");
		
		int maxSize = 1024 * 1024 * 5; // 최대 사이즈 5mb
		
		try {																			// 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String rvPhoto = mr.getFilesystemName("rvPhoto"); // fboardUpload input 내용 불러오기
		
			String rvTitle = mr.getParameter("rvTitle");
			String id= (String)session.getAttribute("id");
			String rvContent = mr.getParameter("rvContent");
			String rsCode = mr.getParameter("rsCode");
			int movieCode = Integer.parseInt(mr.getParameter("movieCode")); 
			int rvStar = Integer.parseInt(mr.getParameter("rvStar"));
			String movieTitle = mr.getParameter("movieTitle");
			
			review.setRvStar(rvStar);
			review.setMovieCode(movieCode);
			review.setRsCode(rsCode);
			review.setRvPhoto(rvPhoto);
			review.setRvTitle(rvTitle);
			review.setRvContent(rvContent);
			review.setMovieTitle(movieTitle);
			review.setId(id);
			
			MemberDao md = MemberDao.getInstance();
			md.rvScoreAdd(id);
			ReservationDao rd = ReservationDao.getInstance();
			ReviewDao rvd = ReviewDao.getInstance();
			rd.updateRvCheck(rsCode);			
			MovieDao mvd=MovieDao.getInstance();
			int nowstar=mvd.getStar(movieCode);			
			int movieCodeCount=rvd.getCodeTotal(movieCode);
			
			int insertresult=0;
			if(movieCodeCount==0)
			{
				
				insertresult=mvd.updateMovieStar(rvStar,movieCode);
				System.out.println("없던 무비코드");
			}
			else
			{
				double starupdate=((nowstar*(movieCodeCount))+rvStar)/(movieCodeCount+1);
				int intstarupdate=(int)Math.round(starupdate);
				insertresult=mvd.updateMovieStar(intstarupdate,movieCode);			
				
			}
			
			
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}
		
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.insert(review); 
		
		
		request.setAttribute("result", result);
		return "rvwrite";
	}

}
