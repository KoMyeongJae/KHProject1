package Weather;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class U_W_L_mm {
	public static List<U_Wether> getWeather() throws Exception{
		List<U_Wether> list = new ArrayList<>();
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=la+날씨").get();
		
		Elements spt = doc.select("p.info_weath_tem span.todaytemp");

		Element wspt = spt.get(0);
		String text = wspt.text();
		
		U_Wether Wet = new U_Wether();
		Wet.setU_spt(spt.toString());
		list.add(Wet);
		return list;
			
	}

}
