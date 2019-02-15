package User;

public class UserDao implements iUserDao {
	
	// interface 및 singleton 사용
	private static UserDao us = new UserDao();
	
	private UserDao() {
		
	}
	
	public static UserDao getInstance() {
		return us;
	}
}
