<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../public/sessionChk.jsp" %>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/eventlist.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
<section>
<div id="maincontent">
<a href="main.do"><img alt="로고" src="images/logo/T&R.png" height="30px" width="30px" id="logo"></a><a id="title1" href="masterpage.do">| T & R 관리페이지</a>
<div id="sidemenu"><jsp:include page="../public/sidemenu.jsp"></jsp:include> </div>
<div id="contentBox">
<div id="mcount">총:&nbsp;&nbsp;${total } 개</div>
<div id="memberlist">
<table id="resulttable">
<tr>
<td align="center">&nbsp;&nbsp;이벤트번호</td><td align="center">이벤트명</td><td align="center">&nbsp;&nbsp; 등록일</td>
<td align="center">&nbsp;&nbsp; 조회수</td><td align="center">&nbsp;&nbsp; 종료여부</td>
</tr>
<tr>
<td colspan="4"><div id="space">&nbsp;</div></td>
</tr>
<c:forEach items="${list }" var="event">
<tr class="listM">
<td align="center">&nbsp;&nbsp;<a href="eventView.ev?eventNum=${event.eventNum }">${event.eventNum }</a></td><td align="center">&nbsp;&nbsp; ${event.eventTitle }</td>
<td align="center">&nbsp;&nbsp; ${event.eventDate}</td><td align="center">&nbsp;&nbsp; ${event.eventReadCount}</td><td align="center">&nbsp;&nbsp; ${event.eventClose}</td>
</tr>
<tr>
<td colspan="4"><div id="space">&nbsp;</div></td>
</tr>

</c:forEach>
</table>
</div>
<div id="resultbox">
<c:if test="${empty list }">
${"등록된 이벤트가 없습니다." }<br>
</c:if>
</div>
<!-- 이벤트 등록 버튼 검색기능 대신 넣기 -->
<div id="eventWritebtn">
	<button onclick="location.href='eventWriteForm.ev'">이벤트 등록</button>
</div>

<div id="numberbar">
 <c:if test="${startPage>PAGE_PER_BLOK}">
 	<button onclick="location.href='eventList.ev?pageNum=${startPage-1}'">이전</button>
</c:if>
 <c:forEach var="i" begin="${startPage }" end="${endPage }">
<c:if test="${currentPage==i }">
 <button onclick="location.href='eventList.ev?pageNum=${i}'" disabled="disabled">${i }</button> 
</c:if>
	
 <c:if test="${currentPage!=i }">
 <button onclick="location.href='eventList.ev?pageNum=${i}'">${i }</button> 
</c:if>
 </c:forEach>
<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='eventList.ev?pageNum=${currentPage + 1}'">
							다음
						</button>
					</c:if>
<c:if test="${endPage<totalPage }">
 		<button onclick="location.href='eventList.ev?pageNum=${endPage+1}'">다음</button>
</c:if>
</div>
</div>
</div>
</section>
<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>