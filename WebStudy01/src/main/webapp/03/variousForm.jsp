<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/variousForm.jsp</title>
</head>
<body>

<!-- 500번대 에러는 서버쪽, 400번대 에러는 클라이언트쪽 -->

<!-- form 옵션에 편지 봉투에 들어가는 3개의 값이 들어감 -->
<form action="<%=request.getContextPath()%>/request/parameters" 
method="get" enctype="application/x-www-form-urlencoded">
	<pre>
		<input type="number" name="param1" placeholder="숫자" />
		<input type="date" name="param2" placeholder="날짜" />
		<input type="datetime-local" name="param3" placeholder="날짜+시간" />
		<input type="radio" name="param4" value="RADIO1" /> <!-- 입력 필드가 없는 input은 value값이 있어야 값 전달이 가능함 -->
		<input type="radio" name="param4" value="RADIO2" />
		<input type="checkbox" name="param5" />
		<input type="checkbox" name="param5" />
		<input type="checkbox" name="param5" />
		<input type="text" name="param6"/>
		<select id="param7" name="param7">	<!-- form은 name이 있는 값들만 전송됨 -->
			<option value>선택</option>	<!-- 이렇게 하면 전송값이 화이트 스페이스 나옴 -->
			<option value="v1">text1</option>	<!-- select는 option의 text가 value임 -->
			<option value="v2">text2</option>	<!-- value값을 따로 적으면 그 value값이 전송 -->
			<option value="v3">text3</option>
		</select>
		<!-- multiple 쓰면 다중선택 가능 -->
		<select name="param8" multiple>	<!-- multiple="multiple" == multiple -->
			<option value="V1" label="text1" />
			<option value="V2" label="text2" />
			<option value="V3" label="text3" />
		</select>
		<button type="submit">전송</button>
	</pre>
</form>
</body>
</html>