package tandr.service.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tandr.dao.FboardDao;
import tandr.dao.ReplyDao;
import tandr.model.Reply;

public class ReplyWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		String replyContent = request.getParameter("replyContent");
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		int replyNum = Integer.parseInt(request.getParameter("replyNum"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		System.out.println("ref : "+ref);
		Reply reply = new Reply();
		reply.setReplyContent(replyContent);
		reply.setId(id);
		reply.setFbNum(fbNum);
		reply.setReplyNum(replyNum);
		reply.setRef(ref);
		
		if (ref != 0) { // 답변글일 때 ref는 답변할 글의 replyNum

			ReplyDao rd = ReplyDao.getInstance();

			int ref_step = rd.selectStep(ref);

			reply.setRef_level(1);
			reply.setRef_step(ref_step);
			System.out.println("replyContent : "+replyContent);
			System.out.println("id : "+id);
			System.out.println("fbNum : " +fbNum);
			System.out.println("replyNum : "+replyNum);
			System.out.println("ref : "+ref);
			System.out.println("ref_step : "+ref_step);
			
			int resultRe = rd.insertRe(reply);
			FboardDao fb = FboardDao.getInstance();
			fb.plusCount(fbNum);
			System.out.println("resultRe : "+resultRe);
			request.setAttribute("resultRe", resultRe);
			
			request.setAttribute("fbNum", fbNum);
			
		} else if (ref == 0 ) { //답글이 아닐때

			int ref_step = Integer.parseInt(request.getParameter("ref_step"));
			int ref_level = Integer.parseInt(request.getParameter("ref_level"));

			reply.setRef_step(ref_step);
			reply.setRef_level(ref_level);
			
			ReplyDao rd = ReplyDao.getInstance();
			
			System.out.println("replyContent : "+replyContent);
			System.out.println("id : "+id);
			System.out.println("fbNum : " +fbNum);
			System.out.println("replyNum : "+replyNum);
			System.out.println("ref : "+ref);
			System.out.println("ref_step : "+ref_step);
			int result = rd.insert(reply);
			FboardDao fb = FboardDao.getInstance();
			fb.plusCount(fbNum);
			
			request.setAttribute("result", result);
			request.setAttribute("fbNum", fbNum);
		}
		
		
		return "replywrite";
	}

}
