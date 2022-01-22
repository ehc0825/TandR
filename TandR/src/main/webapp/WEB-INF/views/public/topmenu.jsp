<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function init() {
	cont = document.getElementById("search");
	cont.addEventListener("keyup", function(event) {
		var keycode  = event.keyCode?event.keyCode:event.which;	
		if (keycode == 13) webstart();
		event.stopPropagation();  
	});
}
</script>
<link href="css/topmenu.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body bgcolor="#4F5050">
<a href="main.do"><img alt="로고" src="images/logo/T&R.png" height="50px" width="50px" id="logo"></a><form action="result.do"><input type="text" name="search" id="search" value="${result }"><input type="submit" value="🔍" id="search2" style="cursor:pointer;"></form>
<div id="menu">
    <ul class="main1">
        <li><a href="ticketing.mv">&nbsp;&nbsp;&nbsp;Ticketing&nbsp;&nbsp;&nbsp;</a>
        </li>
        <li><a href="#">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Movies&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a>
            <ul class="main2">
                <li><a href="movieClosed.mv">상영종료</a>
                </li>
                <li><a href="movieNow.mv">현재상영작</a>
                </li>
                <li><a href="movieNotyet.mv">상영예정</a>
                </li>
            </ul>
        </li>
        <li><a href="#">&nbsp;&nbsp;&nbsp;Forum&nbsp;&nbsp;&nbsp;</a>
            <ul class="main2">
                <li><a href="fboardMain.fb">자유게시판</a></li>
                <li><a href="reviewMain.re">리뷰게시판</a></li>
                <li><a href="eventMain.ev">이벤트</a>

                </li>
            </ul>
        </li>
        </ul>
</div>
<a id="middlebar">|</a>



<c:if test="${not empty id }"><div id="menu2">
    <ul class="main1">
        <li><a>👤"${id}"님</a>
            <ul class="main2">
                <li><a href="myPage.si">마이페이지</a>
                </li>
                <li><a href="logout.si">logout</a>
                </li>
            </ul>
        </li>
        </ul>
        </div></c:if>
<c:if test="${empty id }"><a href="signInForm.do" id="Signin">Sign in</a></c:if>

<c:if test="${id eq 'master' }"><div id="menu2">
    <ul class="main1">
        <li><a>Ⓜ 관리자 님</a>
            <ul class="main2">
            <li><a href="masterpage.do">T&R관리</a>
                </li>
                <li><a href="myPage.si">마이페이지</a>
                </li>
                <li><a href="logout.si">logout</a>
                </li>
            </ul>
        </li>
        </ul>
        </div></c:if>

</body>
</html>