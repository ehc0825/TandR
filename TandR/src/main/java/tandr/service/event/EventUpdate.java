package tandr.service.event;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tandr.dao.EventDao;
import tandr.model.Event;

public class EventUpdate implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Event event = new Event();
		
		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("images/event");

		int maxSize = 1024 * 1024 * 50; // 최대 사이즈 50mb

		try { // 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());

			String photo = mr.getFilesystemName("photo"); // fboardUpload input 내용 불러오기
			String prePhoto = mr.getParameter("prePhoto");
			String eventTitle = mr.getParameter("eventTitle");
			String id = (String) session.getAttribute("id");
			String eventContent = mr.getParameter("eventContent");
			int eventNum = Integer.parseInt(mr.getParameter("eventNum"));
			
			if(photo == null) {
				photo = prePhoto;
			} 
			event.setPhoto(photo);
			event.setEventTitle(eventTitle);
			event.setEventContent(eventContent);

			event.setId(id);
			event.setEventNum(eventNum);

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
			;
		}

		String pageNum = request.getParameter("pageNum");
		EventDao ed = EventDao.getInstance();
		
		int result = ed.update(event); 
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "eventupdate";
	}

}
