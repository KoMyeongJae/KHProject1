package Exchange;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class V_main {
	public static void main(String[] args) throws Exception{

		//베트남
		
		  Document doc = Jsoup.connect(
		  "https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_VNDKRW").get();
		  
		 Elements spt = doc.select("p.no_today em em");
		 
	
		List<V_Exchange> list = V_manager.getExchange();
		
		for (V_Exchange exchange : list) {
			System.out.print(exchange.toString());
			}

		
		
	}

}
