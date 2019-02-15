package InfoCntry;

public class InfoCntryDao implements iInfoCntryDao {
	
	// interface 및 singleton 사용
	private static InfoCntryDao infoC = new InfoCntryDao();
	
	private InfoCntryDao() {
		
	}
	
	public static InfoCntryDao getInstance() {
		return infoC;
	}
}
