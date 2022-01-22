package tandr.service.review;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tandr.dao.ReviewDao;
import tandr.model.Review;

public class RvUpdate implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Review review = new Review();
		String real = request.getSession().getServletContext().getRealPath("images/review");
		
		int maxSize = 1024 * 1024 * 5; // 최대 사이즈 5mb
		
		try {																			// 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String rvPhoto = mr.getFilesystemName("rvPhoto"); // fboardUpload input 내용 불러오기
			String prePhoto = mr.getParameter("prePhoto");
			String rvTitle = mr.getParameter("rvTitle");
			String rvContent = mr.getParameter("rvContent");
			int rvNum = Integer.parseInt(mr.getParameter("rvNum"));
			/* int movieCode = Integer.parseInt(mr.getParameter("movieCode")); */ 
			int rvStar = Integer.parseInt(mr.getParameter("rvStar"));
			
			if(rvPhoto == null) {
				rvPhoto = prePhoto;
			} 
			
			review.setRvStar(rvStar);
			/* review.setMovieCode(movieCode); */
			review.setRvPhoto(rvPhoto);
			review.setRvTitle(rvTitle);
			review.setRvContent(rvContent);
			
			review.setRvNum(rvNum);
			
			request.setAttribute("rvNum", rvNum);
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}
		String pageNum = request.getParameter("pageNum");
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.update(review); 
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "rvupdate";
	}

}
