package Exchange;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;



public class J_main {
	
	public static void main(String[] args) throws Exception{

		//엔화
<<<<<<< HEAD
		Document doc = Jsoup.connect(
				"https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_JPYKRW")
				.get();
		
		Elements spt = doc.select("p.no_today em.no_up em.no_up");
=======
		
		  Document doc = Jsoup.connect(
		  "https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_JPYKRW").get();
		  
		 Elements spt = doc.select("p.no_today em em");
		 
		
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
		
		List<J_Exchange> list = j_manager.getExchange();
		
		for (J_Exchange exchange : list) {
			System.out.print(exchange.toString());
			}

		
		
	}
}
