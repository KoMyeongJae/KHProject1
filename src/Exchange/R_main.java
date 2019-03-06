package Exchange;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class R_main {
	public static void main(String[] args) throws Exception{

		//러시아
		
		  Document doc = Jsoup.connect(
		  "https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_RUBKRW").get();
		  
		 Elements spt = doc.select("p.no_today em em");
		 
		List<R_Exchange> list = R_manager.getExchange();
		
		
		
		for (R_Exchange exchange : list) {
			System.out.print(exchange.toString());
			}

		
		
	}

}
