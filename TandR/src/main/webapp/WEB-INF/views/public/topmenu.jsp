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
<a href="main.do"><img alt="ëĄęł " src="images/logo/T&R.png" height="50px" width="50px" id="logo"></a><form action="result.do"><input type="text" name="search" id="search" value="${result }"><input type="submit" value="đ" id="search2" style="cursor:pointer;"></form>
<div id="menu">
    <ul class="main1">
        <li><a href="ticketing.mv">&nbsp;&nbsp;&nbsp;Ticketing&nbsp;&nbsp;&nbsp;</a>
        </li>
        <li><a href="#">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Movies&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a>
            <ul class="main2">
                <li><a href="movieClosed.mv">ěěě˘ëŁ</a>
                </li>
                <li><a href="movieNow.mv">íěŹěěě</a>
                </li>
                <li><a href="movieNotyet.mv">ěěěě </a>
                </li>
            </ul>
        </li>
        <li><a href="#">&nbsp;&nbsp;&nbsp;Forum&nbsp;&nbsp;&nbsp;</a>
            <ul class="main2">
                <li><a href="fboardMain.fb">ěě ę˛ěí</a></li>
                <li><a href="reviewMain.re">ëŚŹëˇ°ę˛ěí</a></li>
                <li><a href="eventMain.ev">ě´ë˛¤í¸</a>

                </li>
            </ul>
        </li>
        </ul>
</div>
<a id="middlebar">|</a>



<c:if test="${not empty id }"><div id="menu2">
    <ul class="main1">
        <li><a>đ¤"${id}"ë</a>
            <ul class="main2">
                <li><a href="myPage.si">ë§ě´íě´ě§</a>
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
        <li><a>â ę´ëŚŹě ë</a>
            <ul class="main2">
            <li><a href="masterpage.do">T&Rę´ëŚŹ</a>
                </li>
                <li><a href="myPage.si">ë§ě´íě´ě§</a>
                </li>
                <li><a href="logout.si">logout</a>
                </li>
            </ul>
        </li>
        </ul>
        </div></c:if>

</body>
</html>