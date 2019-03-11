package FestiCalendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DB_Close;
import db.DB_Connection;

/*
CREATE TABLE FESTIVALCALENDAR(
	    SEQ NUMBER(8) PRIMARY KEY,
	    CNTRY_CODE NUMBER(8) NOT NULL,
	    TITLE VARCHAR2(200) NOT NULL,
	    CONTENT LONG NOT NULL,
	    SWDATE DATE NOT NULL,
	    EWDATE DATE,
	    ZZIM NUMBER(8)
	);
*/
public class FestiCalendarDao implements iFestiCalendarDao {
	
	// interface 및 singleton 사용
	private static FestiCalendarDao ftc = new FestiCalendarDao();
	
	private FestiCalendarDao() {
		
	}
	
	public static FestiCalendarDao getInstance() {
		return ftc;
	}

	@Override
	public List<FestiCalendarDto> getFestList(String yyyymm) {
		String sql = " SELECT SEQ, CNTRY_CODE, TITLE, ZZIM, CONTENT, SRDATE, ERDATE "
				+ " FROM (SELECT ROW_NUMBER() OVER(PARTITION BY SUBSTR(SRDATE, 1, 8) ORDER BY SRDATE ASC) RN, "
			    + " SEQ, CNTRY_CODE, TITLE, ZZIM, CONTENT, SRDATE, ERDATE "
				+ " FROM FESTIVALCALENDAR "
				+ " WHERE SUBSTR(SRDATE, 1, 6)=?) "
				+ " WHERE RN BETWEEN 1 AND 5 ";
		
		System.out.println("yyyymm" + yyyymm);
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<FestiCalendarDto> list = new ArrayList<>();
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 getFestList Suc");
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, yyyymm);
			System.out.println("2/6 getFestList Suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getFestList Suc");
			
			while(rs.next()) {
				FestiCalendarDto dto = new FestiCalendarDto(rs.getInt(1), rs.getInt(2),
															rs.getString(3), rs.getInt(4), rs.getString(5),
															rs.getString(6), rs.getString(7));
				System.out.println("dto" + dto.toString());
				list.add(dto);
			}
			System.out.println("listsize : " + list.size());
			
			System.out.println("4/6 getFestList Suc");
			
		} catch (SQLException e) {
			System.out.println("getFestList Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
		
		return list;
	}
	
	

	@Override
	public List<FestiCalendarDto> getSpecFestList(String swdate) {
		String sql = " SELECT SEQ, CNTRY_CODE, TITLE, ZZIM, CONTENT, SRDATE, ERDATE "
					+ " FROM FESTIVALCALENDAR "
					+ " WHERE SRDATE=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<FestiCalendarDto> list = new ArrayList<>();
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 getSpecFestList Suc");
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, swdate);
			System.out.println("2/6 getSpecFestList Suc");
			rs = psmt.executeQuery();
			System.out.println("3/6 getSpecFestList Suc");
			
			while(rs.next()) {
				FestiCalendarDto dto = new FestiCalendarDto(rs.getInt(1), rs.getInt(2),
															rs.getString(3), rs.getInt(4), rs.getString(5),
															rs.getString(6), rs.getString(7));
				list.add(dto);
			}
			System.out.println("4/6 getSpecFestList Suc");
			
		} catch (SQLException e) {
			System.out.println("getSpecFestList Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
		
		return list;
	}


	
	@Override
	public FestiCalendarDto detailFestList(int seq) {
		String sql = " SELECT SEQ, CNTRY_CODE, TITLE,  ZZIM, CONTENT, SRDATE, ERDATE "
					+ " FROM FESTIVALCALENDAR "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		FestiCalendarDto dto = null;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 detailFestList Suc");
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 detailFestList Suc");
			rs = psmt.executeQuery();
			System.out.println("3/6 detailFestList Suc");
			
			while(rs.next()) {
				dto = new FestiCalendarDto(rs.getInt(1), rs.getInt(2),
											rs.getString(3), rs.getInt(4), rs.getString(5),
											rs.getString(6), rs.getString(7));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
		return dto;
	}

	@Override
	public boolean addZzimlist(int seq, String id) {
		
		String sql1 = " SELECT SEQ, ID, FESTI_SEQ "
					+ " FROM FESTI_ZZIM "
					+ " WHERE ID=? AND FESTI_SEQ=? ";
		
		
		String sql2 = " INSERT INTO FESTI_ZZIM(SEQ, ID, FESTI_SEQ) "
					+ " VALUES(SEQ_FESTI_ZZIM.NEXTVAL, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 zzimlist Suc");
			
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, id);
			psmt.setInt(2, seq);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				count = 0;
				return count>0?true:false;
			}else {
				psmt.clearParameters();
				psmt = conn.prepareStatement(sql2);
				psmt.setString(1, id);
				psmt.setInt(2, seq);
				count = psmt.executeUpdate();
				System.out.println("2/6 zzimlist Suc");
			}
		} catch (SQLException e) {
			System.out.println("zzimlist Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, null);
			System.out.println("5/6 zzimlist Suc");
		}
		System.out.println("6/6 zzimlist Suc");
		return count>0?true:false;
	}

	
	@Override
	public List<FestiCalendarDto> getZzimList(String id) {
		String sql = " SELECT SEQ, CNTRY_CODE, TITLE,  ZZIM, CONTENT, SRDATE, ERDATE "
					+ " FROM FESTIVALCALENDAR "
					+ " WHERE SEQ IN (SELECT FESTI_SEQ FROM FESTI_ZZIM WHERE ID=?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<FestiCalendarDto> list = new ArrayList<>();
		
		try {
			conn = DB_Connection.getConection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/6 getZzimList Suc");
			rs = psmt.executeQuery();
			System.out.println("3/6 getZzimList Suc");
			
			while(rs.next()) {
				FestiCalendarDto dto = new FestiCalendarDto(rs.getInt(1),
															rs.getInt(2),
															rs.getString(3),
															0,
															rs.getString(5),
															rs.getString(6),
															rs.getString(7));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("getZzimList Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
		
		
		return list;
	}

	
	@Override
	public List<FestiCalendarDto> getDayZzim(String id, String srdate) {
		String sql = " SELECT SEQ, CNTRY_CODE, TITLE,  ZZIM, CONTENT, SRDATE, ERDATE "
				+ " FROM FESTIVALCALENDAR "
				+ " WHERE SEQ IN (SELECT FESTI_SEQ FROM FESTI_ZZIM WHERE ID=?) "
				+ " AND SRDATE=? ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	List<FestiCalendarDto> list = new ArrayList<>();
	
	try {
		conn = DB_Connection.getConection();
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, srdate);
		System.out.println("2/6 getDayZzim Suc");
		rs = psmt.executeQuery();
		System.out.println("3/6 getDayZzim Suc");
		
		while(rs.next()) {
			FestiCalendarDto dto = new FestiCalendarDto(rs.getInt(1),
														rs.getInt(2),
														rs.getString(3),
														0,
														rs.getString(5),
														rs.getString(6),
														rs.getString(7));
			list.add(dto);
		}
	} catch (SQLException e) {
		System.out.println("getDayZzim Fail");
		e.printStackTrace();
	} finally {
		DB_Close.close(conn, psmt, rs);
	}
	
	
	return list;
	}


	@Override
	public boolean delZzim(int seq, String id) {
		String sql = " DELETE FROM FESTI_ZZIM "
					+ " WHERE FESTI_SEQ=? AND ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 delZzim Suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setString(2, id);
			
			count = psmt.executeUpdate();
			System.out.println("2/6 delZzim Suc");

		} catch (SQLException e) {
			System.out.println("delZzim Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, null);
			System.out.println("6/6 delZzim Suc");
		}
		
		return count>0?true:false;
	}
	
	
	
	
}
