<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/board.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
<style type="text/css">
td:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>

<section>
<div id="maincontent">
		<a id="title1">| Forum</a> 
		<a id="category1" href="reviewMain.re" class="mymenu">Review</a>
		<a id="category2" href="fboardMain.fb" class="mymenu">자유게시판</a>
		<a id="category3" href="eventMain.ev" class="mymenu"><u>Event</u></a>
		<a id="title2">| Event</a>
	<div id="main_container">
			<table style="text-align=center;" border="0" id="main_table">
				<thead>
					<tr>
						<th>이벤트 번호</th>
						<th>이벤트명 </th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<th colspan="4">게시글이 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach var="event" items="${list }">
							<tr>
								<td>${event.eventNum }</td>
								<c:if test="${event.eventClose == 'y' }">
									<th colspan="4" class="line">종료된 이벤트 입니다</th>
								</c:if>
								<c:if test="${event.eventClose != 'y' }">
									<td>
										<a href="eventView.ev?eventNum=${event.eventNum }&pageNum=${currentPage}">${event.eventTitle }</a>
									</td>
									<td>${event.id }</td>
									<td>${event.eventDate }</td>
									<td>${event.eventReadCount }</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>‍<br>
			<br>
			<div id="pagebar" align="center">
				<c:if test="${startPage > PAGE_PER_BLOCK }">
					<button onclick="location.href='eventMain.ev?pageNum=${startPage-1}'">이전</button>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage== i }">
						<button onclick="location.href='eventMain.ev?pageNum=${i}'" disabled="disabled">${i}</button>
					</c:if>
					<c:if test="${currentPage!= i }">
						<button onclick="location.href='eventMain.ev?pageNum=${i}'">${i}</button>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있다 -->
				<c:if test="${endPage < totalPage }">
					<button onclick="location.href='eventMain.ev?pageNum=${endPage+1}'">다음</button>
				</c:if>
			<!-- num=0 처음 쓴글 -->
		</div>
		</div>
		
	</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>