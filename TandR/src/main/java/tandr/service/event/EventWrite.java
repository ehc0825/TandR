package tandr.service.event;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tandr.dao.EventDao;
import tandr.model.Event;

public class EventWrite implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Event event = new Event();
		
		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("images/event");
		System.out.println(real);
		int maxSize = 1024 * 1024 * 50; // 최대 사이즈 50mb
		
		try {																			// 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String photo = mr.getFilesystemName("photo"); // 사진 input file 내용 불러오기
		
			String eventTitle = mr.getParameter("eventTitle");
			String id= (String)session.getAttribute("id");
			String eventContent = mr.getParameter("eventContent");
			
			event.setPhoto(photo);
			event.setEventTitle(eventTitle);
			event.setEventContent(eventContent);
			
			event.setId(id);
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}
		
		EventDao ed = EventDao.getInstance();
		int result = ed.insert(event); 
		
		request.setAttribute("result", result);
		return "eventwrite";
	}

}
