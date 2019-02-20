package QABbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import db.DB_Close;
import db.DB_Connection;



public class QABbsDao implements iQABbsDao {
	
	// interface 및 singleton 사용
	private static QABbsDao qab = new QABbsDao();
	
	private QABbsDao() {
		DB_Connection.initConnect();
	}
	
	public static QABbsDao getInstance() {
		return qab;
	}

	@Override
	public List<QABbsDto> getQABbsSearchList(String searchWord, String choice) {
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, "
				+ " WDATE, READCOUNT, DEL, PBPV, REF, STEP, "
				+ " DEPTH, PARENT "
				+ " FROM QABBS ";
		
		String sqlWord = "";
		
		if(choice.equals("title")) {
			sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%'";
		}else if(choice.equals("writer")) {
			sqlWord = " WHERE ID='" + searchWord.trim() + "'";
		}else if(choice.equals("content")) {
			sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%'";
		}
		sql += sqlWord;
		
		sql += " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
		List<QABbsDto> list = new ArrayList<>();
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 getQABbsList suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getQABbsList suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getQABbsList suc");
			
			while(rs.next()) {				
				QABbsDto dto = new QABbsDto(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getInt(7),
						rs.getInt(8),
						rs.getInt(9),
						rs.getInt(10),
						rs.getInt(11),
						rs.getInt(12)					
						);
				list.add(dto);
			}			
			System.out.println("4/6 getQABbsList suc");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(" getQABbsList fail");
			e.printStackTrace();
		}finally {
			DB_Close.close(conn, psmt, rs);
		}
		
		
		return list;
	}

	@Override
	public boolean writeQAB(QABbsDto Qbs) {
		
		System.out.println(Qbs.toString());
		
		String sql = " INSERT INTO QABBS(SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, DEL, PBPV, REF, STEP, DEPTH, PARENT) " +
				" VALUES(SEQ_QABBS.NEXTVAL, ?, ?, ?, SYSDATE, 0, 0, 0, (SELECT NVL(MAX(REF), 0)+1 FROM QABBS), 0, 0, 0) ";
		

		int count = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			System.out.println("0/6 writeQAB Success");	
			conn = DB_Connection.getConection();
			System.out.println("1/6 writeQAB Success");	
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 writeQAB Success");
			
			psmt.setString(1, Qbs.getId());
			psmt.setString(2, Qbs.getTitle());
			psmt.setString(3, Qbs.getContent());
			System.out.println("2.5/6 writeQAB Success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 writeQAB Success");	
		} catch (Exception e) {
			System.out.println(" writeQAB fail");	
		}finally {
			DB_Close.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}

	@Override
	public QABbsDto getQbs(int seq) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, "
				+ " READCOUNT, DEL, PBPV, REF, STEP, DEPTH, PARENT "
				+ " FROM QABBS WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		QABbsDto dto = null;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 getQbs Success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 getQbs Success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getQbs Success");
			
			if(rs.next()) {
				dto = new QABbsDto(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getString(5),
				rs.getInt(6),
				rs.getInt(7),
				rs.getInt(8),
				rs.getInt(9),
				rs.getInt(10),
				rs.getInt(11),
				rs.getInt(12)
				);
				
			}
			System.out.println("4/6 getQbs Success");
		} catch (SQLException e) {
			System.out.println(" getQbs fail");
			e.printStackTrace();
		}finally {
			DB_Close.close(conn, psmt, rs);
		}
		
		return dto;
	}

	@Override
	public void readcount(int seq) {
		String sql = " UPDATE QABBS SET "
				+ " READCOUNT=READCOUNT+1 "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("2/6 S readcount");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("4/6 S readcount");
			
			psmt.executeUpdate();
			System.out.println("6/6 S readcount");
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			DB_Close.close(conn, psmt, null);
		}
		
	}

	@Override
	public boolean Q_answer(int seq, QABbsDto Qbs) {
		//update
		String sql1 = " UPDATE QABBS "
				+ " SET STEP=STEP+1 "
				+ " WHERE REF=(SELECT REF FROM QABBS WHERE SEQ=?) "
				+ " AND STEP > (SELECT STEP FROM QABBS WHERE SEQ=?) ";
		//insert
		String sql2 = " INSERT INTO QABBS "
				+ "(SEQ, ID, TITLE, CONTENT, WDATE, "
				+ " READCOUNT, DEL, PBPV, REF, STEP, DEPTH, PARENT) "
				+ " VALUES(SEQ_QABBS.NEXTVAL, ?, ?, ?, SYSDATE, 0, 0, "
				+ " 0, (SELECT REF FROM QABBS WHERE SEQ=?),"
				+ " (SELECT STEP FROM QABBS WHERE SEQ=?) + 1 , "
				+ " (SELECT DEPTH FROM QABBS WHERE SEQ=?) + 1, ?) ";
				

		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			conn.setAutoCommit(false);
			System.out.println("1/6 Q_answer Suc");
			
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			System.out.println("2/6 Q_answer Suc");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 Q_answer Suc");
			
			// 초기화
			psmt.clearParameters();
			
			psmt = conn.prepareStatement(sql2);
			psmt.setString(1, Qbs.getId());
			psmt.setString(2, Qbs.getTitle());
			psmt.setString(3, Qbs.getContent());
			psmt.setInt(4, seq);
			psmt.setInt(5, seq);
			psmt.setInt(6, seq);
			psmt.setInt(7, seq);
			System.out.println("4/6 Q_answer Suc");
			
			count = psmt.executeUpdate();
			conn.commit();
			System.out.println("5/6 Q_answer Suc");
			
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			System.out.println("Q_answer fail");
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			DB_Close.close(conn, psmt, null);
			System.out.println("6/6 Q_answer Suc");
		}
		
		
		return count>0?true:false;
	}

	@Override
	public boolean updateQbs(int seq, String title, String content) {
		String sql = " UPDATE QABBS SET "
				+ " TITLE=?, CONTENT=? "
				+ " WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("2/6 S updateQbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, seq);
			
			System.out.println("3/6 S updateQbs");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S updateQbs");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB_Close.close(conn, psmt, null);
			System.out.println("5/6 S updateQbs");
		}
		
		return count>0?true:false;
	}

	@Override
	public boolean deleteQbs(int seq) {
		String sql = " UPDATE QABBS SET "
				+ " DEL=1 "
				+ " WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("2/6 S deleteQbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("3/6 S deleteQbs");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 S deleteQbs");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB_Close.close(conn, psmt, null);
		}
		return count>0?true:false;
	}

}
