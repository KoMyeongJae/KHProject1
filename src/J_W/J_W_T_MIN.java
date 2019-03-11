package J_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class J_W_T_MIN {
	public static String getWeather() throws Exception{
		
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=도쿄+날씨").get();
				
	
		Elements spt2 = doc.select("span.min span.num");
		
		
		Element wspt2 = spt2.get(0);			
		String text2 = wspt2.text();			
		System.out.println("도쿄 최저 날씨 = "+text2 );
				
		return text2;
		
	}

}
