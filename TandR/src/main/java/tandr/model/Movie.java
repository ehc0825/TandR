package tandr.model;

import java.sql.Date;

public class Movie {
	private int movieCode;
	private String movieTitle;
	private int movieTag;
	private Date releaseDate;
	private Date cDate;
	private String director;
	private String actor;
	private String movieInfo;
	private String movieContent;
	private int movieGrade;
	private String poster;
	private int movieStar;
	private int runningTime;
	private int moviePrice;
	private String movieDel;
	private String movieGenre;
	
	public int getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getMovieInfo() {
		return movieInfo;
	}
	public void setMovieInfo(String movieInfo) {
		this.movieInfo = movieInfo;
	}
	public String getMovieContent() {
		return movieContent;
	}
	public void setMovieContent(String movieContent) {
		this.movieContent = movieContent;
	}
	public int getMovieGrade() {
		return movieGrade;
	}
	public void setMovieGrade(int movieGrade) {
		this.movieGrade = movieGrade;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getMovieStar() {
		return movieStar;
	}
	public void setMovieStar(int movieStar) {
		this.movieStar = movieStar;
	}
	public int getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(int runningTime) {
		this.runningTime = runningTime;
	}
	public int getMoviePrice() {
		return moviePrice;
	}
	public void setMoviePrice(int moviePrice) {
		this.moviePrice = moviePrice;
	}
	public String getMovieDel() {
		return movieDel;
	}
	public void setMovieDel(String movieDel) {
		this.movieDel = movieDel;
	}
	public String getMovieGenre() {
		return movieGenre;
	}
	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}
	public int getMovieTag() {
		return movieTag;
	}
	public void setMovieTag(int movieTag) {
		this.movieTag = movieTag;
	}
	
}