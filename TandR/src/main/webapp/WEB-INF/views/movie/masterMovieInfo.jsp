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
<link href="css/memberlinfoM.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
<section>
<div id="maincontent">
<a href="main.do"><img alt="로고" src="images/logo/T&R.png" height="30px" width="30px" id="logo"></a><a id="title1" href="masterpage.do">| T & R 관리페이지</a>
<div id="sidemenu"><jsp:include page="../public/sidemenu.jsp"></jsp:include> </div>
<div id="contentBox">
<div id="infotitle">| 영화정보</div>
<div id="memberinfo">
<table>
<tr>
<td>무비 코드:</td><td><input type="text" value="${movie.movieCode }" readonly="readonly" class="info"></td>
</tr>
<tr>
<td>영화 제목:</td><td><input type="text" value="${movie.movieTitle }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>무비 태그:</td><td><input type="text" value="${movie.movieTag }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>개봉일:</td><td><input type="text" value="${movie.releaseDate }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>상영 종료일:</td><td><input type="text" value="${movie.cDate }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>영화 등급:</td><td><input type="text" value="${movie.movieGrade }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>평점:</td><td><input type="text" value="${movie.movieStar }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>장르:</td><td><input type="text" value="${movie.movieGenre }" readonly="readonly" class="info"></td>
</tr>
<tr>
<td>가격:</td><td><input type="text" value="${movie.moviePrice }" readonly="readonly" class="info"></td>
</tr>
</table>
<div id="goback" class="action"><a href="javascript:window.history.back();">뒤로가기</a></div>
<c:if test="${movie.movieTag == 2 }">
<div id="activecheck" ><a href="movieUpdate.mv?movieCode=${movie.movieCode }&movieTag=${movie.movieTag }" >상영종료</a></div>
</c:if>
<c:if test="${movie.movieTag == 3 }">
<div id="activecheck" ><a href="movieUpdate.mv?movieCode=${movie.movieCode }&movieTag=${movie.movieTag }" >상영시작</a></div>
</c:if>
</div>
</div>

</div>
</section>
<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>