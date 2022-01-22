package tandr.service.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tandr.dao.ReplyDao;
import tandr.model.Reply;

public class ReplyUpdate implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		int replyNum = Integer.parseInt(request.getParameter("replyNum"));
		String replyContent = request.getParameter("replyContent");
		
		// reply 세팅
		Reply reply = new Reply();
		reply.setReplyNum(replyNum);;
		reply.setReplyContent(replyContent);
		System.out.println(fbNum);
		System.out.println(replyNum);
		System.out.println(replyContent);
		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.update(reply);
		
		request.setAttribute("fbNum", fbNum);
		request.setAttribute("replyNum", replyNum);
		request.setAttribute("result", result);
		
		return "replyupdate";
	}

}
