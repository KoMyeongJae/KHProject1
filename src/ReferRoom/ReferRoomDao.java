package ReferRoom;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class ReferRoomDao implements iReferRoomDao {
	
	// interface 및 singleton 사용
	private static ReferRoomDao refr = new ReferRoomDao();
	
	private ReferRoomDao() {
		DBConnection.initConnect();
	}
	
	public static ReferRoomDao getInstance() {
		return refr;
	}

	@Override
	public List<ReferRoomDto> get_ReferRoomList() {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, DOWNCOUNT, DEL, LIKEIT, FILENAME "
				+ " FROM REFERROOM "
				+ " ORDER BY SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReferRoomDto> list = new ArrayList<ReferRoomDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
					
				int i = 1;
				
				ReferRoomDto rfr = new ReferRoomDto(rs.getInt(i++),		// seq
													rs.getString(i++),	// id
													rs.getString(i++),	// title
													rs.getString(i++),	// content
													rs.getString(i++),	// WDATE
													rs.getInt(i++),		// readcount
													rs.getInt(i++),		// downcount
													rs.getInt(i++),		// del
													rs.getInt(i++),		// LIKEIT
													rs.getString(i++)	// filename
															
				);
				list.add(rfr);
			}			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
		
		return list;
	}

	@Override
	public boolean add_ReferR(ReferRoomDto rfr) {

		String sql = " INSERT INTO REFERROOM(SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, DOWNCOUNT, DEL, LIKEIT, FILENAME) "
				   + " VALUES(SEQ_REFER.NEXTVAL, ?, ?, ?, SYSDATE, 0, 0, 0, 0, ?) ";

		
		int count = 0;

		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, rfr.getId());
			psmt.setString(2, rfr.getTitle());
			psmt.setString(3, rfr.getContent());
			psmt.setString(4, rfr.getFilename());
			
			count = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}

		return count > 0 ? true : false;
	}

	@Override
	public ReferRoomDto detail_ReferR(int seq) {
		
		
		String sql = " SELECT * FROM REFERROOM "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ReferRoomDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				dto = new ReferRoomDto();
				
				dto.setSeq(rs.getInt("SEQ"));
				dto.setId(rs.getString("ID"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setContent(rs.getString("CONTENT"));
				dto.setWdate(rs.getString("WDATE"));
				dto.setReadcount(rs.getInt("READCOUNT"));
				dto.setDowncount(rs.getInt("DOWNCOUNT"));
				dto.setLikeit(rs.getInt("LIKEIT"));
				dto.setFilename(rs.getString("FILENAME"));
				
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
		return dto;	
	}

	@Override
	public void readCount(int seq) {
		
		String sql = " UPDATE REFERROOM SET READCOUNT=READCOUNT+1 WHERE SEQ=? ";

		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			conn = DBConnection.getConnection();

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
	}

	@Override
	public void downCount(int seq) {
		
		String sql = " UPDATE REFERROOM SET DOWNCOUNT=DOWNCOUNT+1 WHERE SEQ=? ";

		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			conn = DBConnection.getConnection();

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);

			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
	}

	@Override
	public void delete_ReferR(int seq) {
		
		String sql = " UPDATE REFERROOM SET DEL=1 "
				   + " WHERE SEQ=?";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
	}

	@Override
	public void update_ReferR(ReferRoomDto rfr) {
		
		String sql = " UPDATE REFERROOM SET TITLE=?, CONTENT=?, FILENAME=? "
				   + " WHERE SEQ=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		System.out.println(rfr.toString());
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, rfr.getTitle());
			psmt.setString(2, rfr.getContent());
			psmt.setString(3, rfr.getFilename());
			psmt.setInt(4, rfr.getSeq());
			
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
	}

	@Override
	public List<ReferRoomDto> searchList(String choice, String search) {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, DOWNCOUNT, DEL, LIKEIT, FILENAME "
				+ " FROM REFERROOM ";

		System.out.println(choice + " " + search);
		// 검색어
		String sqlWord = "";
		if (choice.equals("multi")) {
			sqlWord = " WHERE TITLE LIKE '%" + search.trim() + "%'"
				 + " OR ID LIKE '%" + search.trim() + "%'"
				 + " OR CONTENT LIKE '%" + search.trim() + "%'";
		} else if (choice.equals("title")) {
			sqlWord = " WHERE TITLE LIKE '%" + search.trim() + "%'";
		} else if (choice.equals("writer")) {
			sqlWord = " WHERE ID='" + search.trim() + "'";
		} else if (choice.equals("content")) {
			sqlWord = " WHERE CONTENT LIKE '%" + search.trim() + "%'";
		}
		
		sql += sqlWord;

		sql += " ORDER BY SEQ DESC ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<ReferRoomDto> list = new ArrayList<>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList suc");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList suc");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList suc");

			while (rs.next()) {

				int i = 1;
				
				ReferRoomDto rfr = new ReferRoomDto(rs.getInt(i++),		// seq
													rs.getString(i++),	// id
													rs.getString(i++),	// title
													rs.getString(i++),	// content
													rs.getString(i++),	// WDATE
													rs.getInt(i++),		// readcount
													rs.getInt(i++),		// downcount
													rs.getInt(i++),		// del
													rs.getInt(i++),		// LIKEIT
													rs.getString(i++)	// filename
				);
				list.add(rfr);
			}
			System.out.println("4/6 getBbsList suc");

		} catch (SQLException e) {
			System.out.println("getBbsList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}

		return list;
	}

	@Override
	public void add_likeit(int seq) {
		
				String sql = " UPDATE REFERROOM SET LIKEIT=LIKEIT+1 "
						   + " WHERE SEQ=? ";

				Connection conn = null;
				PreparedStatement psmt = null;
				
				
				try {
					conn = DBConnection.getConnection();
					psmt = conn.prepareStatement(sql);
					
					psmt.setInt(1, seq);
					
					psmt.executeUpdate();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					DBClose.close(conn, psmt, null);
				}		
				
	}

	@Override
	public boolean check_likeit(int seq, String id) {
		
		
		String sql = " SELECT * FROM LIKE_REFER "
				   + " WHERE REFLIKE_SEQ=? AND ID='" + id.trim() + "' ";
		
		System.out.println(seq + id);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		boolean check = false;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 like_check suc");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 like_check suc");
			
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 like_check suc");
			
			if(rs.next()) {
				
				System.out.println(rs.getInt(1));
				System.out.println(rs.getString(2));
					check = true;
			}	
			
			

		} catch (SQLException e) {
			System.out.println("like_check fail");
			e.printStackTrace();

			return false;
		} finally {
			DBClose.close(conn, psmt, rs);
		}

		return check;
	}

	@Override
	public void del_likeit(int seq) {
		
		String sql = " UPDATE REFERROOM SET LIKEIT=LIKEIT-1 "
				   + " WHERE SEQ=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}	
	}

	@Override
	public void add_likeit_table(int seq, String id) {

		
		String sql = " INSERT INTO LIKE_REFER(REFLIKE_SEQ  , ID) "
				   + " VALUES(?, ?) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;


		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 add_likeit_table suc");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 add_likeit_table suc");


			psmt.setInt(1, seq);
			psmt.setString(2, id);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 add_likeit_table suc");

			
		} catch (SQLException e) {
			System.out.println("like_check fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}

	}

	@Override
	public void del_likeit_table(int seq, String id) {
		
		String sql = " DELETE FROM LIKE_REFER "
				   + " WHERE REFLIKE_SEQ=? AND ID=? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;


		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 add_likeit_table suc");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 add_likeit_table suc");


			psmt.setInt(1, seq);
			psmt.setString(2, id);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 add_likeit_table suc");

			
		} catch (SQLException e) {
			System.out.println("like_check fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}

	}

	
	
}
