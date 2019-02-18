package QABbs;

import java.util.List;

public interface iQABbsDao {
	
	public List<QABbsDto> getQABbsList(String searchWord, String choice);
	public boolean writeQAB(QABbsDto Qbs);
	
	public QABbsDto getQbs(int seq);
	public void readcount(int seq);
	
	public boolean Q_answer(int seq, QABbsDto Qbs);
	public boolean updateQbs(int seq, String title, String content);
	public boolean deleteQbs(int seq);

}
