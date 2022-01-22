package tandr.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tandr.model.Reservation;


public class ReservationDao {
	private static ReservationDao instance = new ReservationDao();
	private ReservationDao() {}
	public static ReservationDao getInstance() {
		return instance;
	}
	// database connection pool
	private static SqlSession session;
	static {	// 초기화 블록
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println("연결에러 : "+e.getMessage());
		}
	}
	public Reservation select(int rsCode) {
		return (Reservation) session.selectOne("reservationtr.select",rsCode);
	}
	
	public int insert(Reservation reservation) {
		return session.insert("reservationtr.insert", reservation);
	}
	
	public int selectCode1() {
		// TODO Auto-generated method stub
		return (int) session.selectOne("reservationtr.selectCode1");
	}
	public int insertm(Reservation reservation) {
		// TODO Auto-generated method stub
		return session.insert("reservationtr.insertm", reservation);
	}
	
	public int insertp(Reservation reservation) {
		// TODO Auto-generated method stub
		return session.insert("reservationtr.insertp", reservation);
	}
	
	public int rsCheckY(String id) {
		return session.update("reservationtr.rsCheckY",id);
	}
	
	public int getTiketTotal(String id) {
		// TODO Auto-generated method stub
		return (int) session.selectOne("reservationtr.getTiketTotal",id);
	}
	public int getEndTiketTotal(String id) {
		// TODO Auto-generated method stub
		return (int) session.selectOne("reservationtr.getEndTiketTotal",id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Reservation> selectEndTiketList(int startRow2, int endRow2, String id) {
		HashMap<String, String> map=new HashMap<String,String>();
		String startRow = Integer.toString(startRow2);
		String endRow = Integer.toString(endRow2);
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("id", id);
		return session.selectList("reservationtr.selectEndTiketList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Reservation> selectTiketList(int startRow1, int endRow1, String id) {
		HashMap<String, String> map=new HashMap<String,String>();
		String startRow = Integer.toString(startRow1);
		String endRow = Integer.toString(endRow1);
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("id", id);
		return session.selectList("reservationtr.selectTiketList",map);
	}
	public String selectCode(String ticketCode) {
		// TODO Auto-generated method stub
		return (String)session.selectOne("reservationtr.selectCode",ticketCode);
	}
	public Reservation selectTicketinfo(String rsCode) {
		// TODO Auto-generated method stub
		return (Reservation)session.selectOne("reservationtr.selectTicketinfo",rsCode);
	}
	@SuppressWarnings("unchecked")
	public List<Reservation> selectSeatsList(String ticketCode) {
		// TODO Auto-generated method stub
		return session.selectList("reservationtr.selectSeatsList",ticketCode);
	}
	
	@SuppressWarnings("unchecked")
	public List<Reservation> disableSeatsList(int nsCode){
		return session.selectList("reservationtr.disableSeatsList", nsCode);
	}
	public int getTotal() {
		int total=0;
		return (int)session.selectOne("reservationtr.gettotal",total);
	}
	
	@SuppressWarnings("unchecked")
	public List<Reservation> selectList(int startRow, int endRow) {
		
		HashMap<String, Integer> map=new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return session.selectList("reservationtr.selectList",map);
	}
	public int updateRsCheck(int ticketCode) {
		// TODO Auto-generated method stub
		return (int)session.update("reservationtr.updateRsCheck",ticketCode);
	}
	
	public int updateShCheck(int ticketCode) {
		// TODO Auto-generated method stub
		return (int)session.update("reservationtr.updateShCheck",ticketCode);
	}
	public void updateRvCheck(String rsCode) {
		
		session.update("reservationtr.updateRvCheck", rsCode);
	}
	
	public int getSearchTotal(String search,String whereM) {
		HashMap<String, String> map=new HashMap<String,String>();
		map.put("search", search);
		map.put("whereM", whereM);
		return (int)session.selectOne("reservationtr.gettotalsearch",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Reservation> selectListsearch(int startRow, int endRow, String search,String whereM) {
		HashMap<String, String> map=new HashMap<String,String>();
		String startRowS = Integer.toString(startRow);
		String endRowS = Integer.toString(endRow);

		map.put("startRow", startRowS);
		map.put("endRow", endRowS);
		map.put("search", search);
		map.put("whereM", whereM);
		System.out.println(startRowS+" "+endRowS+" "+search+" "+whereM);
		
		return session.selectList("reservationtr.selectSearchList",map);
	}
	public int getCodeTotal(int movieCode) {
		
		return (int)session.selectOne("reservationtr.getCodeTotal",movieCode);
	}
	public void updateShcheck2(int nscode) {
		session.update("reservationtr.updateShcheck2",nscode);
		
	}
	public void updateShcheck4(String showingDay, Integer screenTime) {
		HashMap<String, String> map=new HashMap<String,String>();
		String screenTime1 = Integer.toString(screenTime);


		map.put("showingDay", showingDay);
		map.put("screenTime", screenTime1);

		session.update("reservationtr.updateShcheck4",map);
		
	}
	

}