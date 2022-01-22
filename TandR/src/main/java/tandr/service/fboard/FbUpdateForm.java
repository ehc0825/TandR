package tandr.service.fboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.FboardDao;
import tandr.model.Fboard;

public class FbUpdateForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));
		String pageNum = request.getParameter("pageNum");
		FboardDao fd = FboardDao.getInstance();
		Fboard fboard = fd.select(fbNum);
		
		
		request.setAttribute("fboard", fboard);
		request.setAttribute("fbNum", fbNum);
		request.setAttribute("pageNum", pageNum);
		return "fbupdateForm";
	}

}
