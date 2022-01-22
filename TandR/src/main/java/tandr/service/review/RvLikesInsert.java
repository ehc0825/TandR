package tandr.service.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tandr.dao.LikesDao;
import tandr.dao.ReviewDao;
import tandr.model.Likes;

public class RvLikesInsert implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int rvNum = Integer.parseInt(request.getParameter("rvNum"));
		String id = (String) session.getAttribute("id");
		if(id==""||id==null)
		{
			return "rvlikesSession";
		}
		else {
		Likes likes = new Likes();
		LikesDao ld = LikesDao.getInstance();
		
		
		likes.setId(id);
		likes.setRvNum(rvNum);
		
		String chk = ld.select(likes);
		if (chk!=null) {
			request.setAttribute("id", id);
			request.setAttribute("rvNum", rvNum);
			return "rvlikesDenied";

		} else {
			int result= ld.insert(likes);
			
			ReviewDao rd = ReviewDao.getInstance();
			rd.updateLike(rvNum);
			request.setAttribute("id", id);
			request.setAttribute("rvNum", rvNum);
			request.setAttribute("result", result);
			
			return "rvlikesResult";
		}
		}
		
	}

}
