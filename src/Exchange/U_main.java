package Exchange;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class U_main {

	public static void main(String[] args) throws Exception {
		//달러
		Document doc = Jsoup.connect(
				"https://finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_USDKRW")
				.get();
		
		Elements spt = doc.select("p.no_today em.no_down em.no_down");
		
		List<U_Exchange> list = U_manager.getExchanges();
		
		for (U_Exchange u_Exchange : list) {
			System.out.println(u_Exchange.toString());
		}
	}

}
