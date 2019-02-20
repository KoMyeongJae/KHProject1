package FestiCalendar;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class FestiCalendarDao implements iFestiCalendarDao {
	
	// interface 및 singleton 사용
	private static FestiCalendarDao ftc = new FestiCalendarDao();
	
	private FestiCalendarDao() {
		DBConnection.initConnect();
	}
	
	public static FestiCalendarDao getInstance() {
		return ftc;
	}

	@Override
	public List<FestiCalendarDto> getCalendarList(String id, String yyyyMM) {

		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, RDATE " +
				" FROM (SELECT ROW_NUMBER() OVER(PARTITION BY SUBSTR(RDATE, 1, 8) ORDER BY RDATE ASC) RN, " +
					"	SEQ, ID, TITLE, CONTENT, RDATE, WDATE " +
				" FROM FESTIVALCALENDAR " +
				" WHERE ID=? AND SUBSTR(RDATE, 1, 6)=?) " +
				" WHERE RN BETWEEN 1 AND 5 "; 
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println(id + "  " + yyyyMM);
		
		List<FestiCalendarDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getCalendarList suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			psmt.setString(2, yyyyMM.trim());
			System.out.println("2/6 getCalendarList suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getCalendarList suc");
			
			while(rs.next()) {
				FestiCalendarDto dto = new FestiCalendarDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setWdate(rs.getString(5));
				dto.setRdate(rs.getString(6));
				
				list.add(dto);
			}
			System.out.println("4/6 getCalendarList suc");
			
		} catch (SQLException e) {
			System.out.println("getCalendarList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}		
		
		return list;
	}

	@Override
	public boolean addCalendar(FestiCalendarDto cal) {
		
		String sql = " INSERT INTO FESTIVALCALENDAR(SEQ, ID, TITLE, CONTENT, WDATE, RDATE, ZZIM) "
				+ " VALUES(SEQ_FESTICAL.NEXTVAL, ?, ?, ?, SYSDATE, ? , 0) ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addCalendar suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cal.getId());
			psmt.setString(2, cal.getTitle());
			psmt.setString(3, cal.getContent());
			psmt.setString(4, cal.getRdate());
			System.out.println("2/6 addCalendar suc");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addCalendar suc");
			
		} catch (SQLException e) {
			System.out.println("addCalendar fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	}

	@Override
	public FestiCalendarDto get_Festi(int seq) {

		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE ,RDATE, ZZIM "
				   + " FROM FESTIVALCALENDAR "
				   + " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		FestiCalendarDto cal = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getCal Success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getCal Success");
			psmt.setInt(1, seq);			
			System.out.println("3/6 getCal Success");
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				cal = new FestiCalendarDto(	rs.getInt(1), 
											rs.getString(2), 
											rs.getString(3), 
											rs.getString(4), 
											rs.getString(5), 
											rs.getString(6), 
											rs.getInt(7));
				
			}
			System.out.println("4/6 getCal Success");			
			
		} catch (SQLException e) {
			System.out.println("getCal Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
				
		return cal;
	}

	@Override
	public boolean update_Festi(FestiCalendarDto cal) {
		String sql = " UPDATE FESTIVALCALENDAR SET TITLE=? , "
				   + " CONTENT=? , RDATE=? "
				   + " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null; 
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cal.getTitle());
			psmt.setString(2, cal.getContent());
			psmt.setString(3, cal.getRdate());
			psmt.setInt(4, cal.getSeq());
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	}

	@Override
	public List<FestiCalendarDto> getdaylist(String date) {

		String sql = " SELECT * FROM FESTIVALCALENDAR WHERE SUBSTR(RDATE, 1, 8)=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<FestiCalendarDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();

			System.out.println("1/6 get_daylist suc");
			psmt = conn.prepareStatement(sql);
			
			System.out.println("2/6 get_daylist suc");
			psmt.setString(1, date.substring(0, 8).trim());
			
			System.out.println("3/6 get_daylist suc");
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				FestiCalendarDto dto = new FestiCalendarDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setWdate(rs.getString(5));
				dto.setRdate(rs.getString(6));
				dto.setZzim(rs.getInt(7));
				
				list.add(dto);
			}
			System.out.println("4/6 get_daylist suc");
			
		} catch (SQLException e) {
			System.out.println("getCalendarList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}		
		
		return list;
	}
}
