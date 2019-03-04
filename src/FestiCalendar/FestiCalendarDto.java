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

	@Override
	public String toString() {
		return "FestiCalendarDto [seq=" + seq + ", cntry_code=" + cntry_code + ", title=" + title + ", content="
				+ content + ", srdate=" + srdate + ", erdate=" + erdate + ", zzim=" + zzim + "]";
	}
	
	
}
