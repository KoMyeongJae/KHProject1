package PerCalendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DB_Close;
import db.DB_Connection;

public class PerCalendarDao implements iPerCalendarDao {
	
	// interface 및 singleton 사용
	private static PerCalendarDao percal = new PerCalendarDao();
	
	private PerCalendarDao() {
		
	}
	
	public static PerCalendarDao getInstance() {
		return percal;
	}

	@Override
	public List<PerCalendarDto> getPerCaledatList(String id, String yyyyMM) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE ,RSTARTDATE, RENDDATE " +
		         " FROM (SELECT ROW_NUMBER() OVER(PARTITION BY SUBSTR(RSTARTDATE, 1, 8) ORDER BY RSTARTDATE ASC) RN, " +
			     " SEQ, ID, TITLE, CONTENT, WDATE, RSTARTDATE ,RENDDATE " +
		         " FROM PERCALENDAR " +
		         " WHERE ID=? AND (SUBSTR(RSTARTDATE, 1, 6)=? OR SUBSTR(RENDDATE, 1, 6)=? )) " +
		         " WHERE RN BETWEEN 1 AND 5 ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	List<PerCalendarDto> list = new ArrayList<>();
	
	try {
		conn = DB_Connection.getConection();
		System.out.println("1/6 getPerCaledatList suc");
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id.trim());
		psmt.setString(2, yyyyMM.trim());
		psmt.setString(3, yyyyMM.trim());
		System.out.println("2/6 getPerCaledatList suc");
		
		rs = psmt.executeQuery();
		System.out.println("3/6 getPerCaledatList suc");
		
		while(rs.next()) {
			PerCalendarDto dto = new PerCalendarDto();
			dto.setSeq(rs.getInt(1));
			dto.setId(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setContent(rs.getString(4));
			dto.setWdate(rs.getString(5));
			dto.setRstartdate(rs.getString(6));
			dto.setRenddate(rs.getString(7));
			
			list.add(dto);	
		}
		System.out.println("4/6 getPerCaledatList suc");
	} catch (SQLException e) {
		System.out.println("getPerCaledatList fail");
		e.printStackTrace();
	} finally {
		DB_Close.close(conn, psmt, rs);
	}
	
		return list;
	}

	@Override
  public boolean addPerCalendar(PerCalendarDto pcal) {
	 
	 String sql = " INSERT INTO PERCALENDAR(SEQ, ID, TITLE, CONTENT, WDATE, RSTARTDATE , RENDDATE) " +
			      " VALUES(SEQ_PERC.NEXTVAL, ?, ? ,? ,SYSDATE ,? ,? ) ";
	 
	 Connection conn = null;
	 PreparedStatement psmt = null;
		
	 int count = 0;       
	 
	 try {
		conn = DB_Connection.getConection();
		System.out.println("1/6 addPerCalendar suc");
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, pcal.getId());
		psmt.setString(2, pcal.getTitle());
		psmt.setString(3, pcal.getContent());
		psmt.setString(4, pcal.getRstartdate());
		psmt.setString(5, pcal.getRenddate());
		System.out.println("2/6 addPerCalendar suc");
		
		count = psmt.executeUpdate();
		System.out.println("3/6 addPerCalendar suc");
	} catch (SQLException e) {
		System.out.println("addPerCalendar fail");
		e.printStackTrace();
	} DB_Close.close(conn, psmt, null);
	 
		return count>0?true:false;
	}

	@Override
 public List<PerCalendarDto> getDayList(String id, String yyyyMMdd) {
	
	String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, RSTARTDATE, RENDDATE " +
	             " FROM PERCALENDAR " +
			     " WHERE ID=? AND (SUBSTR(RSTARTDATE,1,8)=? OR SUBSTR(RENDDATE,1,8)=? ) " +
	             " ORDER BY RSTARTDATE ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	List<PerCalendarDto> list = new ArrayList<>();
	
	try {
		conn = DB_Connection.getConection();
		System.out.println("1/6 getDayList suc");
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id.trim());
		psmt.setString(2, yyyyMMdd.trim());
		psmt.setString(3, yyyyMMdd.trim());
		System.out.println("2/6 getDayList suc");
		
		rs = psmt.executeQuery();
		System.out.println("3/6 getDayList suc");
		
		while(rs.next()) {
			PerCalendarDto dto = new PerCalendarDto();
			dto.setSeq(rs.getInt(1));
			dto.setId(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setContent(rs.getString(4));
			dto.setWdate(rs.getString(5));
			dto.setRstartdate(rs.getString(6));
			dto.setRenddate(rs.getString(7));
			
			list.add(dto);
		}
		System.out.println("4/6 getDayList suc");
	} catch (SQLException e) {
		System.out.println(" getDayList fail");
		e.printStackTrace();
	} finally {
		DB_Close.close(conn, psmt, rs);
	}	
		return list;
  }

	@Override
  public PerCalendarDto getDay(int seq) {
	
	String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, RSTARTDATE, RENDDATE " +
	             " FROM PERCALENDAR " +
			     " WHERE SEQ=? ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
    ResultSet rs = null;
    
    PerCalendarDto dto = null;
    
    try {
		conn = DB_Connection.getConection();
		System.out.println("1/6 getDay suc");
		
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, seq);
		System.out.println("2/6 getDay suc");
		
		rs = psmt.executeQuery();
		System.out.println("3/6 getDay suc");
		
		while(rs.next()) {
			dto = new PerCalendarDto();
			dto.setSeq(rs.getInt(1));
			dto.setId(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setContent(rs.getString(4));
			dto.setWdate(rs.getString(5));
			dto.setRstartdate(rs.getString(6));
			dto.setRenddate(rs.getString(7));
		}
		System.out.println("4/6 getDay suc");
		
	} catch (SQLException e) {
		System.out.println(" getDay fail");
		e.printStackTrace();
	} finally {
		DB_Close.close(conn, psmt, rs);
	}
		return dto;
	}

	@Override
  public boolean deletePerCalendar(int seq) {
	
	String sql = " DELETE FROM PERCALENDAR " +
	             " WHERE SEQ=? ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int count = 0;
	
	try {
		conn = DB_Connection.getConection();
		System.out.println("1/6 deleteCalendar suc");
		
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, seq);
		System.out.println("2/6 deleteCalendar suc");
		
		count = psmt.executeUpdate();
		System.out.println("3/6 deleteCalendar suc");
	} catch (SQLException e) {
		System.out.println("deleteCalendar fail");
		e.printStackTrace();
	} finally {
		DB_Close.close(conn, psmt, null);
	}
		return count>0?true:false;
	}

	@Override
 public boolean updatePerCalendar(PerCalendarDto pcal) {
    
	String sql = " UPDATE PERCALENDAR SET " +
	             " TITLE=?, CONTENT=?, WDATE=SYSDATE, RSTARTDATE=?, RENDDATE=? " +
			     " WHERE SEQ=? ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int count = 0;
	
	try {
		conn = DB_Connection.getConection();
		System.out.println("1/6 updatePerCalendar suc");
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, pcal.getTitle());
		psmt.setString(2, pcal.getContent());
		psmt.setString(3, pcal.getRstartdate());
		psmt.setString(4, pcal.getRenddate());
		psmt.setInt(5, pcal.getSeq());
		System.out.println("2/6 updatePerCalendar suc");
		
		count = psmt.executeUpdate();
		System.out.println("3/6 updatePerCalendar suc");
		
	} catch (SQLException e) {
		System.out.println(" updatePerCalendar fail");
		e.printStackTrace();
	} finally {
		DB_Close.close(conn, psmt, null);
	}
		return count>0?true:false;
	}
	
  
	
}
