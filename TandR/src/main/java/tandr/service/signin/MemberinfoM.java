package tandr.service.signin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MemberDao;
import tandr.model.Member;

public class MemberinfoM implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		MemberDao md=MemberDao.getInstance();
		Member member=md.select(id);
		request.setAttribute("member", member);
		
		
		return "memberinfoM";
	}

}
