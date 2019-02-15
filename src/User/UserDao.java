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
	public boolean login_User(String id, String pwd) {
		String sql = " SELECT ID, PWD FROM MEMBER "
					+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String rs_id = "";
		String rs_pwd = "";
		boolean TF = false;
		
		try {
			conn = DB_Connection.getConection();
			System.out.println("1/6 login_User Suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			
			rs = psmt.executeQuery();
			System.out.println("2/6 login_User Suc");
			
			while(rs.next()) {
				rs_id = rs.getString(1);
				rs_pwd = rs.getString(2);
				
				if(rs_id.equals(id) && rs_pwd.equals(pwd)) {
					TF = true;
				}else {
					TF = false;
				}
			}
			System.out.println("3/6 login_User Suc");
						
		} catch (SQLException e) {
			System.out.println("login_User Fail");
			e.printStackTrace();
		} finally {
			DB_Close.close(conn, psmt, rs);
		}
		
		return TF;
	}
	
	
}
