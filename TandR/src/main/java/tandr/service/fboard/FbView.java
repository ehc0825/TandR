package tandr.service.fboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.FboardDao;
import tandr.dao.MemberDao;
import tandr.dao.ReplyDao;
import tandr.model.Fboard;
import tandr.model.Member;
import tandr.model.Reply;

public class FbView implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		String pageNum = request.getParameter("pageNum");
		/* String id = request.getParameter("id"); */
		
		FboardDao fd = FboardDao.getInstance();
		fd.readcountUpdate(fbNum);   // 조회수 증가
		Fboard fboard = fd.select(fbNum);
		String id = fd.selectId(fbNum);
		
		ReplyDao rd = ReplyDao.getInstance();
		List<Reply> rpList = rd.rpList(fbNum);
		int replyCount = rpList.size();
		List<Reply> rpList2 = rd.rpList2(fbNum);
		
		MemberDao md=MemberDao.getInstance();
		Member member=md.select(id);
		
		request.setAttribute("replyCount", replyCount);
		request.setAttribute("member", member);
		request.setAttribute("rpList2", rpList2);
		request.setAttribute("fboard", fboard);
		request.setAttribute("fbNum", fbNum);
		request.setAttribute("pageNum", pageNum);
		
		return "fbview";
	}

}
