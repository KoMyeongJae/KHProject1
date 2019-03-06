package Weather;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class R_W_S_M {
public static void main(String[] args) throws Exception {
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=상트페테르부르크+날씨").get();
		
		Elements  spt = doc.select("p.info_weath_tem span.todaytemp");
		
		List<R_Weather> list = R_W_V_mm.getWeather();
		
		for (R_Weather r_Weather : list) {
			System.out.print(r_Weather.toString());
		}
	}

}
