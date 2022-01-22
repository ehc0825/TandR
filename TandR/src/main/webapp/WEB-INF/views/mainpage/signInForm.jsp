<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/signinForm.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
<section>
<div id="maincontent">
<a id="title1">| Sign In</a>
<div id="signInBox"> 
<form action="signIn.si" method="post">
<a href="main.do" id="logo"><img alt="로고" src="images/logo/T&R.png" height="120" width="120"></a>
<div id="idText">👤</div><input type="text" name="id" id="id" required="required" autofocus="autofocus" placeholder="ID">
<div id="passwordText">🔒</div><input type="password" name="password" id="password" required="required" placeholder="PASSWORD">
<a id="searchPassword" href="searchPasswordForm.si">forgot password?</a>
<input type="submit" value="Sign In" id="loginbutton" style="cursor:pointer;">
<a id="signUp" href="signUpForm.si">Sign Up</a>

</form>
</div>
</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>