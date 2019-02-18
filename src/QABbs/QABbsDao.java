package QABbs;

public class QABbsDao implements iQABbsDao {
	
	// interface 및 singleton 사용
	private static QABbsDao qab = new QABbsDao();
	
	private QABbsDao() {
		
	}
	
	public static QABbsDao getInstance() {
		return qab;
	}
}
