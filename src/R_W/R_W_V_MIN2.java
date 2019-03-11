package R_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class R_W_V_MIN2 {
public static void main(String[] args) throws Exception {
		
		//날씨
		

		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=블라디보스톡+날씨").get();
	
		Elements spt2 = doc.select("span.min span.num");
		
		String text =R_W_V_MIN.getWeather();
		
		

	}	

}
