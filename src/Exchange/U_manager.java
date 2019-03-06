package Exchange;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class U_manager {

	public static List<U_Exchange> getExchanges() throws Exception{ 

		List<U_Exchange> list = new ArrayList<>();
		
		//달러
		Document doc = Jsoup.connect(
				"https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_USDKRW")
				.get();
		
<<<<<<< HEAD
		Elements spt = doc.select("p.no_today em.no_down em.no_down");
=======
		Elements spt = doc.select("p.no_today em em");
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
		
		Element espt = spt.get(0);
		String text = espt.text();
		
		System.out.println("text = "+text +"원");
		
		U_Exchange Exc = new U_Exchange();
		Exc.setSpt(spt.toString());
		list.add(Exc);
		return list;
	}

}
