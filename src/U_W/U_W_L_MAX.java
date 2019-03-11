package U_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class U_W_L_MAX {
	public static String getWeather() throws Exception{
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=la+날씨").get();
		
	
		Elements spt2 = doc.select("span.max span.num");
		
		
		Element wspt2 = spt2.get(0);			
		String text2 = wspt2.text();			
		System.out.println("la 최고 날씨 = "+text2 );
				
		return text2;
		
	}

}
