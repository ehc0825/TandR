package tandr.service.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.FboardDao;
import tandr.dao.ReplyDao;

public class ReplyDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int fbNum= Integer.parseInt(request.getParameter("fbNum"));
		int replyNum= Integer.parseInt(request.getParameter("replyNum"));

		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.delete(replyNum);
		
		FboardDao fb = FboardDao.getInstance();
		fb.minusCount(fbNum);
		
		request.setAttribute("result", result);
		request.setAttribute("fbNum", fbNum);
		
		return "replydelete";
	}

}
