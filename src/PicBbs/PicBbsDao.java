package PicBbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import QABbs.QABbsDto;
import db.DB_Close;
import db.DB_Connection;
import dto.PagingBean1;
import dto.PagingUtil1;

public class PicBbsDao implements iPicBbsDao {
	
	// interface 및 singleton 사용
	private static PicBbsDao pbs = new PicBbsDao();
	
	private PicBbsDao() {
		
	}
	
	public static PicBbsDao getInstance() {
		return pbs;
	}

	@Override
	public List<PicBbsDto> getPicList() {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, "
				+ " READCOUNT, DEL, LIKEIT, FILE_NAME "
				+ " FROM PIC_BBS "
				+ " ORDER BY SEQ DESC ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PicBbsDto> list = new ArrayList<>();
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 getPicList Suc");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getPicList Suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getPicList Suc");
			
			while(rs.next()) {
				// Data 를 담는 다른 방법
				int i = 1;
				
				PicBbsDto dto = new PicBbsDto(rs.getInt(i++),		// seq,
										rs.getString(i++),	// id,
										rs.getString(i++),	// title,
										rs.getString(i++),	// content,
										rs.getString(i++),	// wdate,
										rs.getInt(i++),		// readcount,
										rs.getInt(i++),		// del,
										rs.getInt(i++),		// likeit
										rs.getString(i++)
										);
				list.add(dto);
			}
			System.out.println("4/6 getPicList Suc");
		} catch (SQLException e) {
			System.out.println("getPicList Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}		
		return list;
	}

	@Override
	public boolean addPic(PicBbsDto dto) {
		String sql = " INSERT INTO PIC_BBS(SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, DEL, LIKEIT, FILE_NAME ) "
				+ " VALUES(SEQ_PICBBS.NEXTVAL, ?, ?, ?, SYSDATE, "
				+ " 0, 0, 0, ? ) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 addPic Suc");
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getFile_name());
			System.out.println("2/6 addPic Suc");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addPic Suc");
			
		} catch (SQLException e) {
			System.out.println("addPic Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}

	@Override
	public PicBbsDto detailPic(int seq) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, "
				+ " READCOUNT, DEL, LIKEIT, FILE_NAME "
				+ " FROM PIC_BBS "
				+ " WHERE SEQ=? ";
		
		sql += " ORDER BY SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		PicBbsDto dto = null;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 detailPic Suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			System.out.println("2/6 detailPic Suc");
			
			while(rs.next()) {
				int i = 1;
				dto = new PicBbsDto(rs.getInt(i++), rs.getString(i++), 
								rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), 
								rs.getInt(i++), rs.getInt(i++), rs.getString(i++));
			}
			System.out.println("3/6 detailPic Suc");
			
		} catch (SQLException e) {
			System.out.println("detailPic Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
		return dto;
	}

	@Override
	public boolean updatePic(PicBbsDto dto, int seq) {
		String sql1 = " UPDATE PIC_BBS "
				+ " SET TITLE=?, CONTENT=? "
				+ " WHERE SEQ=? ";
		
		String sql2 = " UPDATE PIC_BBS "
					+ " SET TITLE=?, CONTENT=?, FILE_NAME=? "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			
			if(dto.getFile_name() == null ||dto.getFile_name().equals("")) {
				psmt = conn.prepareStatement(sql1);
				System.out.println("1/6 updatePic1 Suc");
				System.out.println("Title: " + dto.getTitle() + ", Content : " + dto.getContent());
				System.out.println(", File_name : " + dto.getFile_name() + ", Seq : " + dto.getSeq());
				psmt.setString(1, dto.getTitle());
				psmt.setString(2, dto.getContent());
				psmt.setInt(3, seq);
				System.out.println("2/6 updatePic1 Suc");
				
				count = psmt.executeUpdate();
				System.out.println("3/6 updatePic1 Suc");
			}else {
				psmt = conn.prepareStatement(sql2);
				System.out.println("1/6 updatePic2 Suc");
				System.out.println("Title: " + dto.getTitle() + ", Content : " + dto.getContent());
				System.out.println(", File_name : " + dto.getFile_name() + ", Seq : " + dto.getSeq());
				psmt.setString(1, dto.getTitle());
				psmt.setString(2, dto.getContent());
				psmt.setString(3, dto.getFile_name());
				psmt.setInt(4, seq);
				System.out.println("2/6 updatePic2 Suc");
				
				count = psmt.executeUpdate();
				System.out.println("3/6 updatePic2 Suc");
			}
			
			
		} catch (SQLException e) {
			System.out.println("updatePic Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}

	@Override
	public boolean deletePic(int seq) {
		String sql = " UPDATE PIC_BBS "
					+ " SET DEL=1 "
					+ " WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			psmt = conn.prepareStatement(sql);
			System.out.println("1/6 deletePic Suc");
			
			psmt.setInt(1, seq);
			System.out.println("2/6 deletePic Suc");
			count = psmt.executeUpdate();
			System.out.println("3/6 deletePic Suc");
		} catch (SQLException e) {
			System.out.println("deletePic Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}

	@Override
	public void readcount(int seq) {
		String sql = " UPDATE PIC_BBS "
				+ " SET READCOUNT=READCOUNT+1 "
				+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DB_Connection.getConection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, seq);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("readcount Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, null);
		}
	}

	@Override
	public List<PicBbsDto> getPicPagingList(PagingBean1 paging, String searchWord, String choice) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PicBbsDto> Piclist = new ArrayList<>();
		
// 검색어
		String sWord = "";
		String sWord1= "";
		if(choice.equals("title")) {	// 제목
			sWord = " AND TITLE LIKE '%" + searchWord.trim() + "%'";
			sWord1 = " WHERE TITLE LIKE '%" + searchWord.trim() + "%'";
		}else if(choice.equals("writer")) {	// 작성자
			sWord = " AND ID='" + searchWord.trim() + "' ";
			sWord1 = " WHERE ID='" + searchWord.trim() + "' ";
			
		} 
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 getBbsPagingList Success");
			
			String totalSql = " SELECT COUNT(SEQ) "
							+ "	FROM PIC_BBS "
							+ " WHERE DEL=0 "
							+ sWord;
			
			psmt = conn.prepareStatement(totalSql);
			rs = psmt.executeQuery();
			
			int totalCount = 0;
			rs.next();
			totalCount = rs.getInt(1);		// row의 총갯수
			paging.setTotalCount(totalCount);
			paging = PagingUtil1.setPagingInfo(paging);
			
			psmt.close();
			rs.close();
			
			String sql = " SELECT * FROM "
					+ " (SELECT * FROM "
					+ "		(SELECT * FROM PIC_BBS "
					+ "		" + sWord1	
					+ "		ORDER BY SEQ DESC) "		
					+ " WHERE ROWNUM <=" + paging.getStartNum() + ""	// 시작번호
					+ " ORDER BY SEQ DESC) "	
					+ " WHERE ROWNUM <=" + paging.getCountPerPage();	// 9개까지
					
			psmt = conn.prepareStatement(sql);			
			System.out.println("2/6 getBbsPagingList Success");		
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsPagingList Success");
			
			while(rs.next()) {
				PicBbsDto dto = new PicBbsDto(rs.getInt(1), 
										rs.getString(2), 
										rs.getString(3), 
										rs.getString(4), 
										rs.getString(5), 
										rs.getInt(6), 
										rs.getInt(7), 
										rs.getInt(8),
										rs.getString(9));
				Piclist.add(dto);				
				System.out.println("test" + dto.toString());
			}
			System.out.println("4/6 getBbsPagingList Success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
				
		return Piclist;
	}
}
