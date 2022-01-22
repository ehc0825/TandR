package tandr.service.signin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MemberDao;
import tandr.model.Member;

public class Memberinfochange implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String password=request.getParameter("password2");
		String name=request.getParameter("name");
		String address1=request.getParameter("postcode");
		String address2=request.getParameter("roadAddress");
		String address3=request.getParameter("detailAddress");
		String address=address1+" "+address2+" "+address3;
		String mailaddress=request.getParameter("mailaddress");
		String tel=request.getParameter("tel2");
		Member member=new Member();
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setTel(tel);
		member.setAddress(address);
		member.setMailaddress(mailaddress);
		MemberDao md= MemberDao.getInstance();
		int result=0;//입력실패
		result=md.update(member);
		
		request.setAttribute("result", result);
		return "memberinfochange";
	}

}
