package tandr.service.movie;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import tandr.dao.MovieDao;
import tandr.dao.NowShowingDao;
import tandr.model.Movie;
import tandr.model.NowShowing;
import tandr.model.Theater;

public class MovieWrite implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * try { request.setCharacterEncoding("utf-8"); } catch
		 * (UnsupportedEncodingException e) { e.printStackTrace(); }
		 */
		
				
		MovieDao md = MovieDao.getInstance();		
				
		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("images/poster");
		
		int maxSize = 1024 * 1024 * 5; // 최대 사이즈 5mb
		
		Movie movie = new Movie();
		
		try {																			// 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			String poster = mr.getFilesystemName("poster"); // fboardUpload input 내용 불러오기
			
			movie.setPoster(poster);
			
			int movieCode =md.selectMovieCode();
			System.out.println(movieCode);
			String movieTitle = mr.getParameter("movieTitle");
			int movieTag = Integer.parseInt(mr.getParameter("movieTag"));
			String releaseDate = mr.getParameter("releaseDate");
			String closeDate = mr.getParameter("closeDate");
			System.out.println(releaseDate);
			int moviePrice = Integer.parseInt(mr.getParameter("moviePrice")); 
			String director = mr.getParameter("director");
			String actor = mr.getParameter("actor");
			String movieInfo = mr.getParameter("movieInfo");
			String movieContent = mr.getParameter("movieContent");
			int movieGrade = Integer.parseInt(mr.getParameter("movieGrade"));
			int movieStar = Integer.parseInt(mr.getParameter("movieStar"));
			int runningTime = Integer.parseInt(mr.getParameter("runningTime"));
			String movieGenre = mr.getParameter("movieGenre");
			
			String[] theatercode=mr.getParameterValues("theater");
			String[] screencode1=mr.getParameterValues("screen1");
			String[] screencode2=mr.getParameterValues("screen2");
			String[] screencode3=mr.getParameterValues("screen3");
			String[] screencode4=mr.getParameterValues("screen4");
			int[] theatercodei = null;
			if( theatercode != null ){
			theatercodei = new int[ theatercode.length ];
			for( int i=0;i <theatercode.length;i++) {
				System.out.println(theatercode[i]);
					theatercodei[i] = Integer.parseInt( theatercode[i] );
					System.out.println(theatercodei[i]);
			}
			}
			
			int[] screencode1i = null;
			if( screencode1 != null ){
				screencode1i = new int[ screencode1.length ];
				for( int i=0;i <screencode1.length;i++) {
					screencode1i[i] = Integer.parseInt( screencode1[i] );
					System.out.println(screencode1i[i]);
				}
				}
			int[] screencode2i = null;
			if( screencode2 != null ){
				screencode2i = new int[ screencode2.length ];
				for( int i=0;i <screencode2.length;i++) {
					screencode2i[i] = Integer.parseInt( screencode2[i] );
					System.out.println(screencode2i[i]);
				}
				}
			int[] screencode3i = null;
			if( screencode3 != null ){
				screencode3i = new int[ screencode3.length ];
				for( int i=0;i <screencode3.length;i++) {
					screencode3i[i] = Integer.parseInt( screencode3[i] );
					System.out.println(screencode3i[i]);
				}
				}
			int[] screencode4i = null;
			if( screencode4 != null ){
				screencode4i = new int[ screencode4.length ];
				for( int i=0;i <screencode4.length;i++) {
					screencode4i[i] = Integer.parseInt( screencode4[i] );
					System.out.println(screencode4i[i]);
				}
				}
			NowShowingDao nd=NowShowingDao.getInstance();
			
			
			
			Date sqlDate1=Date.valueOf(releaseDate);
			Date sqlDate2=Date.valueOf(closeDate);
			long diffDay = (sqlDate2.getTime() - sqlDate1.getTime()) / (24*60*60*1000);
			System.out.println("diffDay"+diffDay);
			Date sqlDate3=sqlDate1;
			Calendar cal=Calendar.getInstance();
			cal.setTime(sqlDate3);
			cal.add(Calendar.DATE,1);
			DateFormat dateFormat=new SimpleDateFormat("YYYY/MM/dd");
			
			
			for(int k=0;k<=diffDay;k++)
			{
				cal.setTime(sqlDate3);
				cal.add(Calendar.DATE,k);
				System.out.println(sqlDate3);
				if(theatercode!=null)
				{
				for(int i=0;i<theatercodei.length;i++)
				{
					if(theatercodei[i]==1&&screencode1i!=null)
					{
					for(int j=0;j<screencode1.length;j++)
					{
					String moviedate = dateFormat.format(cal.getTime());
					NowShowing nowShowing=new NowShowing();
					nowShowing.setMovieCode(movieCode);
					nowShowing.setTheaterCode(1);
					nowShowing.setScreenCode(screencode1i[j]);
					nowShowing.setShowingDay(moviedate);
					int result=nd.insert(nowShowing);
					System.out.println(result);
					}
					}
					else if(theatercodei[i]==2&&screencode2i!=null)
					{
					for(int j=0;j<screencode2.length;j++)
					{
						String moviedate = dateFormat.format(cal.getTime());
					NowShowing nowShowing=new NowShowing();
					nowShowing.setMovieCode(movieCode);
					nowShowing.setTheaterCode(2);
					nowShowing.setScreenCode(screencode2i[j]);
					nowShowing.setShowingDay(moviedate);
					int result=nd.insert(nowShowing);
					System.out.println(result);
					}
					}
					else if(theatercodei[i]==3&&screencode3i!=null)
					{
					for(int j=0;j<screencode3.length;j++)
					{
						String moviedate = dateFormat.format(cal.getTime());
					NowShowing nowShowing=new NowShowing();
					nowShowing.setMovieCode(movieCode);
					nowShowing.setTheaterCode(3);
					nowShowing.setScreenCode(screencode3i[j]);
					nowShowing.setShowingDay(moviedate);
					int result=nd.insert(nowShowing);
					System.out.println(result);
					}
					}
					else if(theatercodei[i]==4&&screencode4i!=null)
					{
					for(int j=0;j<screencode4.length;j++)
					{
						String moviedate = dateFormat.format(cal.getTime());
					NowShowing nowShowing=new NowShowing();
					nowShowing.setMovieCode(movieCode);
					nowShowing.setTheaterCode(4);
					nowShowing.setScreenCode(screencode4i[j]);
					nowShowing.setShowingDay(moviedate);
					int result=nd.insert(nowShowing);
					System.out.println(result);
					}
					}
					
				}
				}
				
			}
			
			System.out.println(sqlDate1);
			System.out.println(sqlDate2);
			movie.setReleaseDate(sqlDate1);
			movie.setcDate(sqlDate2);
			
			
			movie.setMovieCode(movieCode);
			movie.setMovieTitle(movieTitle);
			movie.setMovieTag(movieTag);			
			movie.setMoviePrice(moviePrice);
			
			movie.setDirector(director);
			movie.setActor(actor);
			movie.setMovieInfo(movieInfo);
			movie.setMovieContent(movieContent);
			movie.setMovieGrade(movieGrade);
			movie.setMovieStar(movieStar);
			movie.setRunningTime(runningTime);
			movie.setMovieGenre(movieGenre);
			
			/* 임시저장하게 되면 사용할것
			 * // bdSave 세팅 bdSave.setThumbnail(thumbnail); bdSave.setTitle(title);
			 * bdSave.setContent(content);
			 */
		
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());;
		}						
		
		int result = md.insert(movie); 		
		request.setAttribute("result", result);
		
		return "movieWrite";
	}

}
