package PerCalendar;


public class PerCalendarDao implements iPerCalendarDao {
	
	// interface 및 singleton 사용
	private static PerCalendarDao percal = new PerCalendarDao();
	
	private PerCalendarDao() {
		
	}
	
	public static PerCalendarDao getInstance() {
		return percal;
	}
}
