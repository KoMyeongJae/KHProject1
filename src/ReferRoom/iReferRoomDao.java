package ReferRoom;

import java.util.List;

<<<<<<< HEAD
=======
import QABbs.QABbsDto;
import dto.PagingBean;

>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git

public interface iReferRoomDao {

	
	public List<ReferRoomDto> get_ReferRoomList();
	
	public boolean add_ReferR(ReferRoomDto rfr);
	
	public ReferRoomDto detail_ReferR(int seq);
	
	public void readCount(int seq);
	
	public void downCount(int seq);
	
	public void delete_ReferR(int seq);
	
	public void update_ReferR(ReferRoomDto rfr);
	
	public List<ReferRoomDto> searchList(String choice, String search);
	
	public void add_likeit(int seq);
	
	public void del_likeit(int seq);
	
	public boolean check_likeit(int seq, String id);
	
	public void add_likeit_table(int seq, String id);
	
	public void del_likeit_table(int seq, String id);
<<<<<<< HEAD
=======
	
	public List<ReferRoomDto> getReferPagingList(PagingBean paging, String searchWord, String choice);
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
}
