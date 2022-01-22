<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../public/sessionChk.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/mymain.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>


<section>
<div id="maincontent">
		<a id="title1" href="myPage.si" class="mymenu">| My Page</a> 
		<a id="category1" href="myBoard.si" class="mymenu">작성글보기</a>
		<a id="category2" href="myTicket.si" class="mymenu"> 예약정보</a>
		<a id="category3" href="memberinfo.si" class="mymenu">회원정보</a>
		 <a id="title2">| Main</a>
			<div id="signInBox"> 
			<a href="main.do" id="logoi"><img alt="로고" src="images/logo/T&R.png" height="120" width="120"></a>
			<div id="idText">ID</div><input type="text" id="id" readonly="readonly" value="${member.id }" >
			<div id="passwordText">작성글수</div><input type="text" readonly="readonly" id="password1" value="${member.textcount }">
			<div id="passwordText2">Ticket</div><input type="text" id="password2" readonly="readonly" value="${member.ticketcount }">
			<div id="nameText">회원점수</div><input type="text" name="name" id="name" readonly="readonly" value="${member.score } 🅿️">
			<c:if test="${member.score >= 0&&member.score <= 20}">
			<div id="addressText">회원등급</div><input type="text" name="addressnow" id="addressnow" readonly="readonly" value="🥉">
			</c:if>
			<c:if test="${member.score >= 21&&member.score <= 40 }">
			<div id="addressText">회원등급</div><input type="text" name="addressnow" id="addressnow" readonly="readonly" value="🥈">
			</c:if>
			<c:if test="${member.score >= 41&&member.score <= 60 }">
			<div id="addressText">회원등급</div><input type="text" name="addressnow" id="addressnow" readonly="readonly" value="🥇">
			</c:if>
			<c:if test="${member.score >= 61&&member.score <= 81}">
			<div id="addressText">회원등급</div><input type="text" name="addressnow" id="addressnow" readonly="readonly" value="💎">
			</c:if>
			<c:if test="${member.score >= 81}">
			<div id="addressText">회원등급</div><input type="text" name="addressnow" id="addressnow" readonly="readonly" value="👑">
			</c:if>
			<a href="help.do" id="help">about This</a>
			
		</div>
		</div>
	</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>