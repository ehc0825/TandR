<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@include file="../public/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/ticket.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">

</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>

<section>
<div id="maincontent">
<a id="title1">| Ticketing</a>
<a id="title2">| 예약이 완료되었습니다</a>
<div id="movieNowBox">

<p>예약 내역</p>


<p>티켓 번호: ${ticketCode }</p>
<p>영화 이름: ${movieTitle }</p>
<p>극장 위치: ${theaterLoc }  ${theaterName }</p>
<p>날짜 : ${showingDay }</p>
<p>상영관: ${screenNum }관</p> 
<p>상영 시간: ${screenTime }</p>
<c:if test="${age == 1}">
<p>인원: 어린이 ${people }명</p>
</c:if>
<c:if test="${age == 2}">
<p>인원: 청소년 ${people }명</p>
</c:if>
<c:if test="${age == 3}">
<p>인원: 성인 ${people }명</p>
</c:if>
<p>예약 ID: ${id }</p>
<p>결제 총 가격: ${finalPrice }원</p>

<br>
<button style="width:330px; text-align:center; background-color:black;" class="button" onclick="location.href='main.do'" ><b>메인으로 가기</b></button>
<br><br>
<button style="width:330px; text-align:center; background-color:black;" class="button" onclick="location.href='myTicketView.si?ticketCode=${ticketCode }&movieTitle=${movieTitle }&nsCode=${nsCode }'" ><b>예매 확인으로 가기</b></button>



</div>
</div>
</section>
            


<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>

</body>
</html>