package dto;

public class PagingUtil1 {
	
	public static PagingBean1 setPagingInfo(PagingBean1 paging) {
		
		paging.setCountPerPage(9);		// [1]	-> 10
		paging.setBlockCount(10);		// [1] ~ [10]
		
		paging.setStartNum( paging.getTotalCount() 
				- (paging.getNowPage()-1) * paging.getCountPerPage() );
		/*
		  	
		  	11 - (1 - 1) * 9 = 11
		  	11 - (2 - 1) * 9 = 2 
		 
			23 -> / 10	-> 2
			23 -> % 10 > 0 -> + 1	==> 3
					 
			23 - (1 - 1) * 10 = 23 			23	 
			23 - (2 - 1) * 10 = 13			13
			23 - (3 - 1) * 10 = 3			3		
						
						[1][2][3]		
		*/
		return paging;
	}
}
