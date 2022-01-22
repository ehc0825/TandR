package tandr.model;

import java.sql.Date;

public class Review {
	private int rvNum;
    private String rvTitle;
    private String rvContent;
    private String id;
    private int rvStar;
    private String rvPhoto;
    private String rsCode;
    private int rvlike;
    private Date rvDate;
    private String rvDel;
    private int movieCode;
    private int rvReadCount;
    private String movieTitle;
    
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public int getRvNum() {
		return rvNum;
	}
	public void setRvNum(int rvNum) {
		this.rvNum = rvNum;
	}
	public String getRvTitle() {
		return rvTitle;
	}
	public void setRvTitle(String rvTitle) {
		this.rvTitle = rvTitle;
	}
	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRvStar() {
		return rvStar;
	}
	public void setRvStar(int rvStar) {
		this.rvStar = rvStar;
	}
	public String getRvPhoto() {
		return rvPhoto;
	}
	public void setRvPhoto(String rvPhoto) {
		this.rvPhoto = rvPhoto;
	}
	public String getRsCode() {
		return rsCode;
	}
	public void setRsCode(String rsCode) {
		this.rsCode = rsCode;
	}
	public int getRvlike() {
		return rvlike;
	}
	public void setRvlike(int rvlike) {
		this.rvlike = rvlike;
	}
	public Date getRvDate() {
		return rvDate;
	}
	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}
	public String getRvDel() {
		return rvDel;
	}
	public void setRvDel(String rvDel) {
		this.rvDel = rvDel;
	}
	public int getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}
	public int getRvReadCount() {
		return rvReadCount;
	}
	public void setRvReadCount(int rvReadCount) {
		this.rvReadCount = rvReadCount;
	}
    
}
