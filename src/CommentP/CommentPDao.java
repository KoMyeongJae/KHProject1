package CommentP;

public class CommentPDao implements iCommentPDao {
	
	// interface 및 singleton 사용
	private static CommentPDao comm = new CommentPDao();
	
	private CommentPDao() {
		
	}
	
	public static CommentPDao getInstance() {
		return comm;
	}
	
}
