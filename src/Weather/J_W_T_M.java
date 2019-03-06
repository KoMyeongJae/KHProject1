package Weather;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class J_W_T_M {
	public static void main(String[] args) throws Exception {
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=도쿄+날씨").get();
		
		Elements spt = doc.select("p.info_weath_tem span.todaytemp");
		
		List<J_weather_osaka> list = J_W_T_mm.getWeather();
		
		for (J_weather_osaka weather : list) {
			System.out.print(weather.toString());
			}
	}

}
