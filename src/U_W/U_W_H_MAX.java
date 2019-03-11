package U_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class U_W_H_MAX {
	public static String getWeather() throws Exception{
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=하와이+날씨").get();
				
	
		Elements spt2 = doc.select("span.max span.num");
		
		
		Element wspt2 = spt2.get(0);			
		String text2 = wspt2.text();			
		System.out.println("하와이 최고 날씨 = "+text2 );
				
		return text2;
		
	}

}
