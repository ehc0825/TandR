package tandr.service.main;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.If;

import tandr.dao.FboardDao;
import tandr.dao.MovieDao;
import tandr.dao.ReviewDao;
import tandr.dao.SearchCountDao;
import tandr.model.Fboard;
import tandr.model.Movie;
import tandr.model.Review;
import tandr.model.SearchCount;

public class Result implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String result=request.getParameter("search");
		if(result==null||result=="")
		{
			result="blank13##12";
		}
		ReviewDao rd=ReviewDao.getInstance();
		MovieDao md=MovieDao.getInstance();
		FboardDao fd=FboardDao.getInstance();
		SearchCountDao sd=SearchCountDao.getInstance();
		SearchCount searchCount=sd.select(result);
		

		if(searchCount==null)
		{
			sd.insert(result);
		}
		else
		{
				sd.update(result);
		}
		String resultnum="5";
		String mresultnum="1";
		
		List<Movie> list1=md.searchMovie(result,mresultnum);
		
		List<Review> list2=rd.searchReviw(result,resultnum);
		
		List<Fboard> list3=fd.searchFboard(result,resultnum);
		if(result=="blank13##12")
		{
			result=null;
		}
		if(list1.isEmpty()&&list2.isEmpty()&&list3.isEmpty())
		{
			request.setAttribute("result", result);
			return "result";
		}
		else if(list1.isEmpty())
		{
			if(list2.isEmpty())
			{
				request.setAttribute("result", result);
				request.setAttribute("list3", list3);
				return "result1";
			}
			else if(list3.isEmpty())
			{
				request.setAttribute("result", result);
				request.setAttribute("list2", list2);
				return "result1";
			}
			else {
				request.setAttribute("result", result);
				request.setAttribute("list2", list2);
				request.setAttribute("list3", list3);
				return "result2";
			}
			
		}
		else if(list2.isEmpty())
		{
			if(list3.isEmpty())
			{
				request.setAttribute("result", result);
				request.setAttribute("list1", list1);
				return "resultm";
			}
			else if(list1.isEmpty())
			{
				request.setAttribute("result", result);
				request.setAttribute("list3", list3);
				return "result1";
			}
			else {
				request.setAttribute("result", result);
				request.setAttribute("list1", list1);
				request.setAttribute("list3", list3);
				return "resultm2";
			}	
		}
		else if(list3.isEmpty())
		{
			if(list2.isEmpty())
			{
				request.setAttribute("result", result);
				request.setAttribute("list1", list1);
				return "resultm";
			}
			else if(list1.isEmpty())
			{
				request.setAttribute("result", result);
				request.setAttribute("list2", list2);
				return "result1";
			}
			else {
				request.setAttribute("result", result);
				request.setAttribute("list1", list1);
				request.setAttribute("list2", list2);
				return "resultm2";
			}
		}
		else {
			request.setAttribute("result", result);
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			return "result3";
		}
		
		
	}

}
