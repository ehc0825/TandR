<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/main.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>

<header><jsp:include page="../public/topmenu.jsp"></jsp:include></header>


<script type="text/javascript">
	alert("이미 좋아요를 누르셨습니다.");
	location.href = "reviewView.re?rvNum=${rvNum}";
</script>


<footer><jsp:include page="../public/bottom.jsp"></jsp:include></footer>
</body>
</html>