package V_W;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import U_W.U_W_N_MAX;

public class V_W_D_MAX2 {
	public static void main(String[] args) throws Exception {
		
		//날씨
		
		Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=top_hty&fbm=0&ie=utf8&query=다낭+날씨").get();		
		
		Elements spt2 = doc.select("span.max span.num");
		
		String text = V_W_D_MAX.getWeather();
		
		

	}

}
