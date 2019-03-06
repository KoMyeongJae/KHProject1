package QABbs;

import java.util.List;

import dto.PagingBean;
import dto.PagingBean1;

public interface iQABbsDao {
	
	public List<QABbsDto> getQABbsSearchList(String searchWord, String choice);
	public boolean writeQAB(QABbsDto Qbs);
	 
	public QABbsDto getQbs(int seq);
	public void readcount(int seq);
	
	public boolean Q_answer(int seq, QABbsDto Qbs);
	public boolean updateQbs(int seq, String title, String content);
	public boolean deleteQbs(int seq);

	public List<QABbsDto> getQAPagingList(PagingBean paging, String searchWord, String choice);
	
}
