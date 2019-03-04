package CommentP;

import java.io.Serializable;

public class CommentPDto implements Serializable {

	private static final long serialVersionUID = -3818836766144761316L;
	
	private int seq;
	private String id;
	private String content;
	private int bbs_seq;
	private String wdate;
	private int del;
	public CommentPDto(int seq, String id, String content, int bbs_seq, String wdate, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.content = content;
		this.bbs_seq = bbs_seq;
		this.wdate = wdate;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBbs_seq() {
		return bbs_seq;
	}
	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "CommentPDto [seq=" + seq + ", id=" + id + ", content=" + content + ", bbs_seq=" + bbs_seq + ", wdate="
				+ wdate + ", del=" + del + "]";
	}
}
