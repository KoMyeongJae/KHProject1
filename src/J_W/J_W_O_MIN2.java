package J_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class J_W_O_MIN2 {
	public static void main(String[] args) throws Exception {
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=오사카+날씨").get();		
		
		Elements spt2 = doc.select("span.min span.num");
		
		String text =J_W_O_MIN.getWeather();
		
		

	}

}
