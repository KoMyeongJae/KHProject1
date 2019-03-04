package PerCalendar;

import java.io.Serializable;

/*CREATE TABLE PERCALENDAR(
	    SEQ NUMBER(8) PRIMARY KEY,
	    ID VARCHAR2(50) NOT NULL,
	    TITLE VARCHAR2(200) NOT NULL,
	    CONTENT VARCHAR2(4000) NOT NULL,
	    WDATE DATE NOT NULL,
	    RSTARTDATE VARCHAR2(12) NOT NULL,
	    RENDDATE VARCHAR2(12) NOT NULL
	);
	DROP TABLE PERCALENDAR
	CASCADE CONSTRAINTS;

	CREATE SEQUENCE SEQ_PERC
	START WITH 1
	INCREMENT BY 1;
	DROP SEQUENCE SEQ_PERC;


	ALTER TABLE PERCALENDAR
	ADD CONSTRAINT FK_PERCAL_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID);*/


public class PerCalendarDto implements Serializable {

	private static final long serialVersionUID = -2566501401849519879L;
	
	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private String rstartdate;
	private String renddate;
	
	public PerCalendarDto() {
		
	}

	public PerCalendarDto(int seq, String id, String title, String content, String wdate, String rstartdate,
			String renddate) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.rstartdate = rstartdate;
		this.renddate = renddate;
	}

	public PerCalendarDto(String id, String title, String content, String rstartdate, String renddate) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.rstartdate = rstartdate;
		this.renddate = renddate;
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

	public String getRstartdate() {
		return rstartdate;
	}

	public void setRstartdate(String rstartdate) {
		this.rstartdate = rstartdate;
	}

	public String getRenddate() {
		return renddate;
	}

	public void setRenddate(String renddate) {
		this.renddate = renddate;
	}

	@Override
	public String toString() {
		return "PerCalendarDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate="
				+ wdate + ", rstartdate=" + rstartdate + ", renddate=" + renddate + "]";
	}

	

	
	
   
}
