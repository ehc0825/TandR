package tandr.service.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MovieDao;
import tandr.dao.ReviewDao;
import tandr.model.Review;

public class RvDelete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		
		ReviewDao rd = ReviewDao.getInstance();
		Review review=rd.select(rvNum);
		int star=review.getRvStar();
		int movieCode=review.getMovieCode();
		MovieDao mvd=MovieDao.getInstance();
		int nowstar=mvd.getStar(movieCode);			
		int movieCodeCount=rd.getCodeTotal(movieCode);
		
		int insertresult=0;
		if(movieCodeCount==1)
		{
			
			insertresult=mvd.updateMovieStar(3,movieCode);
			System.out.println("없던 무비코드");
		}
		else
		{
			double starupdate=((nowstar*(movieCodeCount))-star)/(movieCodeCount-1);
			int intstarupdate=(int)Math.round(starupdate);
			insertresult=mvd.updateMovieStar(intstarupdate,movieCode);			
			
		}
		
		
		
		
		int result = rd.delete(rvNum);
		
		request.setAttribute("result", result);
		request.setAttribute("rvNum", rvNum);
		
		
		return "rvdelete";
	}

}
