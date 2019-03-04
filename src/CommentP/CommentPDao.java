package CommentP;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DB_Close;
import db.DB_Connection;

public class CommentPDao implements iCommentPDao {
	
	// interface 및 singleton 사용
	private static CommentPDao comm = new CommentPDao();
	
	private CommentPDao() {
		
	}
	
	public static CommentPDao getInstance() {
		return comm;
	}
	
	@Override
	public List<CommentPDto> getCommentList() {
		String sql = " SELECT SEQ, ID, CONTENT, BBS_SEQ, WDATE, DEL "
					+ " FROM PICBBS_COMMENT "
					+ " ORDER BY WDATE ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CommentPDto> list = new ArrayList<>();
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 getCommentList Suc");
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			System.out.println("2/6 getCommentList Suc");
			
			while(rs.next()) {
				CommentPDto dto = new CommentPDto(rs.getInt(1), rs.getString(2),
												rs.getString(3), rs.getInt(4),
												rs.getString(5), rs.getInt(6));
				
				list.add(dto);
			}
			System.out.println("3/6 getCommentList Suc");
		} catch (SQLException e) {
			System.out.println("getCommentList Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
		return list;
	}

	@Override
	public boolean addComment(CommentPDto dto) {
		String sql = " INSERT INTO PICBBS_COMMENT "
					+ " VALUES(SEQ_PICBCOMM.NEXTVAL, ?, ?, ?, SYSDATE, 0)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 addComment Suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getBbs_seq());
			System.out.println("2/6 addComment Suc");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addComment Suc");
			
		} catch (SQLException e) {
			System.out.println("addComment Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, null);
		}
		return count>0?true:false;
	}

	@Override
	public boolean deleteComment(int seq) {
		String sql = " UPDATE PICBBS_COMMENT "
					+ " SET DEL=1 "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 deleteComment Suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 deleteComment Suc");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 deleteComment Suc");
			
		} catch (SQLException e) {
			System.out.println("deleteComment Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, null);
		}
		return count>0?true:false;
	}

	@Override
	public boolean updateComment(int seq, String content) {
		String sql = " UPDATE PICBBS_COMMENT "
				+ " SET CONTENT=? "
				+ " WHERE SEQ=? ";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	int count = 0;
	
	try {
		conn = DB_Connection.getConection();
		System.out.println("1/6 updateComment Suc");
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, content);
		psmt.setInt(2, seq);
		System.out.println("2/6 updateComment Suc");
		
		count = psmt.executeUpdate();
		System.out.println("3/6 updateComment Suc");
		
	} catch (SQLException e) {
		System.out.println("updateComment Fail");
		e.printStackTrace();
	} finally {
		DB_Close.close(conn, psmt, null);
	}
	return count>0?true:false;
	}
	
}
