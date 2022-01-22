package tandr.service.signin;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MemberDao;
import tandr.model.Member;

public class Memberdel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String del=request.getParameter("del");
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		String mailtext=request.getParameter("mailtext");
		MemberDao md= MemberDao.getInstance();
		int result=md.delete(id,del);
		if(result>0)
		{

			String to_email=email;
			String host= "smtp.gmail.com";
			String user="mastertandr@gmail.com";
			String password="tandrmaster1029";
			System.out.println("mail to:"+email);
			Properties prop=System.getProperties();
			prop.put("mail.smtp.host", host);
			prop.put("mail.smtp.port", 465);
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.ssl.enable", "true");
			prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			prop.put("mail.debug", "true");
		
			javax.mail.Session session=javax.mail.Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				msg.setSubject("안녕하세요. T&R 입니다", "UTF-8");
				// 메일 내용
				msg.setContent("<div style='background:black; color:white; font-size:180%;'><img alt='' src='https://postfiles.pstatic.net/MjAyMTExMTFfMjc4/MDAxNjM2NjAwNjA1OTEw.UlH7ZGPv8I9bRYaU1AnqJjKeR-K2TCsghHNbWr-OeuEg.Pkbo2YcQp_1PEGhWZzsDFQev7rETTtu7Y8ARJ2Nm5sUg.PNG.ehc0825/TR.png'><br>"+id+"님 활동이 <div style='color:yellow; text-decoration:underline;'>" + mailtext +"</div>되었습니다.</div>" ,"text/html;charset=UTF-8");
				
				Transport.send(msg);
				System.out.println("이메일 전송 : " + mailtext);
			} catch (AddressException e) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
			} catch (MessagingException e) { 
					// TODO Auto-generated catch block 
					e.printStackTrace(); 
			}
		}
		
		request.setAttribute("result", result);
		return "memberdel";
	}

}
