<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../public/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/sidemenu.css?update" rel="stylesheet" type="text/css">
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
</head>
<body>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="masterMovieList.mv">영화관리</a>
  <a href="memberlist.si">회원관리</a>
  <a href="masterFboard.fb">게시글관리</a>
  <a href="eventList.ev">이벤트관리</a>
  <a href="reservationList.mv">예약관리</a>
  <a href="nowShowingList.mv">상영관리</a>
</div>



<p style="color:yellow; left:10px; font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</p>
</body>
</html>