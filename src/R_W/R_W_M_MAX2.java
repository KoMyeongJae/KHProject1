package R_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import J_W.J_W_O_mm;

public class R_W_M_MAX2 {
	public static void main(String[] args) throws Exception {
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=모스크바+날씨").get();		
		
		Elements spt2 = doc.select("span.max span.num");
		
		String text =R_W_M_MAX.getWeather();
		
		

	}

}
