package PicBbs;

public class PicBbsDao implements iPicBbsDao {
	
	// interface 및 singleton 사용
	private static PicBbsDao pbs = new PicBbsDao();
	
	private PicBbsDao() {
		
	}
	
	public static PicBbsDao getInstance() {
		return pbs;
	}
}
