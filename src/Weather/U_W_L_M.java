package Weather;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class U_W_L_M {
	public static void main(String[] args) throws Exception{
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=la+날씨").get();
		
		Elements spt = doc.select("p.info_weath_tem span.todaytemp");
		
		List<U_Wether> list = U_W_L_mm.getWeather();
		
		for (U_Wether u_Wether : list) {
			System.out.print(u_Wether.toString());
		}

	}

}
