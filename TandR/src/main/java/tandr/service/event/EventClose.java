package tandr.service.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.EventDao;
import tandr.dao.FboardDao;

public class EventClose implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int eventNum = Integer.parseInt(request.getParameter("eventNum"));
		
		EventDao ed = EventDao.getInstance();
		int result = ed.close(eventNum);
		System.out.println("close sql 실행 끝");
		
		request.setAttribute("result", result);
		request.setAttribute("eventNum", eventNum);
		System.out.println("eventClose.java 종료");
		
		return "eventClose";
	}

}
