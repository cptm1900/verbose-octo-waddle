package kr.or.ddit.jackson;

import static java.time.format.TextStyle.FULL;	// static으로 TextStyle의 FULL을 선언

import java.io.IOException;
import java.time.Month;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.core.exc.StreamWriteException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

class CalendarUIDataTest {

	@Test
	void test() throws StreamWriteException, DatabindException, IOException {
		Locale locale = Locale.getDefault();
		
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
		
		ObjectWriter mapper = new ObjectMapper().writerWithDefaultPrettyPrinter();
		
		mapper.writeValue(System.out, target);
	}

}
