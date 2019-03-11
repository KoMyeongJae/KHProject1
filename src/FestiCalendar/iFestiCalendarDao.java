package FestiCalendar;

import java.util.List;

public interface iFestiCalendarDao {
	
	public List<FestiCalendarDto> getFestList(String yyyymm);
	
	public List<FestiCalendarDto> getSpecFestList(String swdate);
	
	public FestiCalendarDto detailFestList(int seq);
	
	public boolean addZzimlist(int seq, String id);
	
	public List<FestiCalendarDto> getZzimList(String id);
	
	public List<FestiCalendarDto> getDayZzim(String id, String srdate);
	
	
	public boolean delZzim(int seq, String id);
}
