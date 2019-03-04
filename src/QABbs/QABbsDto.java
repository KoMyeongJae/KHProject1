package QABbs;

import java.io.Serializable;


/*CREATE TABLE QABBS(
	    SEQ NUMBER(8) PRIMARY KEY,
	    ID VARCHAR2(50) NOT NULL,
	    TITLE VARCHAR2(200) NOT NULL,
	    CONTENT VARCHAR2(4000) NOT NULL,
	    WDATE DATE NOT NULL,
	    READCOUNT NUMBER(8) NOT NULL,
	    DEL NUMBER(8) NOT NULL,
	    PBPV NUMBER(8) NOT NULL,
	    REF NUMBER(8) NOT NULL,
	    STEP NUMBER(8) NOT NULL,
	    DEPTH NUMBER(8) NOT NULL,
	    PARENT NUMBER(8) NOT NULL
	);
	DROP TABLE QABBS
	CASCADE CONSTRAINTS;

	CREATE SEQUENCE SEQ_QABBS
	START WITH 1
	INCREMENT BY 1;
	DROP SEQUENCE SEQ_QABBS;

	ALTER TABLE QABBS
	ADD CONSTRAINT FK_QABBS_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID);

	CREATE TABLE QABBS_COMMENT(
	    SEQ NUMBER(8) PRIMARY KEY,
	    ID VARCHAR2(50) NOT NULL,
	    CONTENT VARCHAR2(4000) NOT NULL,
	    QABBS_SEQ NUMBER(8) NOT NULL,
	    WDATE DATE NOT NULL,
	    DEL NUMBER(8) NOT NULL
	);
	DROP TABLE QABBS_COMMENT
	CASCADE CONSTRAINTS;

	CREATE SEQUENCE SEQ_QABCOMM
	START WITH 1
	INCREMENT BY 1;
	DROP SEQUENCE SEQ_QABCOMM;

	ALTER TABLE QABBS_COMMENT
	ADD CONSTRAINT FK_QABBS_SEQ FOREIGN KEY(QABBS_SEQ)
	REFERENCES QABBS(SEQ);

*/
public class QABbsDto implements Serializable {
	
	private static final long serialVersionUID = 2513854520872586803L;
	
	private int seq;
	   private String id;
	   private String title;
	   private String content;
	   private String wdate;
	   private int readcount;
	   private int del;
	   private int pbpv;   //공개 비공개
	   private int ref;   // 그룹번호
	   private int step;   // 행번호
	   private int depth;   // 깊이 
	   private int parent;
	   
	   
	   public QABbsDto(int seq, String id, String title, String content, String wdate, int readcount, int del, int pbpv,
	         int ref, int step, int depth, int parent) {
	      super();
	      this.seq = seq;
	      this.id = id;
	      this.title = title;
	      this.content = content;
	      this.wdate = wdate;
	      this.readcount = readcount;
	      this.del = del;
	      this.pbpv = pbpv;
	      this.ref = ref;
	      this.step = step;
	      this.depth = depth;
	      this.parent = parent;
	   }



	   public QABbsDto(String id,String title,String content, int pbpv) {
	      super();
	      this.id = id;
	      this.title = title;
	      this.content = content;
	      this.pbpv = pbpv; 
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

	   public int getRef() {
	      return ref;
	   }

	   public void setRef(int ref) {
	      this.ref = ref;
	   }

	   public int getStep() {
	      return step;
	   }

	   public void setStep(int step) {
	      this.step = step;
	   }

	   public int getDepth() {
	      return depth;
	   }

	   public void setDepth(int depth) {
	      this.depth = depth;
	   }

	   public int getDel() {
	      return del;
	   }

	   public void setDel(int del) {
	      this.del = del;
	   }

	   public int getPbpv() {
	      return pbpv;
	   }

	   public void setPbpv(int pbpv) {
	      this.pbpv = pbpv;
	   }

	   public int getParent() {
	      return parent;
	   }

	   public void setParent(int parent) {
	      this.parent = parent;
	   }

	   public static long getSerialversionuid() {
	      return serialVersionUID;
	   }

	   @Override
	   public String toString() {
	      return "QABbsDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate=" + wdate
	            + ", readcount=" + readcount + ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", del=" + del
	            + ", pbpv=" + pbpv + ", parent=" + parent + "]";
	   }
	
	
	

}
