package Weather;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class R_W_M_mm {
	public static List<R_Weather> getWeather() throws Exception{
		List<R_Weather> list = new ArrayList<>();
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=모스크바+날씨").get();
		
		Elements  spt = doc.select("p.info_weath_tem span.todaytemp");		

		Element wspt = spt.get(0);
		String text = wspt.text();	
		
		R_Weather Wet = new R_Weather();
		Wet.setR_spt(spt.toString());
		list.add(Wet);
		return list;
	}

}
