package FestiCalendar;

public class FestiCalendarDao implements iFestiCalendarDao {
	
	// interface 및 singleton 사용
	private static FestiCalendarDao ftc = new FestiCalendarDao();
	
	private FestiCalendarDao() {
		
	}
	
	public static FestiCalendarDao getInstance() {
		return ftc;
	}
}
