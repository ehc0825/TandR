package tandr.service.movie;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tandr.dao.MemberDao;
import tandr.dao.ReservationDao;
import tandr.model.Reservation;

public class Ticketing6 implements CommandProcess  {
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		
		HttpSession session = request.getSession(); 
		//int movieCode = (int)session.getAttribute("movieCode");
		 
		String id= (String)session.getAttribute("id");
		String movieTitle = request.getParameter("movieTitle");
		String theaterLoc = request.getParameter("theaterLoc");
		String theaterName = request.getParameter("theaterName");
		String showingDay = request.getParameter("showingDay");
		int screenTime = Integer.parseInt(request.getParameter("screenTime"));
		int screenNum = Integer.parseInt(request.getParameter("screenNum"));
		int nsCode = Integer.parseInt(request.getParameter("nsCode"));
		int movieCode = Integer.parseInt(request.getParameter("movieCode"));
		int age = Integer.parseInt(request.getParameter("age"));
		int moviePrice = Integer.parseInt(request.getParameter("moviePrice"));
		int people = Integer.parseInt(request.getParameter("people"));
		
		String rsCheck = request.getParameter("rsCheck");
		
		
		
			
		String[] seats = request.getParameterValues("seat");
		
		double age2 = 0.0;
		if(age==1) {age2=0.5;}
		else if (age==2) {age2=0.7;}
		else {age2=1;}
		
		double finalPrice = 0;
		
		MemberDao md = MemberDao.getInstance();
		int score = md.selectScore(id);
		System.out.println(score);
		
		double discount = 0.0;
		if(0<=score && score<=20) {discount = 0.95;}
		else if(21<=score && score<=40) {discount = 0.9;}
		else if(41<=score && score<=60) {discount = 0.85;}
		else if(61<=score && score<=80) {discount = 0.8;}
		else {discount = 0.75;}
		
		
		finalPrice = (people*moviePrice)*discount*age2;
		
		
		
		ReservationDao rd = ReservationDao.getInstance();
		int ticketCode = rd.selectCode1();
		
		
		
		if(rsCheck.equals("무통장입금: 농협 1111-111-111")) {
			if (seats == null) return "ticketing7";
			else {
				for(int i=0; i<seats.length;i++) {
					Reservation reservation = new Reservation();
					reservation.setId(id);
					reservation.setNsCode(nsCode);
					reservation.setMovieCode(movieCode);
					reservation.setFinalPrice((int)finalPrice);
					reservation.setSeats(seats[i]);
					reservation.setTicketCode(ticketCode);
					int result = rd.insertm(reservation);
					System.out.println(result);					
					md.plusScore(id);
					request.setAttribute("finalPrice", (int)finalPrice);
					
					
				}		
			}
		}
		else {
			if (seats == null) return "ticketing7";
			else {
				for(int i=0; i<seats.length;i++) {
					if(score>=seats.length*20) {
						Reservation reservation = new Reservation();
						reservation.setId(id);
						reservation.setNsCode(nsCode);
						reservation.setMovieCode(movieCode);
						reservation.setFinalPrice(0);
						reservation.setSeats(seats[i]);
						reservation.setTicketCode(ticketCode);											
						int result = rd.insertp(reservation);
						System.out.println(result);
						md.reduceScore(id);
						finalPrice = 0;
						request.setAttribute("finalPrice", (int)finalPrice);
					}
					else {						
						return "ticketing7";
					}
				}		
			}
		}
		
		
		
		
		request.setAttribute("ticketCode", ticketCode);
		request.setAttribute("people", people);
		request.setAttribute("age", age);
		request.setAttribute("id", id);		
		request.setAttribute("movieTitle", movieTitle);
		request.setAttribute("theaterLoc", theaterLoc);
		request.setAttribute("theaterName", theaterName);
		request.setAttribute("showingDay", showingDay);
		request.setAttribute("screenTime", screenTime);
		request.setAttribute("screenNum", screenNum);
		request.setAttribute("nsCode", nsCode);
		
		
		
		
		
		return "ticketing6";
	}


}
