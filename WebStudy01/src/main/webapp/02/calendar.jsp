<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Optional"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.time.Month"%>
<%@page import="static java.time.format.TextStyle.FULL"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.temporal.WeekFields"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.YearMonth"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
// 	ZoneId zone = ZoneId.systemDefault();	// 시스템의 기본 시간값으로 설정
// 	ZoneId zone = ZoneId.of("Asia/Seoul");
	Set<String> zoneSet = ZoneId.getAvailableZoneIds();
	
	ZoneId zone = Optional.ofNullable(request.getParameter("zone"))
							.filter(zp->!zp.isEmpty())	// empty가 아닌 것으로 걸러줌
							.map(m->ZoneId.of(m))	// map을 이용해 문자열 타입을 ZoneId 타입으로 바꿈
							.orElse(ZoneId.systemDefault());	// null이면 시스템 기본값으로

// 	Locale locale = Locale.GERMAN;	// 국가 설정
// 	Locale locale = Locale.JAPAN;
// 	Locale locale = request.getLocale();	// 서버 기준이 아니라 클라이언트 기준으로 해야하기 때문에 request 사용
// 	Locale locale = Locale.forLanguageTag("ko-KR");		// 언어 태그로도 설정 가능

	Locale locale = Optional.ofNullable(request.getParameter("locale"))
							.filter(lp->!lp.isEmpty())
							.map(lp->Locale.forLanguageTag(lp))
							.orElse(request.getLocale());

	LocalDate today = LocalDate.now(zone);
// 	YearMonth ym = YearMonth.from(today);
	
	int year = Optional.ofNullable(request.getParameter("year"))
						.filter(yp->yp.matches("\\d{4}"))
						// 정수는 d, d 뒤에 + 쓰면 하나 이상의 반복, {}는 제한 조건 (위에 쓴 건 4글자까지 받는다는 뜻)
// 						.map(yp->Integer.parseInt(yp))
						.map(Integer::parseInt)
						// 변수가 하나만 있고 그걸 그대로 쓰는 경우 위에처럼 메소드 레퍼런스로 표현 가능
						.orElse(today.getYear());
						
	int month = Optional.ofNullable(request.getParameter("month"))
						.filter(yp->yp.matches("[1-9]|1[0-2]"))
						// []는 한 글자의 패턴 설정 (1-9 : 1~9까지, | : or연산자, 1[0-2] : 첫자리가 1이고 2번째 자리가 0~2)
						.map(Integer::parseInt)
						.orElse(today.getMonthValue());
	
	YearMonth ym = YearMonth.of(year, month);
	YearMonth beforeYM = ym.minusMonths(1);
	YearMonth afterYM = ym.plusMonths(1);
	
	WeekFields wfs = WeekFields.of(locale);
	// 나라마다 시작 요일이 다르기 때문에 하드 코딩하면 안 좋음 (독일 같은 경우는 월요일이 시작)
	
	LocalDate firstDOM = ym.atDay(1);	// 날짜 1일로 만듦
	int offset = firstDOM.get(wfs.dayOfWeek()) - 1;
	LocalDate firstDisplay = firstDOM.minusDays(offset);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.sunday {
		color: red;
	}
	.saturday {
		color: blue;
	}
	.before, .after {
		color: silver;
	}
	#today {
		color: green;
		font-weight: bold;
	}
	a:visited  {
		color: black;
	}
	a {
		color: black;
		text-decoration: none;
	}
</style>
</head>
<body>
<form name="calForm" onchange="this.requestSubmit(); method='post'">
	<input type="number" name="year" />
	<select name="month">
	<%=
		Arrays.stream(Month.values())
				.map(m->String.format(locale, "<option value='%d'>%s</option>",
										m.getValue(), m.getDisplayName(FULL, locale)))
				.collect(Collectors.joining("\n"))
	%>
	</select>
	<select name="locale">
	<%=
		Arrays.stream(Locale.getAvailableLocales())
				.filter(l->!l.getDisplayName().isEmpty())
				.map(l->String.format("<option value='%s'>%s</option>",
										l.toLanguageTag(), l.getDisplayName(l)))
				.collect(Collectors.joining("\n"))
	%>
	</select>
	<select name="zone">
	<%=
		ZoneId.getAvailableZoneIds().stream()
				.map(zid->String.format("<option value='%s'>%s</option>", 
									zid, ZoneId.of(zid).getDisplayName(FULL, locale)))
				.collect(Collectors.joining("\n"))
				
// 		Arrays.stream(zoneSet.toArray())
// 				.map(m->String.format("<option value='%s'>%s</option>",
// 										m.toString(), m.toString()))
// 				.collect(Collectors.joining("\n"))
	%>
	</select>
</form>

<h1>현재 시간 : <%=LocalDateTime.now(zone)%></h1>

<%-- conversion --%>
<%-- 1$ : 첫번째 인덱스 변수 --%>
<h1>
<%-- action, href, src 같은 요소는 값을 안 쓰면 자기 자신이므로 그냥 ?쓰면 자기 자신한테 파라미터 값 보냄 --%>
<%-- <a href="?year=<%=beforeYM.getYear()%>&month=<%=beforeYM.getMonthValue()%>&locale=<%=locale.toLanguageTag()%>&zone=<%=zone%>">&nbsp;&nbsp;☜&nbsp;&nbsp;&nbsp;</a> --%>

<%-- javascript:void(0) : 아무것도 안 한다는 뜻 (void함수) --%>
<a href="javascript:void(0);" class="link-a" data-year="<%=beforeYM.getYear()%>" data-month="<%=beforeYM.getMonthValue()%>" >&nbsp;&nbsp;☜&nbsp;&nbsp;&nbsp;</a>
<%=String.format(locale, "%1$tY, %1$tB", ym)%>
<a href="javascript:void(0);" class="link-a" data-year="<%=afterYM.getYear()%>" data-month="<%=afterYM.getMonthValue()%>" >&nbsp;&nbsp;&nbsp;☞</a>
</h1>

<table>
	<thead>
		<tr>
		<%
			DayOfWeek firstDOW = wfs.getFirstDayOfWeek();
			for(int i=0; i<7; i++) {
				DayOfWeek thisTurn = firstDOW.plus(i);
				%>
				<th class="<%=thisTurn.name().toLowerCase()%>">
					<%--thisTurn.getDisplayName(TextStyle.FULL, locale)--%>
					<%=thisTurn.getDisplayName(FULL, locale)%>
					<%-- static import를 했기 때문에 위처럼 가능 --%>
				</th>
				<%
			}
		%>
		</tr>
	</thead>
	<tbody>
		<%
			int count = 0;
			for(int row=1; row<=6; row++) {
				%>
				<tr>
				<%
				for(int col=1; col<=7; col++) {
					LocalDate thisTurn = firstDisplay.plusDays(count++);
					YearMonth thisTurnYM = YearMonth.from(thisTurn);
					String classAttr = thisTurnYM.isBefore(ym) ? "before" : 
											thisTurnYM.isAfter(ym)? "after" : "this-month";
					classAttr += " " + thisTurn.getDayOfWeek().name().toLowerCase();
					
					boolean isToday = thisTurn.isEqual(today);
						%>
						<td <%=isToday ? "id='today'" : ""%> class="<%=classAttr%>"><%=thisTurn.getDayOfMonth()%></td>
						<%
				}
				%>
				</tr>
				<%
			}
		%>
	</tbody>
</table>
<script type="text/javascript">
	// document.(name속성) form은 이렇게도 요소 찾기 가능
	const calForm = document.calForm;	
	calForm.year.value = <%=ym.getYear()%>;
	calForm.month.value = <%=ym.getMonthValue()%>;
	calForm.locale.value = "<%=locale.toLanguageTag()%>";	// 문자열이기 때문에 따옴표 필요
	calForm.zone.value = '<%=zone.getId()%>';
	
	document.querySelectorAll(".link-a").forEach(a=>{
		a.addEventListener("click", e=>{
			calForm.year.value = a.dataset.year;
			calForm.month.value = a.dataset['month'];
			calForm.requestSubmit();
		});
	});
</script>

</body>
</html>