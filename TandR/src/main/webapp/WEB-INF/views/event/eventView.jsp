<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/eventView.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function closeEvent() {
	var con = confirm("이벤트를 종료하시겠습니까?");
	if(con) {
		location.href="eventClose.ev?eventNum=${event.eventNum}";
	}
}
</script>
</head>
<body>
<wrap>
<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>

<section>
<div id="maincontent">
    <div class="container_top">
      <a class="title1" href="fboardMain.fb?fbNum=${fboard.fbNum}&pageNum=${pageNum }">| Event</a>
      <a class="title2">| ${event.eventTitle}</a>
      <div id="viewbtn">
					
			<c:if test="${id == event.id}">
					<button
						onclick="location.href='eventUpdateForm.ev?eventNum=${event.eventNum}'">수정</button>
					<button onclick="closeEvent()">종료</button>
					<button onclick="location.href='eventList.ev'">목록</button>
			</c:if>
			<c:if test="${id != event.id}">
            <button onclick="location.href='eventMain.ev'">목록</button>
            </c:if>
	  </div>
      
      <div id="writerInfo">|&nbsp;작성자 ${event.id } |&nbsp;
      		회원등급 <c:if test="${member.score >= 0&&member.score <= 20}">
			🥉
			</c:if>
			<c:if test="${member.score >= 21&&member.score <= 40 }">
			🥈
			</c:if>
			<c:if test="${member.score >= 41&&member.score <= 60 }">
			🥇
			</c:if>
			<c:if test="${member.score >= 61&&member.score <= 81}">
			💎
			</c:if>
			<c:if test="${member.score >= 81}">
			👑
			</c:if>
      		|&nbsp;${event.eventDate } |&nbsp;조회 ${event.eventReadCount } </div>
    </div>
    <article class="main_content">
    <c:if test="${event.photo != null }">
      <img alt="photo" src="images/event/${event.photo }">
    </c:if>
	  <br>
      <div class="content">
         ${event.eventContent }
      </div>
    </article>
</div>
</section>

 
<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</wrap>
</body>
</html>