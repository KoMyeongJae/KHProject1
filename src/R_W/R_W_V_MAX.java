package R_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class R_W_V_MAX {
public static String getWeather() throws Exception{
		
		//날씨
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=블라디보스톡+날씨").get();
			
	
		Elements spt2 = doc.select("span.max span.num");
		
		
		Element wspt2 = spt2.get(0);			
		String text2 = wspt2.text();			
		System.out.println("블라디보스톡 최고 날씨 = "+text2 );
				
		return text2;
		
	}

}
