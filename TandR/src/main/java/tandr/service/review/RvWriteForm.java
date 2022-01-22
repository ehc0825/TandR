package tandr.service.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MovieDao;
import tandr.model.Movie;

public class RvWriteForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rvNum = 0;
		String pageNum = request.getParameter("pageNum");
		String rsCode = request.getParameter("rsCode");
		int movieCode = Integer.parseInt(request.getParameter("movieCode"));
		MovieDao md = MovieDao.getInstance();
		
		String movieTitle = md.selectTitle(movieCode); 
		
		request.setAttribute("movieTitle", movieTitle);
		request.setAttribute("movieCode", movieCode);
		request.setAttribute("rsCode", rsCode);
		request.setAttribute("rvNum", rvNum);
		request.setAttribute("pageNum", pageNum);
		
		return "rvwriteForm";
	}

}
