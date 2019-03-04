package Weather;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class V_W_D_M {
	
	public static void main(String[] args) throws Exception{
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=다낭+날씨").get();
		
		Elements  spt = doc.select("p.info_weath_tem span.todaytemp");
		
		List<V_Wether> list = V_W_D_mm.getWeather();
		
		for (V_Wether v_Wether : list) {
			System.out.print(v_Wether.toString());
		}
	}

}
