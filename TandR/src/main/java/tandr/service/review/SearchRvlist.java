package tandr.service.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.FboardDao;
import tandr.dao.ReviewDao;
import tandr.model.Fboard;
import tandr.model.Review;

public class SearchRvlist implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ReviewDao rd= ReviewDao.getInstance();
		
		String whereRv =request.getParameter("whereRv");
		String rvsearch =request.getParameter("rvsearch");
		String whereMS="";
		
		if(whereRv.equals("id"))
		{
			whereMS="아이디";
		}
		if(whereRv.equals("rvTitle"))
		{
			whereMS="제목";
		}
		if(whereRv.equals("rvContent"))
		{
			whereMS="내용";
		}
		int total = rd.getSearchTotal(rvsearch,whereRv);
		int ROW_PER_PAGE=10;
		int PAGE_PER_BLOK=10;
		String pageNum= request.getParameter("pageNum");
		if(pageNum==null||pageNum.equals(""))
		{
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		//시작번호(페이지번호 -1)*페이지당갯수+1
		int startRow = (currentPage-1)*ROW_PER_PAGE + 1;
		//끝번호 시작번호+ 페이지당개수 -1
		int endRow= startRow+ROW_PER_PAGE-1;
		int number=total-startRow+1;
		
		List<Review> list = rd.selectListsearch(startRow,endRow,rvsearch,whereRv);
		int totalPage=(int)Math.ceil((double)total/ROW_PER_PAGE);//총페이지
		int startPage=currentPage-(currentPage-1)%PAGE_PER_BLOK;//현재페이지-(현재페이지-1)%10
		int endPage=startPage+PAGE_PER_BLOK-1;//시작페이지 + 블록당페이지수-1
		//총페이지보다 큰 end Page는 나올 수 없다
		if(endPage>totalPage)//엔드페이지가 총페이지보다 더 클수는없기 때문에 조건을 넣는다
		{
			endPage=totalPage;
		}
		
		request.setAttribute("number", number);
		request.setAttribute("startPage", startPage);
		request.setAttribute("PAGE_PER_BLOK", PAGE_PER_BLOK);
		request.setAttribute("endPage", endPage);
	
		request.setAttribute("totalPage", totalPage);
		
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("whereMS", whereMS);
		request.setAttribute("whereRv", whereRv);
		request.setAttribute("rvsearch", rvsearch);
		request.setAttribute("list", list);
		request.setAttribute("total", total);
		
		
		
		return "reviewlistSearch";
	}

}
