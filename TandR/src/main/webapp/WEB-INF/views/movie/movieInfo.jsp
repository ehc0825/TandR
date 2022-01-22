<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/movieInfo.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>


<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>

<section>
<div id="maincontent">
<a id="title1">| Movies</a>
<form action="">
      <c:if test="${movie.movieTag eq 1}">
      <a id="category1" href="movieClosed.mv" class="mymenu"><u>상영 종료</u></a>
      <a id="category2" href="movieNow.mv" class="mymenu">현재 상영중</a>
      <a id="category3" href="movieNotyet.mv" class="mymenu">상영 예정</a>
      </c:if>
      <c:if test="${movie.movieTag eq 2}">
      <a id="category1" href="movieClosed.mv" class="mymenu">상영 종료</u></a>
      <a id="category2" href="movieNow.mv" class="mymenu"><u>현재 상영중</u></a>
      <a id="category3" href="movieNotyet.mv" class="mymenu">상영 예정</a>
      </c:if>
      <c:if test="${movie.movieTag eq 3}">
      <a id="category1" href="movieClosed.mv" class="mymenu">상영 종료</a>
      <a id="category2" href="movieNow.mv" class="mymenu">현재 상영중</a>
      <a id="category3" href="movieNotyet.mv" class="mymenu"><u>상영 예정</u></a>
      </c:if>
    </form>
<a id="title2">| Movie Info</a>
<div id="movieNowBox">
<div id="movieList" style="top:20px; font-size:100%">
<a href="#"><img alt="포스터" src="images/poster/${movie.poster }" width="360"></a>
<table class="movieTable2">
<tbody>
<tr>
<td width="900px"><b>제목: </b>${movie.movieTitle }</td>
</tr>
<tr>
<td><b>장르: </b>${movie.movieGenre }</td>
</tr>
<tr>
<td><b>감독: </b> ${movie.director }</td>
</tr>
<tr>
<td><b>등급: </b> ${movie.movieGrade }</td>
</tr>
<tr>
<td><b>평점: </b> ${movie.movieStar }점
<c:if test="${movie.movieStar == 1}">
			⭐
			</c:if>
			<c:if test="${movie.movieStar == 2}">
			⭐⭐
			</c:if>
			<c:if test="${movie.movieStar == 3}">
			⭐⭐⭐
			</c:if>
			<c:if test="${movie.movieStar == 4}">
			⭐⭐⭐⭐
			</c:if>
			<c:if test="${movie.movieStar == 5}">
			⭐⭐⭐⭐⭐
			</c:if>
</td>
</tr>
<tr>
<td><b>주연 배우: </b> ${movie.actor }</td>
</tr>
<tr>
<td><b>상영시간: </b> ${movie.runningTime }분</td>
</tr>
<tr>
<td><b>개봉일: </b> ${movie.releaseDate }</td>
</tr>
<tr>
<td><b>상영종료일: </b> ${movie.cDate }</td>
</tr>
<tr>
<td><b>영화 정보: </b></td>
</tr>
<tr>
<td>${movie.movieInfo }</td>
</tr>
<tr>
<td><b>줄거리: </b></td> 
</tr>
<tr>
<td><pre id="textarea">${movie.movieContent }</pre></td>
</tr>
<tr height="50px"></tr>
<tr>
	<c:if test="${movie.movieTag eq 1}">
    <td><a href="searchRvmainlist.re?whereRv=movieTitle&rvsearch=${movie.movieTitle }" style="width:300px; text-align:center" class="button2"><b>Review</b></a></td>
    </c:if>
    <c:if test="${movie.movieTag eq 2}">
    <td><a href="ticketing2.mv?movieCode=${movie.movieCode }" style="width:300px; text-align:center" class="button2"><b>예매하기</b></a>
    <a href="searchRvmainlist.re?whereRv=movieTitle&rvsearch=${movie.movieTitle }" style="width:300px; text-align:center" class="button2"><b>Review</b></a></td>
    </c:if>
</tr>
</tbody>
</table>
</div>

</div>
</div>
</section>




<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>

</body>
</html>