package U_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class U_W_N_MAX2 {
	public static void main(String[] args) throws Exception {
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=뉴욕+날씨").get();		
		
		Elements spt2 = doc.select("span.max span.num");
		
		String text = U_W_N_MAX.getWeather();
		
		

	}

}
