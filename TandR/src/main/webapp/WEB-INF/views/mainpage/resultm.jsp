<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/resultm.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp?result=${result }"></jsp:include></div></header>

<br>

<section>
<div id="maincontent">
<a id="title1">| Search Result</a>
<br>
<a id="title2">| Movie</a>
<div id="searchResult1"> 

<br>
<c:forEach items="${list1 }" var="val">
<div id="movieList">
<table class="movieTable">
<tbody>
<tr>
<td rowspan="7" width="300px"><a href="movieInfo.mv?movieCode=${val.movieCode }"><img alt="포스터" src="images/poster/${val.poster }" width="240"></a></td>
<td>제목: ${val.movieTitle }</td>
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
<c:if test="${val.movieTag eq 1 }">
<td></td>
<td width="70px"><a href="#" class="button">Review</a></td>
</c:if>
<c:if test="${val.movieTag eq 2 }">
<td align="center"><a href="ticketing2.mv?movieCode=${val.movieCode }" class="button">예매하기</a></td>
<td width="70px"><a href="searchRvmainlist.re?whereRv=movieTitle&rvsearch=${result }" class="button">Review</a></td>
</c:if>
<c:if test="${val.movieTag eq 3 }">
<td></td>
<td></td>
</c:if>
</tr>
</tbody>
</table>
</div>
</c:forEach>

</div>
</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>