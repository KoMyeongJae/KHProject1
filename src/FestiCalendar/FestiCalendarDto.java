package FestiCalendar;

import java.io.Serializable;

public class FestiCalendarDto implements Serializable {

	private static final long serialVersionUID = -6058995227872828538L;
	
	private int seq;
	private int cntry_code;
	private String title;
	private int zzim;
	private String content;
	private String srdate;
	private String erdate;
	
	
	public FestiCalendarDto(int seq, int cntry_code, String title, int zzim, String content, String srdate,
			String erdate) {
		super();
		this.seq = seq;
		this.cntry_code = cntry_code;
		this.title = title;
		this.zzim = zzim;
		this.content = content;
		this.srdate = srdate;
		this.erdate = erdate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getCntry_code() {
		return cntry_code;
	}
	public void setCntry_code(int cntry_code) {
		this.cntry_code = cntry_code;
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
	public String getsrdate() {
		return srdate;
	}
	public void setsrdate(String srdate) {
		this.srdate = srdate;
	}
	public String geterdate() {
		return erdate;
	}
	public void seterdate(String erdate) {
		this.erdate = erdate;
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

<<<<<<< HEAD
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
=======
	@Override
	public String toString() {
		return "FestiCalendarDto [seq=" + seq + ", cntry_code=" + cntry_code + ", title=" + title + ", content="
				+ content + ", srdate=" + srdate + ", erdate=" + erdate + ", zzim=" + zzim + "]";
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
	}
	
	
}
