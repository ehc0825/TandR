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
<c:if test="${result>0 }">
<script type="text/javascript">
alert("회원가입을 축하합니다");
location.href="signInForm.do";
</script>
</c:if>
<c:if test="${result==0 }">
<script type="text/javascript">
alert("회원가입을 실패했습니다");
history.go(-1);
</script>
</c:if>
<c:if test="${result==-1 }">
<script type="text/javascript">
alert("중복된아이디입니다");
history.go(-1);
</script>
</c:if>
</body>
</html>