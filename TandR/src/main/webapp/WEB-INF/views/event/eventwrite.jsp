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
<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>
<c:if test="${result > 0 }">
<script type="text/javascript">
	alert("이벤트 등록 완료");
	location.href = "eventList.ev";
</script>
</c:if>
<c:if test="${result == 0 }">
<script type="text/javascript">
	alert("이벤트 등록 실패, 다시 시도해 주세요");
	history.back();
</script>
</c:if>


<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>