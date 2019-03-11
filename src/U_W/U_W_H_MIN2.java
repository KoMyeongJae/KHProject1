package U_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import R_W.R_W_M_MIN;

public class U_W_H_MIN2 {
	public static void main(String[] args) throws Exception {
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=하와이+날씨").get();		
		
		Elements spt2 = doc.select("span.min span.num");
		
		String text = U_W_H_MIN.getWeather();		
	}

}
