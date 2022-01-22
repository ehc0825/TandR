package tandr.service.fboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tandr.dao.FboardDao;
import tandr.dao.SaveboardDao;
import tandr.model.Fboard;
import tandr.model.Saveboard;

public class FbWriteForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int fbNum = 0;
		String pageNum = request.getParameter("pageNum");
		String sbNum=request.getParameter("sbNum");
		
		fbNum = Integer.parseInt(request.getParameter("fbNum"));
		
		request.setAttribute("fbNum", fbNum);
		request.setAttribute("pageNum", pageNum);
		HttpSession session = request.getSession();
		String id= (String)session.getAttribute("id");
		SaveboardDao sd=SaveboardDao.getInstance();
		Saveboard saveboard=sd.select(id);
		if(sbNum!=null)
		{
			request.setAttribute("saveboard", saveboard);
			return "fbwriteForm";
		}
		else {
			return "fbwriteForm";
		}
	}

}
