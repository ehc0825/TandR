package tandr.service.fboard;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tandr.dao.FboardDao;
import tandr.model.Fboard;

public class FbUpdate implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Fboard fboard = new Fboard();
		
		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("images/fboard");

		int maxSize = 1024 * 1024 * 5; // 최대 사이즈 5mb

		try { // 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String photo = mr.getFilesystemName("photo"); // fboardUpload input 내용 불러오기
			String prePhoto = mr.getParameter("prePhoto");
			String fbTitle = mr.getParameter("fbTitle");
			String id = (String) session.getAttribute("id");
			String fbContent = mr.getParameter("fbContent");
			int fbNum = Integer.parseInt(mr.getParameter("fbNum"));
			
			if(photo == null) {
				photo = prePhoto;
			} 
			fboard.setPhoto(photo);
			fboard.setFbTitle(fbTitle);
			fboard.setFbContent(fbContent);

			fboard.setId(id);
			fboard.setFbNum(fbNum);
			
			/*
			 * 임시저장하게 되면 사용할것 // bdSave 세팅 bdSave.setThumbnail(thumbnail);
			 * bdSave.setTitle(title); bdSave.setContent(content);
			 */

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
			;
		}

		String pageNum = request.getParameter("pageNum");
		FboardDao fd = FboardDao.getInstance();
		
		int result = fd.update(fboard); 
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "fbupdate";
	}

}
