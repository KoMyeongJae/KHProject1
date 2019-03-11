package R_W;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class R_W_M_M {
	public static void main(String[] args) throws Exception {
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=모스크바+날씨").get();
		
		Elements  spt = doc.select("p.info_weath_tem span.todaytemp");
		
		String text = R_W_M_mm.getWeather();
				
	
	}

}
