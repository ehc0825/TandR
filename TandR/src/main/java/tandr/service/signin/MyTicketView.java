package tandr.service.signin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MovieDao;
import tandr.dao.NowShowingDao;
import tandr.dao.ReservationDao;
import tandr.dao.ScreenDao;
import tandr.dao.TheaterDao;
import tandr.model.Movie;
import tandr.model.NowShowing;
import tandr.model.Reservation;
import tandr.model.Screen;
import tandr.model.Theater;

public class MyTicketView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String ticketCode=request.getParameter("ticketCode");
		int nsCode=Integer.parseInt(request.getParameter("nsCode"));
		String movieTitle=request.getParameter("movieTitle");
		ReservationDao rv=ReservationDao.getInstance();
		System.out.println(nsCode);
		
		
		String rsCode=rv.selectCode(ticketCode);
		System.out.println(rsCode);
		Reservation reservation=rv.selectTicketinfo(rsCode);
		List<Reservation> list = rv.selectSeatsList(ticketCode);
		
		NowShowingDao ns=NowShowingDao.getInstance();
		
		NowShowing nowshowing=ns.select(nsCode);
		int screenCode=nowshowing.getScreenCode();
		System.out.println(screenCode);
		int movieCode=nowshowing.getMovieCode();
		int theaterCode=nowshowing.getTheaterCode();
		TheaterDao td=TheaterDao.getInstance();
		Theater theater=td.select(theaterCode);
		
		System.out.println(movieCode);
		MovieDao md=MovieDao.getInstance();
		Movie movie=md.select(movieCode);
		ScreenDao sd=ScreenDao.getInstance();
		Screen screen=sd.select(screenCode);
		request.setAttribute("theater", theater);
		request.setAttribute("movie", movie);
		request.setAttribute("screen", screen);
		request.setAttribute("nowshowing", nowshowing);
		request.setAttribute("list", list);
		request.setAttribute("reservation", reservation);
		request.setAttribute("movieTitle", movieTitle);
		request.setAttribute("ticketCode",ticketCode);
		
		return "myticketView";
	}

}
