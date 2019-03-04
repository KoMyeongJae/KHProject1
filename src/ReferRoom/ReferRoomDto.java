package ReferRoom;

import java.io.Serializable;

public class ReferRoomDto implements Serializable {
	
	private int seq;
	private String id;
	private String title;
	private String content;

	private String wdate;		// 업로드한날
	private int readcount;		// 조회수
	private int downcount;		// 다운횟수

	private int del;
	// 좋아요
	private int likeit;
	private String filename;	// 파일명
	
	public ReferRoomDto(int seq, String title, String content, String filename) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.filename = filename;
	}

	public ReferRoomDto(String id, String title, String content, String filename) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
	}



	public ReferRoomDto(int seq, String id, String title, String content, String wdate, int readcount, int downcount,
			int del, int likeit, String filename) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.readcount = readcount;
		this.downcount = downcount;
		this.del = del;
		this.likeit = likeit;
		this.filename = filename;
	}


	public ReferRoomDto() {
		// TODO Auto-generated constructor stub
	}

	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getLikeit() {
		return likeit;
	}

	public void setLikeit(int likeit) {
		this.likeit = likeit;
	}

	@Override
	public String toString() {
		return "ReferRoomDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", filename="
				+ filename + ", readcount=" + readcount + ", downcount=" + downcount + ", wdate=" + wdate + ", likeit="
				+ likeit + "]";
	}
	
	
	
	
}
