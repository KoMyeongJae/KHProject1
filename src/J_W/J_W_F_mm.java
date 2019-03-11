package J_W;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class J_W_F_mm {
	public static String getWeather() throws Exception{
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=후쿠오카+날씨").get();
		
		Elements spt = doc.select("p.info_weath_tem span.todaytemp");
		
		Element wspt = spt.get(0);
		String text = wspt.text(); 
		System.out.println("후쿠오카 날씨 = "+text );
		
		return text;
	}

}