<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../public/sessionChk.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/myboard.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>


<section>
<div id="maincontent">
		<a id="title1" href="myPage.si" class="mymenu">| My Page</a> 
		<a id="category1" href="myBoard.si" class="mymenu">작성글보기</a>
		<a id="category2" href="myTicket.si" class="mymenu"><u>예약정보</u></a>
		<a id="category3" href="memberinfo.si" class="mymenu">회원정보</a>
		 <a id="title2">| 예약정보</a>
						
<a id="title4">| 티켓정보</a>
	<table id="ticketView">
	<tr>
	<td></td><td>티켓번호</td><td>영화제목</td><td>극장</td><td>상영날짜</td><td>상영시간</td><td>관</td><td>좌석</td>
	</tr>
	<tr id="ticketcontent">
	<td rowspan="2"><a href="movieInfo.mv?movieCode=${movie.movieCode }"><img alt="포스터" src="images/poster/${movie.poster }" width="120"></a></td><td>${ticketCode }</td><td>${movie.movieTitle }</td><td>${theater.theaterLoc}:${theater.theaterName}</td><td>${nowshowing.showingDay }</td><td>${screen.screenTime }</td><td>${screen.screenNum}</td><td><c:forEach var="val" items="${list }">${val.seats }&nbsp;</c:forEach> </td>
	</tr>
	<tr>
	<td colspan="7">
		<c:if test="${reservation.shCheck eq 'y' }">
			<c:if test="${reservation.rsCheck eq 'y' }">
				<c:if test="${reservation.rvCheck eq 'n' }">
					<a href="reviewWriteForm.re?movieCode=${movie.movieCode }&rsCode=${reservation.rsCode}" class="button">리뷰 남기기</a>
				</c:if>
				<c:if test="${reservation.rvCheck eq 'y' }">
					<a href="reviewMain.re?" class="button">리뷰 보러가기</a>
				</c:if>
			</c:if>
		</c:if>
	</td>
	<td>
		<img alt="로고" src="images/logo/T&R.png" height="50px" width="50px">
	</td>
	</tr>
	</table>
	<c:if test="${reservation.shCheck eq 'n' }">
	<div id="payinfo"><table id="payInfoTable"><tr><td>결제 정보 : </td><c:if test="${reservation.rsCheck eq 'n' }"><td>무통장 입금 농협:111-11111-1111</td><td> ${reservation.finalPrice }원</td></c:if><c:if test="${reservation.rsCheck eq 'y' }"> <td>결제 완료</td></c:if></tr></table></div>
	</c:if>
			

		</div>
	</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>