<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    if (confirm("임시 저장 글이 있습니다 불러오시겠습니까? 확인(예) 또는 취소(아니오)를 선택해주세요.")) {
    	location.href='fboardWriteForm.fb?sbNum=${saveboard.sbNum}&fbNum=0&pageNum=${currentPage}'
    } else {
        location.href='fboardWriteForm.fb?fbNum=0&pageNum=${currentPage}'
    }
</script>
</head>
<body>

</body>
</html>