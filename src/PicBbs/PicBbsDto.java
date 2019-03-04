package PicBbs;

import java.io.Serializable;

public class PicBbsDto implements Serializable {
	
	private static final long serialVersionUID = -3557282677525874172L;
	
	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	
	private int readcount;
	private int del;
	private int likeit;
	private String file_name;
	
	public PicBbsDto() {
		// TODO Auto-generated constructor stub
	}

	public PicBbsDto(int seq, String id, String title, String content, String wdate, int readcount, int del, int likeit,
			String file_name) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.readcount = readcount;
		this.del = del;
		this.likeit = likeit;
		this.file_name = file_name;
	}

	public PicBbsDto(String id, String title, String content, String file_name) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.file_name = file_name;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getLikeit() {
		return likeit;
	}

	public void setLikeit(int likeit) {
		this.likeit = likeit;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PicBbsDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", readcount=" + readcount + ", del=" + del + ", likeit=" + likeit + ", file_name=" + file_name + "]";
	}
	
	
	
}
