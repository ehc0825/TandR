package tandr.service.fboard;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tandr.dao.SaveboardDao;
import tandr.model.Saveboard;

public class Savefbtemp implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		SaveboardDao sd=SaveboardDao.getInstance();
		HttpSession session = request.getSession();
		String real = request.getSession().getServletContext().getRealPath("images/fboard");
		int maxSize = 1024 * 1024 * 5; 
		try {																			// 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
		String fbTitle = mr.getParameter("fbTitle");
		String id= (String)session.getAttribute("id");
		String fbContent = mr.getParameter("fbContent");
		Saveboard saveboard=new Saveboard();
		saveboard.setFbTitle(fbTitle);
		System.out.println(fbTitle);
		saveboard.setFbContent(fbContent);
		System.out.println(fbContent);
		saveboard.setId(id);
		System.out.println(id);
		sd.delete(id);
		int result=sd.save(saveboard);
		request.setAttribute("result", result);

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}
		
		return "savefbtemp";
	}

}
