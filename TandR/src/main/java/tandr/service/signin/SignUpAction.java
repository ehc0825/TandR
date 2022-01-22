package tandr.service.signin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MemberDao;
import tandr.model.Member;

public class SignUpAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String address1=request.getParameter("postcode");
		String address2=request.getParameter("roadAddress");
		String address3=request.getParameter("detailAddress");
		String address=address1+" "+address2+" "+address3;
		String mailaddress1=request.getParameter("mailaddress");
		String mailaddress2=request.getParameter("mailaddress2");
		String mailaddress=mailaddress1+mailaddress2;
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String tel3=request.getParameter("tel3");
		String tel=tel1+"-"+tel2+"-"+tel3;
		
		Member member=new Member();
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setTel(tel);
		member.setAddress(address);
		member.setMailaddress(mailaddress);
		
		MemberDao md= MemberDao.getInstance();
		Member member2=md.select(id);
		int result=0;
		if(member2==null)
		{
			result=md.insert(member);
		}
		else
		{
			result=-1;
		}
		request.setAttribute("result", result);
		
		return "signup";
	}

}
