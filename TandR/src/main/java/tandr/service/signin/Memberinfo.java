package tandr.service.signin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tandr.dao.MemberDao;
import tandr.model.Member;

public class Memberinfo implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		
		
		String id=(String)session.getAttribute("id");
		
		MemberDao md=MemberDao.getInstance();
		Member member=md.select(id);
		request.setAttribute("member", member);
		return "memberinfo";
	}

}
