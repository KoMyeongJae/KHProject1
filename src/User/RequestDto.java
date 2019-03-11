package User;

import java.io.Serializable;

public class RequestDto implements Serializable{
	
	   private int seq;
	   private String id;
	   private String name;
	   private String email;
	   private String message;
	   private String wdate;
	   
	   public RequestDto() {
		
	   }

	public RequestDto(int seq, String id, String name, String email, String message, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.email = email;
		this.message = message;
		this.wdate = wdate;
	}

	public RequestDto(String id, String name, String email, String message) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.message = message;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "RequestDto [seq=" + seq + ", id=" + id + ", name=" + name + ", email=" + email + ", message=" + message
				+ ", wdate=" + wdate + "]";
	}
	
	
}
