package FestiCalendar;

import java.io.Serializable;

public class FestiCalendarDto implements Serializable {

	private static final long serialVersionUID = -6058995227872828538L;

	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private String rdate;
	private int zzim;
	
	public FestiCalendarDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public FestiCalendarDto(int seq, String id, String title, String content, String wdate, String rdate, int zzim) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.rdate = rdate;
		this.zzim = zzim;
	}

	public FestiCalendarDto(String id, String title, String content, String rdate) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
	}

	
	
	public FestiCalendarDto(int seq, String title, String content, String rdate) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getZzim() {
		return zzim;
	}
	public void setZzim(int zzim) {
		this.zzim = zzim;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "FestiCalendarDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate="
				+ wdate + ", rdate=" + rdate + ", zzim=" + zzim + "]";
	}
	
	
}
