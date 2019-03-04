package Weather;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class V_W_D_mm {
	public static List<V_Wether> getWeather() throws Exception{
		List<V_Wether> list = new ArrayList<>();
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=다낭+날씨").get();
		
		Elements  spt = doc.select("p.info_weath_tem span.todaytemp");
		
		Element wspt = spt.get(0);
		String text = wspt.text();
		
		V_Wether Wet = new V_Wether();
		Wet.setV_spt(spt.toString());
		list.add(Wet);
		return list;
	}

}
