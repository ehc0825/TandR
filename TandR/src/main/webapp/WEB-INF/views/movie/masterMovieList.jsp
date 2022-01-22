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
<link href="css/movieList.css?update" rel="stylesheet" type="text/css">
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
<td align="center">&nbsp;&nbsp;무비코드</td><td align="center">영화제목</td><td align="center">&nbsp;&nbsp; 상영여부</td>
<td align="center">&nbsp;&nbsp; 개봉일</td><td align="center">&nbsp;&nbsp; 상영종료일</td>
</tr>
<tr>
<td colspan="4"><div id="space">&nbsp;</div></td>
</tr>
<c:forEach items="${list }" var="val">
<tr class="listM">
<td align="center">&nbsp;&nbsp;<a href="masterMovieInfo.mv?movieCode=${val.movieCode }">${val.movieCode }</a></td><td align="center">&nbsp;&nbsp; ${val.movieTitle }</td>
<c:if test="${val.movieTag == 1}">
<td align="center">&nbsp;&nbsp; 상영 종료</td>
</c:if>
<c:if test="${val.movieTag == 2}">
<td align="center">&nbsp;&nbsp; 상영중</td>
</c:if>
<c:if test="${val.movieTag == 3}">
<td align="center">&nbsp;&nbsp; 상영 예정</td>
</c:if>
<td align="center">&nbsp;&nbsp; ${val.releaseDate }</td><td align="center">&nbsp;&nbsp; ${val.cDate }</td>
</tr>
<tr>
<td colspan="4"><div id="space">&nbsp;</div></td>
</tr>

</c:forEach>
</table>
</div>

<div id="movieWritebtn">
	<button onclick="location.href='movieWriteForm.mv'">영화 등록</button>
</div>


</div>

<div id="numberbar">
 <c:if test="${startPage>PAGE_PER_BLOK}">
 	<button onclick="location.href='masterMovieList.mv?pageNum=${startPage-1}'">이전</button>
</c:if>
 <c:forEach var="i" begin="${startPage }" end="${endPage }">
<c:if test="${currentPage==i }">
 <button onclick="location.href='masterMovieList.mv?pageNum=${i}'" disabled="disabled">${i }</button> 
</c:if>
	
 <c:if test="${currentPage!=i }">
 <button onclick="location.href='masterMovieList.mv?pageNum=${i}'">${i }</button> 
</c:if>
 </c:forEach>
<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='masterMovieList.mv?pageNum=${currentPage + 1}'">
							다음
						</button>
					</c:if>
<c:if test="${endPage<totalPage }">
 		<button onclick="location.href='masterMovieList.mv?pageNum=${endPage+1}'">다음</button>
</c:if>
</div>
</div>
</section>
<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>