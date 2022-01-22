package tandr.model;

public class NowShowing {
	private int nsCode;
	private int movieCode;
	private int theaterCode;
	private int screenCode;
	private String showingDay;
	private String pchk;
	private int screenTime;
	
	public int getNsCode() {
		return nsCode;
	}
	public void setNsCode(int nsCode) {
		this.nsCode = nsCode;
	}
	public int getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}
	public int getTheaterCode() {
		return theaterCode;
	}
	public void setTheaterCode(int theaterCode) {
		this.theaterCode = theaterCode;
	}
	public int getScreenCode() {
		return screenCode;
	}
	public void setScreenCode(int screenCode) {
		this.screenCode = screenCode;
	}
	public String getShowingDay() {
		return showingDay;
	}
	public void setShowingDay(String showingDay) {
		this.showingDay = showingDay;
	}
	public String getPchk() {
		return pchk;
	}
	public void setPchk(String pchk) {
		this.pchk = pchk;
	}
	public int getScreenTime() {
		return screenTime;
	}
	public void setScreenTime(int screenTime) {
		this.screenTime = screenTime;
	}

}
