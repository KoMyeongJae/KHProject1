package Weather;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class J_W_O_M {
	public static void mian(String[] args) throws Exception {
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=오사카+날씨").get();
		
		Elements jW_o_spt = doc.select("p.info_weath_tem span.todaytemp");
		
		List<J_weather_osaka> list =J_W_O_mm.getWeather();
		
		for (J_weather_osaka weather : list) {
			System.out.print(weather.toString());
			}

	}

}
