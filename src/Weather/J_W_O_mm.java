
package Weather;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class J_W_O_mm {
	 public static List<J_weather_osaka> getWeather() throws Exception{
		List<J_weather_osaka> list = new ArrayList<>();
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=오사카+날씨").get();
				
		Elements spt = doc.select("p.info_weath_tem span.todaytemp");
		
		Element wspt = spt.get(0);
		String text = wspt.text(); 
		System.out.println("text = "+text );
		
		J_weather_osaka Wet = new J_weather_osaka();
		Wet.setJW_o_spt(spt.toString());
		list.add(Wet);
		return list;
	}

}
