package FestiCalendar;

import java.util.List;

<<<<<<< HEAD

=======
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
public interface iFestiCalendarDao {
	
<<<<<<< HEAD
public List<FestiCalendarDto> getCalendarList(String id, String yyyyMM);
	
	public boolean addCalendar(FestiCalendarDto cal);
	
	public FestiCalendarDto get_Festi(int seq);
	
	
	public boolean update_Festi(FestiCalendarDto cal);
	
	public List<FestiCalendarDto> getdaylist(String date);
	
=======
	public List<FestiCalendarDto> getFestList(String yyyymm);
	
	public List<FestiCalendarDto> getSpecFestList(String swdate);
	
	public FestiCalendarDto detailFestList(int seq);
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
	
}
