package tandr.service.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tandr.dao.MovieDao;
import tandr.dao.TheaterDao;
import tandr.dao.NowShowingDao;
import tandr.dao.ScreenDao;
import tandr.dao.ReservationDao;
import tandr.model.Movie;
import tandr.model.Theater;
import tandr.model.NowShowing;
import tandr.model.Screen;
import tandr.model.Reservation;

public class Ticketing5 implements CommandProcess  {
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		
		//HttpSession session = request.getSession(); 
		//int movieCode = (int)session.getAttribute("movieCode");
		 
		String[] arr= {"A","B","C","D","E","F","G"};
		Integer movieCode = Integer.parseInt(request.getParameter("movieCode"));
		int screenNum = Integer.parseInt(request.getParameter("screenNum"));
		
		MovieDao md = MovieDao.getInstance();
		Movie mv = md.select(movieCode);
		
		Integer theaterCode = Integer.parseInt(request.getParameter("theaterCode"));
		
		TheaterDao td = TheaterDao.getInstance();
		Theater tt = td.select(theaterCode);
		List<Theater> list2 = td.selectTheaterList(movieCode);
		
		Integer screenCode = Integer.parseInt(request.getParameter("screenCode"));
		Integer screenTime = Integer.parseInt(request.getParameter("screenTime"));
		ScreenDao sd = ScreenDao.getInstance();
		
		Screen sc2 = sd.select(screenCode);
		//Screen sc = sd.selectScreenNum(movieCode,theaterCode);
		
		//Screen sc3 = sd.selectScreenCode(movieCode, theaterCode, screenTime);		

		
		//Integer nsCode = Integer.parseInt(request.getParameter("nsCode"));
		String showingDay = request.getParameter("showingDay");
		NowShowingDao nd = NowShowingDao.getInstance();		
		NowShowing ns = nd.selectNsCode(movieCode, theaterCode, screenCode, showingDay);
		int nsCode = nd.selectNsCode2(movieCode, theaterCode, screenCode, showingDay);
		 
		
		List<NowShowing> list4 = nd.selectDayList(movieCode, theaterCode);
		
		int rsCode = 0;
		rsCode = Integer.parseInt(request.getParameter("rsCode"));

		int total=md.getTotalNow();
				
		int ROW_PER_PAGE=20;
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
		
		List<Movie> list = md.selectNowList(startRow,endRow);
		
		ReservationDao rd = ReservationDao.getInstance();
		List<Reservation> list6 = rd.disableSeatsList(nsCode);
		 
		
		
				
		int totalPage=(int)Math.ceil((double)total/ROW_PER_PAGE);//총페이지
		int startPage=currentPage-(currentPage-1)%PAGE_PER_BLOK;//현재페이지-(현재페이지-1)%10
		int endPage=startPage+PAGE_PER_BLOK-1;//시작페이지 + 블록당페이지수-1
		//총페이지보다 큰 end Page는 나올 수 없다
		if(endPage>totalPage)//엔드페이지가 총페이지보다 더 클수는없기 때문에 조건을 넣는다
		{
			endPage=totalPage;
		}
		
		request.setAttribute("arr", arr);
		request.setAttribute("movie", mv);
		request.setAttribute("theater", tt);
		request.setAttribute("showingDay", showingDay);
		//request.setAttribute("screen", sc);
		request.setAttribute("screenTime", sc2);
		//request.setAttribute("screenCode", sc3);
		request.setAttribute("nowShowing", ns);
		request.setAttribute("rsCode", rsCode);
		request.setAttribute("number", number);
		request.setAttribute("startPage", startPage);
		request.setAttribute("PAGE_PER_BLOK", PAGE_PER_BLOK);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);		
		request.setAttribute("list4", list4);
		request.setAttribute("total", total);
		request.setAttribute("screenNum", screenNum);
		request.setAttribute("list6", list6);
		
		
		
		return "ticketing5";
	}

}
