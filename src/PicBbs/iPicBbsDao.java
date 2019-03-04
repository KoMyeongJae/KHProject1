package PicBbs;

import java.util.List;

import QABbs.QABbsDto;
import dto.PagingBean;
import dto.PagingBean1;

public interface iPicBbsDao {
	
	public List<PicBbsDto> getPicList();
	
	public boolean addPic(PicBbsDto dto);
	
	public PicBbsDto detailPic(int seq);
	
	public boolean updatePic(PicBbsDto dto, int seq);
	
	public boolean deletePic(int seq);
	
	public void readcount(int seq);
	
	public List<PicBbsDto> getPicPagingList(PagingBean1 paging, String searchWord, String choice);
	
}
