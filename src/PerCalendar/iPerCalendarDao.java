package PerCalendar;

import java.util.List;

public interface iPerCalendarDao {
	
	public List<PerCalendarDto> getPerCaledatList(String id, String yyyyMM);
   
	public boolean addPerCalendar(PerCalendarDto pcal);
	
	public List<PerCalendarDto> getDayList(String id,String yyyyMMdd);
	
	public PerCalendarDto getDay(int seq);
	
	public boolean deletePerCalendar(int seq);
	
	public boolean updatePerCalendar(PerCalendarDto pcal);
}
