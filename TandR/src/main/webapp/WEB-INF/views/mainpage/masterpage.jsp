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
<link href="css/masterpage.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
<section>
<div id="maincontent">
<a href="main.do"><img alt="로고" src="images/logo/T&R.png" height="30px" width="30px" id="logo"></a><a id="title1" href="masterpage.do">| T & R 관리페이지</a>
<div id="sidemenu"><jsp:include page="../public/sidemenu.jsp"></jsp:include> </div>
<div id="contentBox">
<div id="mcount">총:&nbsp;&nbsp;${total }개의 검색어</div>
<div id="memberlist">
<table id="resulttable">
<tr>
<td align="center">&nbsp;&nbsp;검색순위</td><td align="center">검색어</td><td align="center">&nbsp;&nbsp; 검색량</td>
</tr>
<tr>
<td colspan="5"><div id="space">&nbsp;</div></td>
</tr>
<c:set var="i1" value="${startRow-1 }"></c:set>
<c:forEach items="${list }" var="val">
<c:set var="i1" value="${i1+1 }"></c:set>
<tr class="listM">
<td align="center">&nbsp;&nbsp;${i1 }</td><td align="center">&nbsp;&nbsp; ${val.search }</td><td align="center">&nbsp;&nbsp; ${val.searchCt }</td>
</tr>
<tr>
<td colspan="5"><div id="space">&nbsp;</div></td>
</tr>

</c:forEach>
</table>
</div>
<div id="resultbox">
<c:if test="${empty list }">
${"현재 사이트에 검색이 없습니다" }<br>
</c:if>
</div>
</div>
<div id="numberbar">
 <c:if test="${startPage>PAGE_PER_BLOK}">
 	<button onclick="location.href='masterpage.do?pageNum=${startPage-1}'">이전</button>
</c:if>
 <c:forEach var="i" begin="${startPage }" end="${endPage }">
<c:if test="${currentPage==i }">
 <button onclick="location.href='masterpage.do?pageNum=${i}'" disabled="disabled">${i }</button> 
</c:if>
	
 <c:if test="${currentPage!=i }">
 <button onclick="location.href='masterpage.do?pageNum=${i}'">${i }</button> 
</c:if>
 </c:forEach>
<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='masterpage.do?pageNum=${currentPage + 1}'">
							다음
						</button>
					</c:if>
<c:if test="${endPage<totalPage }">
 
 		<button onclick="location.href='masterpage.do?pageNum=${endPage+1}'">다음</button>
</c:if>
</div>

</div>
</section>
<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>