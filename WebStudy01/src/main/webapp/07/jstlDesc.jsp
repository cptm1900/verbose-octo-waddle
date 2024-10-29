<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 빈 공간에 ctrl + space 입력하면 나옴 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/jstlDesc.jsp</title>
</head>
<body>
<h4> JSTL (Jsp Standard Tag Library)</h4>
<pre>
	: 커스텀 태그(Back-end 모듈, java code로 변환됨)들 중 많이 활용되는 것들을 모아놓은 라이브러리
	&gt;prefix:tag-name attribute-name="attribute-value"%lt;
	
	1. jar 파일을 빌드패스에 추가
	2. 태그 라이브러리 로딩 필요
		: taglib 지시자 사용(uri="태그 종류 결정", prefix="커스텀 태그 접두어 결정")
	3. core(c) 태그 사용
		1) 데이터 핸들링 : set, remove
			<c:set var="attr" value="attr_value" scope="page" />	<%-- scope 생략하면 기본값 scope="page" --%>
			${attr}, ${pageScope.attr}
			<c:set var='attrClone' value='${attr}' />
			${attrClone}
			<c:remove var="attrClone" scope="page" />
			--> ${attrClone}
			
		2) 조건문
			- 단일 조건문 : if
			<c:if test="${3 lt 5}">
				3은 5보다 작다
			</c:if>
			<c:if test="${3 ge 5}">
				3은 5보다 크거나 같다
			</c:if>
			<c:set var="dummy" value="  " />
			<c:if test="${empty dummy}" >
				dummy 속성은 없다
			</c:if>
			<c:if test="${not empty dummy}" >	<%-- else가 없어서 not으로 대체해야됨 --%>
				dummy 속성은 있다 ($(dummy))
			</c:if>
			
			- 다중 조건문 : choose when otherwise
				<c:choose>
					<c:when test="${empty dummy}">
						dummy 속성은 없다
					</c:when>
					<c:otherwise>
						dummy 속성은 있다 ($(dummy))
					</c:otherwise>
				</c:choose>
				<a href="?sample1=value1&sample2=342">현재 페이지를 대상으로 쿼리 스트링 전달</a>
				<%=request.getParameter("sample1")%>, ${param.sample1}
				
		3) 반복문 : forEach, forTokens
			forEach
				for(선언절; 조건절; 증감절)
				<%-- var i=1; i<=10; i=i+1 (step은 무조건 1이상, 생략하면 1) --%>
				<c:forEach var="i" begin="1" step="1" end="10">
					<c:if test="${i % 2 eq 1}">
						${i}번째 반복
					</c:if>
				</c:forEach>
				for(선언절 : 집합객체)
				<%-- Arrays 같은 것들은 ${}로 쓰면 속성을 주는 거고 객체를 생성하는게 아님 --%>
				<c:set var="targetlist" value='<%=Arrays.asList("value1","value2")%>' />
				<c:forEach items="${targetlist}" var="element" varStatus="lts">
					${lts.first ? "시작" : ""}
					${element}, index : ${lts.index}, ${lts.count}	<%-- 위에서 lts라는 값을 element의 상태값으로 주었으니 거기에서 index를 뽑음 --%>
					${lts.last ? "종료" : ""}
				</c:forEach>
			
			forTokens
				<%-- delims에 구분할 문자 넣음 --%>
				<c:forTokens items="민재가 방에 들어간다" delims=" " var="token">
					${token}
				</c:forTokens>
				<c:forTokens items="100,200,300" delims="," var="num">
					${num * 10}
				</c:forTokens>
</pre>

<div>
<%--
		1. sample2 파라미터 있는지 확인
		: 없는 경우, "파라미터 없음" 출력
 --%>
 		<c:set var="sample2" value="${param.sample2}" />
 		
<%-- 		<c:if test="${empty param.sample2}"> --%>
<!-- 			파라미터 없음 -->
<%-- 		</c:if> --%>
		
		<c:if test="${empty sample2}">
			파라미터 없음
		</c:if>
<%--
	2. 짝/홀 수 여부를 확인하고,
		"342는 짝수임" 메세지 출력
 --%>
<%-- 		<c:if test="${not empty param.sample2}"> --%>
<%-- 			<c:if test="${param.sample2 % 2 eq 0}"> --%>
<%-- 				${param.sample2}는 짝수임 --%>
<%-- 			</c:if> --%>
<%-- 		</c:if> --%>

		<c:if test="${not empty sample2}">
			<c:choose>
				<c:when test="${sample2 % 2 eq 0}">
					${sample2}는 짝수임
				</c:when>
				<c:otherwise>
					${sample2}는 홀수임
				</c:otherwise>
			</c:choose>
		</c:if>
</div>

</body>
</html>