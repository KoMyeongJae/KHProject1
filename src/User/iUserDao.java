package User;

public interface iUserDao {
	
	public boolean add_User(UserDto dto);
	
	public boolean getId_User(String id);
	
	public boolean login_User(String id, String pwd);
	
}
