package tandr.service.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MovieDao;
import tandr.model.Movie;

public class MasterMovieInfo implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		Integer movieCode = Integer.parseInt(request.getParameter("movieCode"));
		MovieDao md=MovieDao.getInstance();
		Movie movie=md.select(movieCode);
		
		request.setAttribute("movie", movie);
		
		
		return "masterMovieInfo";
	}

}