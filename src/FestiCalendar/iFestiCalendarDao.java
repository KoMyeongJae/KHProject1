package FestiCalendar;

import java.util.List;


public interface iFestiCalendarDao {
	
public List<FestiCalendarDto> getCalendarList(String id, String yyyyMM);
	
	public boolean addCalendar(FestiCalendarDto cal);
	
	public FestiCalendarDto get_Festi(int seq);
	
	
	public boolean update_Festi(FestiCalendarDto cal);
	
	public List<FestiCalendarDto> getdaylist(String date);
	
	
}
