package tandr.service.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.EventDao;
import tandr.dao.MemberDao;
import tandr.model.Event;
import tandr.model.Member;

public class EventView implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int eventNum = Integer.parseInt(request.getParameter("eventNum"));
		String pageNum = request.getParameter("pageNum");
		/* String id = request.getParameter("id"); */
		
		EventDao ed = EventDao.getInstance();
		ed.readcountUpdate(eventNum);
		Event event= ed.select(eventNum);
		String id = ed.selectId(eventNum);
		
		MemberDao md=MemberDao.getInstance();
		Member member=md.select(id);
		
		request.setAttribute("event", event);
		request.setAttribute("eventNum", eventNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("member", member);
	
		return "eventView";
	}

}
