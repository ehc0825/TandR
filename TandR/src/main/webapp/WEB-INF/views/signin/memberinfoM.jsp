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
<div id="infotitle">| 회원정보</div>
<div id="memberinfo">
<table>
<tr>
<td>ID:</td><td><input type="text" value="${member.id }" readonly="readonly" class="info"></td>
</tr>
<tr>
<td>NAME:</td><td><input type="text" value="${member.name }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>ADDRESS:</td><td><input type="text" value="${member.address }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>메일주소:</td><td><input type="text" value="${member.mailaddress }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>등급점수:</td><td><input type="text" value="${member.score }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>가입일:</td><td><input type="text" value="${member.score }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>작성글수:</td><td><input type="text" value="${member.textcount }" readonly="readonly"  class="info"></td>
</tr>
<tr>
<td>예매수:</td><td><input type="text" value="${member.ticketcount }" readonly="readonly" class="info"></td>
</tr>
<tr>
<td>탈퇴여부:</td><td><input type="text" value="${member.memberDel }" readonly="readonly" class="info"></td>
</tr>
</table>
<div id="goback" class="action"><a href="javascript:window.history.back();">뒤로가기</a></div>
<c:if test="${member.memberDel eq 'n' }">
<div id="activecheck" ><a href="memberdel.si?del=y&id=${member.id }&email=${member.mailaddress }&mailtext=중지" >활동중지</a></div>
</c:if>
<c:if test="${member.memberDel eq 'y' }">
<div id="activecheck" ><a href="memberdel.si?del=n&id=${member.id }&email=${member.mailaddress }&mailtext=재승인" >활동승인</a></div>
</c:if>
</div>
</div>

</div>
</section>
<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>