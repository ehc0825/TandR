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
						
<a id="title4">| 예약 내역</a>
<div id="maincontent4">

<table class="boardtable">
				<thead>
					<tr>
						<th>티켓번호</th>
						<th width="40%">타이틀</th>
						<th>가격</th>
						<th>결제여부</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list1 }">
						<tr>
							<th colspan="5">예약내역이 없습니다.</th>
						</tr>
					</c:if>
					<c:if test="${not empty list1 }">
						<c:forEach var="val1" items="${list1 }">
							<tr>
								<td>${val1.ticketCode }</td>
						
						
									<td class="title">
										<!-- 답변글은 들여쓰기를 해야하므로 level이 0보다 크다 --> 
										<a href="myTicketView.si?ticketCode=${val1.ticketCode}&movieTitle=${val1.movieTitle }&nsCode=${val1.nsCode }">${val1.movieTitle }</a>
									</td>
									<td>${val1.finalPrice }</td>
									<td>${val1.rsCheck }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
				<div id="pagebar1" align="center">
					<c:if test="${startPage1 > PAGE_PER_BLOCK1 }">
						<button
							onclick="location.href='myTicket.si?pageNum1=${startPage1-1}&currentPage1=${currentPage1}'">이전</button>
					</c:if>
					<c:forEach var="i" begin="${startPage1}" end="${endPage1}">
						<c:if test="${currentPage1== i }">
							<button onclick="location.href='myTicket.si?pageNum1=${i}&currentPage1=${currentPage1}'"
								disabled="disabled">${i}</button>
						</c:if>
						<c:if test="${currentPage1!= i }">
							<button onclick="location.href='myTicket.si?pageNum1=${i}&currentPage1=${currentPage1}'">${i}</button>
						</c:if>
					</c:forEach>
					<!-- 보여줄 것이 남아있다 -->
					<c:if test="${endPage1 < totalPage1 }">
						<button
							onclick="location.href='myTicket.si?pageNum1=${endPage1+1}&currentPage1=${currentPage1}'">다음</button>
					</c:if>
				</div>

</div>
			
<a id="title5">| 이전 내역</a>
<div id="maincontent5">

<table class="boardtable">
				<thead>
					<tr>
						<th>티켓번호</th>
						<th width="40%">타이틀</th>
						<th>가격</th>
						<th>결제여부</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list2 }">
						<tr>
							<th colspan="4">지난 예약내역이 없습니다.</th>
						</tr>
					</c:if>
					<c:if test="${not empty list2 }">
						<c:forEach var="val2" items="${list2 }">
							<tr>
								<td>${val2.ticketCode }</td>
									<td class="title">
										<!-- 답변글은 들여쓰기를 해야하므로 level이 0보다 크다 --> 
												<a href="myTicketView.si?ticketCode=${val2.ticketCode }&movieTitle=${val2.movieTitle }&nsCode=${val2.nsCode }">${val2.movieTitle }</a>
									</td>
									<td>${val2.finalPrice }</td>
									<td>${val2.rsCheck }</td>			
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
				<div id="pagebar2" align="center">
					<c:if test="${startPage2 > PAGE_PER_BLOCK2 }">
						<button
							onclick="location.href='myTicket.si?pageNum=${startPage2-1}&currentPage2=${currentPage2}'">이전</button>
					</c:if>
					<c:forEach var="i" begin="${startPage2}" end="${endPage2}">
						<c:if test="${currentPage2== i }">
							<button onclick="location.href='myTicket.si?pageNum2=${i}&currentPage2=${currentPage2}'"
								disabled="disabled">${i}</button>
						</c:if>
						<c:if test="${currentPage2!= i }">
							<button onclick="location.href='myTicket.si?pageNum2=${i}&currentPage2=${currentPage2}'">${i}</button>
						</c:if>
					</c:forEach>
					<!-- 보여줄 것이 남아있다 -->
					<c:if test="${endPage2 < totalPage2 }">
						<button
							onclick="location.href='myTicket.si?pageNum2=${endPage2+1}&currentPage2=${currentPage2}'">다음</button>
					</c:if>
				</div>

</div>
			

		</div>
	</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>