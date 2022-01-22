package tandr.service.fboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.FboardDao;

public class FbDelete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		
		FboardDao fb = FboardDao.getInstance();
		int result = fb.delete(fbNum);
		System.out.println("delete sql 실행 끝");
		
		request.setAttribute("result", result);
		request.setAttribute("fbNum", fbNum);
		
		return "fbdelete";
	}

}
