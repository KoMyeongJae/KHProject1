package Exchange;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class V_manager {

public static List<V_Exchange> getExchange() throws Exception{
		
		List<V_Exchange> list = new ArrayList<>();
		
		//베트남
		Document doc = Jsoup.connect(
				  "https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_VNDKRW").get();
				  
		Elements spt = doc.select("p.no_today em em");
		
		
		
		Element espt = spt.get(0);
		 String text = espt.text(); 
		
		System.out.println("text = "+text +"원");
		
		V_Exchange Exc = new V_Exchange();
		Exc.setV_spt(spt.toString());
		list.add(Exc);
		return list;
	}
}
