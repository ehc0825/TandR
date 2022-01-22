<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/movie.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>


<section>
<div id="maincontent">
<a id="title1">| Movies</a>
<form action="">
      <a id="category1" class="mymenu" href="movieClosed.mv">상영 종료</a>
      <a id="category2" class="mymenu" href="movieNow.mv">현재 상영중</a>
      <a id="category3" class="mymenu" href="movieNotyet.mv"><u>상영 예정</u></a>
    </form>
<a id="title2">| 상영 예정</a>
<div id="movieNowBox">
<br>
<c:forEach items="${list }" var="val">
<div id="movieList${val }">
<%-- <a href="#"><img alt="포스터" src="images/poster/${val.poster }" width="240"></a>
<br>
${val.movieTitle }
<br>
평점: ${val.movieStar }점
<br>
${val.releaseDate } 개봉 --%>
<table class="movieTable">
<tbody>
<tr>
<td rowspan="7" width="280px"><a href="movieInfo.mv?movieCode=${val.movieCode }"><img alt="포스터" src="images/poster/${val.poster }" width="240"></a></td>
<td width="420px">제목: ${val.movieTitle }</td>
</tr>
<tr>
<td>개봉일: ${val.releaseDate }</td>
</tr>
<tr>
<td>감독: ${val.director }</td>
</tr>
<tr>
<td>평점: ${val.movieStar }점
<c:if test="${val.movieStar == 1}">
			⭐
			</c:if>
			<c:if test="${val.movieStar == 2}">
			⭐⭐
			</c:if>
			<c:if test="${val.movieStar == 3}">
			⭐⭐⭐
			</c:if>
			<c:if test="${val.movieStar == 4}">
			⭐⭐⭐⭐
			</c:if>
			<c:if test="${val.movieStar == 5}">
			⭐⭐⭐⭐⭐
			</c:if>
</td>
</tr>
<tr>
<td>주연: ${val.actor }</td>
</tr>
<tr>
<td>상영시간: ${val.runningTime }분</td>
</tr>
<tr>
</tr>
<tr><br><br></tr>
</tbody>
</table>
</div>
</c:forEach>

<br>
<div align="center">
<c:if test="${empty list }">
${"등록된 영화가 존재하지 않습니다" }<br>
</c:if>
<c:if test="${startPage>PAGE_PER_BLOK}">
 	<button onclick="location.href='movieNotyet.mv?pageNum=${startPage-1}'">이전</button>
</c:if>
 <c:forEach var="i" begin="${startPage }" end="${endPage }">
<c:if test="${currentPage==i }">
 <button onclick="location.href='movieNotyet.mv?pageNum=${i}'" disabled="disabled">${i }</button> 
</c:if>
	
 <c:if test="${currentPage!=i }">
 <button onclick="location.href='movieNotyet.mv?pageNum=${i}'">${i }</button> 
</c:if>
 </c:forEach>
<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='movieNotyet.mv?pageNum=${currentPage + 1}'">
							다음
						</button>
					</c:if>
<c:if test="${endPage<totalPage }">
 
 		<button onclick="location.href='movieNotyet.mv?pageNum=${endPage+1}'">다음</button>
</c:if>
</div>
</div>
</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>