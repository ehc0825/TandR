package tandr.service.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.MovieDao;
import tandr.model.Movie;

public class MovieUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		Integer movieCode = Integer.parseInt(request.getParameter("movieCode"));
		Integer movieTag = Integer.parseInt(request.getParameter("movieTag"));
		
		MovieDao md=MovieDao.getInstance();
		int result = 0;
		
		if(movieTag==2) {
			result = md.updateClosed(movieCode);
		}
		if(movieTag==3) {
			result = md.updateNow(movieCode);
		}
		
				
		request.setAttribute("result", result);
		
		
		return "movieUpdate";
	}

}