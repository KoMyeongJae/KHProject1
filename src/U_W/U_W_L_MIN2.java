package U_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class U_W_L_MIN2 {
	public static void main(String[] args) throws Exception {
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=la+날씨").get();		
		
		Elements spt2 = doc.select("span.min span.num");
		
		String text = U_W_L_MIN.getWeather();	
	}

}