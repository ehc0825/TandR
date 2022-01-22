package tandr.service.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MovieDao;
import tandr.dao.ReviewDao;
import tandr.model.Review;

public class RvUpdateForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		String pageNum = request.getParameter("pageNum");
		
		ReviewDao rd = ReviewDao.getInstance();
		Review review = rd.select(rvNum);
		
		request.setAttribute("review", review);
		request.setAttribute("rvNum", rvNum);
		request.setAttribute("pageNum", pageNum);
		
		return "rvupdateForm";
	}

}
