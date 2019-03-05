package Exchange;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class R_manager {
public static List<R_Exchange> getExchange() throws Exception{
		
		List<R_Exchange> list = new ArrayList<>();
		
		//러시아
		 Document doc = Jsoup.connect(
				  "https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_RUBKRW").get();
				  
		
		Elements spt = doc.select("p.no_today em.no_down em.no_down");
		
		
		
		Element espt = spt.get(0);
		 String text = espt.text(); 
		
		System.out.println("text = "+text +"원");
		
		R_Exchange Exc = new R_Exchange();
		Exc.setR_spt(spt.toString());
		list.add(Exc);
		return list;
	}
}
