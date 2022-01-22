package tandr.service.event;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tandr.dao.EventDao;
import tandr.dao.FboardDao;
import tandr.model.Event;
import tandr.model.Fboard;

public class EventUpdateForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int eventNum = Integer.parseInt(request.getParameter("eventNum"));
		String pageNum = request.getParameter("pageNum");
		EventDao ed = EventDao.getInstance();
		
		Event event= ed.select(eventNum);
		
		
		request.setAttribute("event", event);
		request.setAttribute("eventNum", eventNum);
		request.setAttribute("pageNum", pageNum);

		return "eventupdateForm";
	}

}
