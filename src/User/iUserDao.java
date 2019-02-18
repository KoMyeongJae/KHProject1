package User;

public interface iUserDao {
	
	public boolean add_User(UserDto dto);
	
	public boolean getId_User(String id);
	
	public UserDto login_User(UserDto dto);
	
}
