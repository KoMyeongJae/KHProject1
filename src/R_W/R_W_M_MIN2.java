package R_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import J_W.J_W_O_mm;

public class R_W_M_MIN2 {
	public static void main(String[] args) throws Exception {
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=후쿠오카+날씨").get();		
		
		Elements spt2 = doc.select("span.min span.num");
		
		String text =R_W_M_MIN.getWeather();
		
		

	}

}
