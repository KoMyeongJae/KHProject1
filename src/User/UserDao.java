package User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DB_Close;
import db.DB_Connection;

public class UserDao implements iUserDao {
	
	// interface 및 singleton 사용
	private static UserDao us = new UserDao();
	
	private UserDao() {
		DB_Connection.initConnect();
	}
	
	public static UserDao getInstance() {
		return us;
	}

	@Override
	public boolean add_User(UserDto dto) {
		String sql = " INSERT INTO MEMBER "
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 add_User Suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getBirth());
			String array[] = dto.getAddress();
			String address = "";
			for (int i = 0; i < array.length; i++) {
				address += array[i].toString()+",";
			}
			psmt.setString(5, address);
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getPhone());
			psmt.setInt(8, dto.getAuth());
			psmt.setInt(9, dto.getMemship());
			psmt.setString(10, "0000");
			System.out.println("2/6 add_User Suc");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 add_User Suc");
			
		} catch (SQLException e) {
			System.out.println("add_User Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, null);
		}
		System.out.println("4/6 add_User Suc");
		return count>0?true:false;
	}
	

	@Override
	public boolean getId_User(String id) {
		String sql = " SELECT ID FROM MEMBER "
					+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean TF = false;
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 getId_User Suc");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/6 getId_User Suc");
			rs = psmt.executeQuery();
			
			TF = rs.next();
			// true : ID 존재, false : ID 없음
			System.out.println("3/6 getId_User Suc");
			
		} catch (SQLException e) {
			System.out.println("getId_User Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
		System.out.println("4/6 getId_User Suc");
		return TF;
	}

	@Override
	public UserDto login_User(UserDto dto) {
		String sql = " SELECT ID, PWD, NAME, BIRTH, ADDRESS, EMAIL, PHONE, "
					+ " AUTH, MEMSHIP, LIKEIT_INFO FROM MEMBER "
					+ " WHERE ID = ? AND PWD = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		UserDto user = null;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 login_User Suc");
			System.out.println(dto.getId() + "  " + dto.getPwd());
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			
			rs = psmt.executeQuery();
			System.out.println("2/6 login_User Suc");
			
			if(rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(3);
				String birth = rs.getString(4);
				
				String addr = rs.getString(5);
				String address[] = addr.split(",");
				
				String email = rs.getString(6);
				String phone = rs.getString(7);
				int auth = rs.getInt(8);
				int memship = rs.getInt(9);
				
				String likeit_info = rs.getString(10);
				
				user = new UserDto(id, null, name, email, birth, phone, address, auth, memship, likeit_info);
			}
			
			System.out.println("3/6 login_User Suc");
						
		} catch (SQLException e) {
			System.out.println("login_User Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
		
		return user;
	}
	
	
}
