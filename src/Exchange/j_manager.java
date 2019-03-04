package Exchange;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class j_manager {
	public static List<J_Exchange> getExchange() throws Exception{
		
		List<J_Exchange> list = new ArrayList<>();
		
		//엔화
		Document doc = Jsoup.connect(
				"https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_JPYKRW")
				.get();
		
		Elements spt = doc.select("p.no_today em em");
		
		
		
		Element espt = spt.get(0);
		 String text = espt.text(); 
		
		System.out.println("text = "+text +"원");
		
		J_Exchange Exc = new J_Exchange();
		Exc.setSpt(spt.toString());
		list.add(Exc);
		return list;
	}
}
