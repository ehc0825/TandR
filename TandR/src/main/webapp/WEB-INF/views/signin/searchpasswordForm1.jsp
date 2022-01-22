<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/FindPassword.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
<section>
<div id="maincontent">
<a id="title1">| Find Password</a>
<div id="signInBox"> 
<form action="findpassword.si" method="post">
<a href="main.do" id="logo"><img alt="로고" src="images/logo/T&R.png" height="120" width="120"></a>
<div id="idText">ID</div>
<input type="text" name="id" id="id" required="required">
<div id="mailaddressText">Mail</div>
<input type="text" name="email" id="mailaddress" required="required">
<input type="submit" value="FindPassword" id="signupbutton" style="cursor:pointer;">
</form>
<a href="signInForm.do" id="loginpage">로그인페이지로</a>
</div>
</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>