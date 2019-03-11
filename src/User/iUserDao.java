package User;

import java.util.List;

public interface iUserDao {
	
	// 유저 가입
	public boolean add_User(UserDto dto);
	
	// 유저 ID 조회
	public boolean getId_User(String id);
	
	// 유저 로그인
	public UserDto login_User(UserDto dto);
	
	// 유저 정보 보기
	public UserDto detail_User(String id);
	
	// 유저 정보 수정
	public boolean update_User(String name, String birth, String email, String phone, String address, String id);
	
	// 유저 비밀번호 수정
	public boolean update_pwd_User(String pwd, String id);
	
	// 유저 탈퇴
	public void delete_User(String id);
	
	// id 체크
	public String check_id(String name, String phone, String email);
	   
	// pw 체크
	public String check_pw(String id, String name, String email);
	
	public List<RequestDto> getRequestList();
	
    public boolean addRequset(RequestDto rqd);
	
}
