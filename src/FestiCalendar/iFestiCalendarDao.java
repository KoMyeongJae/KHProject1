package FestiCalendar;

import java.util.List;

public interface iFestiCalendarDao {
	
	public List<FestiCalendarDto> getFestList(String yyyymm);
	
	public List<FestiCalendarDto> getSpecFestList(String swdate);
	
	public FestiCalendarDto detailFestList(int seq);
	
}
