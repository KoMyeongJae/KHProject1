package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB_Connection {
	
	// 이건 한번만 하면 되고
	public static void initConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// 이건 계속 불러서 써야되는거야
	public static Connection getConection() throws SQLException {
		// url 은 oracle 에서 설정한 부분을 긁어오는거야
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "hr";
		
		// java.sql 소속으로 실질적으로 DB 와 연결시켜주는 부분이야
		Connection conn = DriverManager.getConnection(url, user, pw);
		
		return conn;
	}
	
}
