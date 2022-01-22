package tandr.service.fboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.FboardDao;
import tandr.dao.ReviewDao;
import tandr.service.fboard.CommandProcess;

public class SuspendFboard implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int fbNum = Integer.parseInt(request.getParameter("fbNum"));

		FboardDao fd = FboardDao.getInstance();
		int result = fd.suspend(fbNum);

		request.setAttribute("result", result);
		request.setAttribute("fbNum", fbNum);

		return "suspendFbResult";
	}

}
