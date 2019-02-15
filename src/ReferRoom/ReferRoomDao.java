package ReferRoom;

public class ReferRoomDao implements iReferRoomDao {
	
	// interface 및 singleton 사용
	private static ReferRoomDao refr = new ReferRoomDao();
	
	private ReferRoomDao() {
		
	}
	
	public static ReferRoomDao getInstance() {
		return refr;
	}
}
