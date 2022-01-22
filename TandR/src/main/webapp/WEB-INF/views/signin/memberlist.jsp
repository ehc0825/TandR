<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../public/sessionChk.jsp" %>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/memberlist.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
<section>
<div id="maincontent">
<a href="main.do"><img alt="로고" src="images/logo/T&R.png" height="30px" width="30px" id="logo"></a><a id="title1" href="masterpage.do">| T & R 관리페이지</a>
<div id="sidemenu"><jsp:include page="../public/sidemenu.jsp"></jsp:include> </div>
<div id="contentBox">
<div id="mcount">총:&nbsp;&nbsp;${total } 명</div>
<div id="memberlist">
<table id="resulttable">
<tr>
<td align="center">&nbsp;&nbsp;ID</td><td align="center">이름</td><td align="center">&nbsp;&nbsp; 메일주소</td><td align="center">&nbsp;&nbsp; 가입일</td><td align="center">&nbsp;&nbsp; 탈퇴여부</td>
</tr>
<tr>
<td colspan="5"><div id="space">&nbsp;</div></td>
</tr>
<c:forEach items="${list }" var="val">
<tr class="listM">
<td align="center">&nbsp;&nbsp;<a href="memberinfoM.si?id=${val.id }">${val.id }</a></td><td align="center">&nbsp;&nbsp; ${val.name }</td><td align="center">&nbsp;&nbsp; ${val.mailaddress }</td><td align="center">&nbsp;&nbsp; ${val.reg_date }</td><td align="center">&nbsp;&nbsp; ${val.memberDel }</td>
</tr>
<tr>
<td colspan="5"><div id="space">&nbsp;</div></td>
</tr>

</c:forEach>
</table>
</div>
<div id="resultbox">
<c:if test="${empty list }">
${"등록된 회원이 존재하지 않습니다" }<br>
</c:if>
</div>
<div id="searchbox">
<form action="searchMlist.si">
<select name="whereM" id="whereM"><option value="id">아이디</option><option value="name">이름</option><option value="mailaddress">메일주소</option> </select> 검색&nbsp;:&nbsp;<input type="text" id="Msearch" name="Msearch"><input type="submit" value="검색"></form></div>
</div>
<div id="numberbar">
 <c:if test="${startPage>PAGE_PER_BLOK}">
 	<button onclick="location.href='memberlist.si?pageNum=${startPage-1}'">이전</button>
</c:if>
 <c:forEach var="i" begin="${startPage }" end="${endPage }">
<c:if test="${currentPage==i }">
 <button onclick="location.href='memberlist.si?pageNum=${i}'" disabled="disabled">${i }</button> 
</c:if>
	
 <c:if test="${currentPage!=i }">
 <button onclick="location.href='memberlist.si?pageNum=${i}'">${i }</button> 
</c:if>
 </c:forEach>
<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='memberlist.si?pageNum=${currentPage + 1}'">
							다음
						</button>
					</c:if>
<c:if test="${endPage<totalPage }">
 
 		<button onclick="location.href='memberlist.si?pageNum=${endPage+1}'">다음</button>
</c:if>
</div>

</div>
</section>
<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>