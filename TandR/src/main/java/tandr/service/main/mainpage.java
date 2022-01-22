package tandr.service.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tandr.dao.FboardDao;
import tandr.dao.MovieDao;
import tandr.dao.ReviewDao;
import tandr.model.Fboard;
import tandr.model.Movie;
import tandr.model.Review;

public class mainpage implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		MovieDao md=MovieDao.getInstance();
		ReviewDao rd=ReviewDao.getInstance();
		FboardDao fd=FboardDao.getInstance();
		int top10=10;
		List<Movie> list=md.selectTop10List(top10);
		List<Review> list2=rd.selectmainList();
		List<Fboard> list3=fd.selectmainList();
		
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		return "mainpage";
	}

}
