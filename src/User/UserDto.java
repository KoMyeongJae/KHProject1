package User;

import java.io.Serializable;
import java.util.Arrays;

public class UserDto implements Serializable {

	private static final long serialVersionUID = 6914562592858860110L;
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String birth;
	private String phone;
	private String[] address;
	private int auth;
	private int memship;
	private String likeit_info;
	
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}

	public UserDto(String id, String pwd, String name, String email, String birth, String phone, String[] address,
			int auth, int memship, String likeit_info) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.phone = phone;
		this.address = address;
		this.auth = auth;
		this.memship = memship;
		this.likeit_info = likeit_info;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String[] getAddress() {
		return address;
	}

	public void setAddress(String[] address) {
		this.address = address;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int getMemship() {
		return memship;
	}

	public void setMemship(int memship) {
		this.memship = memship;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getLikeit_info() {
		return likeit_info;
	}

	public void setLikeit_info(String likeit_info) {
		this.likeit_info = likeit_info;
	}

	@Override
	public String toString() {
		return "UserDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", birth=" + birth
				+ ", phone=" + phone + ", address=" + Arrays.toString(address) + ", auth=" + auth + ", memship="
				+ memship + ", likeit_info=" + likeit_info + "]";
	}

	
	
}
