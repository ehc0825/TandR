<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="id" value="${sessionScope.id }"></c:set>
<c:if test="${empty id }">
<script type="text/javascript">
alert("로그인 후 이용하실 수 있는 서비스 입니다");
location.href="signInForm.do"
</script>
</c:if>
</body>
</html>