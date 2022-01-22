package tandr.service.fboard;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tandr.dao.FboardDao;
import tandr.dao.SaveboardDao;
import tandr.model.Fboard;
import tandr.model.Saveboard;

public class FbWrite implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * try { request.setCharacterEncoding("utf-8"); } catch
		 * (UnsupportedEncodingException e) { e.printStackTrace(); }
		 */

		HttpSession session = request.getSession();
		Fboard fboard = new Fboard();
		
		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("images/fboard");
		
		int maxSize = 1024 * 1024 * 5; // 최대 사이즈 5mb
		
		try {																			// 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String photo = mr.getFilesystemName("photo"); // fboardUpload input 내용 불러오기
		
			String fbTitle = mr.getParameter("fbTitle");
			String id= (String)session.getAttribute("id");
			String fbContent = mr.getParameter("fbContent");
			
			fboard.setPhoto(photo);
			fboard.setFbTitle(fbTitle);
			fboard.setFbContent(fbContent);
			
			fboard.setId(id);
			/* 임시저장하게 되면 사용할것
			 * // bdSave 세팅 bdSave.setThumbnail(thumbnail); bdSave.setTitle(title);
			 * bdSave.setContent(content);
			 */
			SaveboardDao sd=SaveboardDao.getInstance();
			Saveboard saveboard=sd.select(id);
			if(saveboard!=null)
			{
				sd.delete(id);
			}
		
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}
		
		FboardDao fd = FboardDao.getInstance();
		int result = fd.insert(fboard); 
		
		request.setAttribute("result", result);
		
		return "fbwrite";
	}

}
