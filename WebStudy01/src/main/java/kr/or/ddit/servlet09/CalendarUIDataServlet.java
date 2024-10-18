package kr.or.ddit.servlet09;

import static java.time.format.TextStyle.FULL;

import java.io.IOException;
import java.time.Month;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

@WebServlet("/calendar/ui-data")
public class CalendarUIDataServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Locale locale = req.getLocale();
		
		Map<String, Object> target = new HashMap<>();
		target.put("months", Arrays.stream(Month.values())
									.map(m->m.getDisplayName(FULL, locale))
									.toArray(String[]::new)
		);
		
		Map<String, String> locales = Arrays.stream(Locale.getAvailableLocales())
											.filter(l->!l.getDisplayName().isEmpty())
//											.collect(Collectors.toMap(l->l.toLanguageTag(), null));
											.collect(Collectors.toMap(Locale::toLanguageTag, l->l.getDisplayName(l)));	// 메소드 레퍼런스
		target.put("locales", locales);
		
		Map<String, String> zones = ZoneId.getAvailableZoneIds().stream()
									.collect(Collectors.toMap(zid->zid, 
											zid->ZoneId.of(zid).getDisplayName(FULL,locale)));
		
		target.put("zones", zones);
		
		resp.setContentType("application/json; charset=utf-8");
		
		ObjectWriter mapper = new ObjectMapper().writerWithDefaultPrettyPrinter();
		
//		mapper.writeValue(System.out, target);
		mapper.writeValue(resp.getWriter(), target);
	}
}
