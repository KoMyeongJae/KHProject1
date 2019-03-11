package CommentP;

import java.util.List;

public interface iCommentPDao {
	
	
	// 해당 글 댓글 리스트 가져오기
	public List<CommentPDto> getCommentList(String bbsType);
	
	// 해당 글 댓글 추가하기
	public boolean addComment(CommentPDto dto, String bbsType);
	
	// 해당 글 댓글 삭제하기
	public boolean deleteComment(int seq, String bbsType);
	
	// 해당 글 댓글 수정하기
	public boolean updateComment(int seq, String content, String bbsType);
	
}
