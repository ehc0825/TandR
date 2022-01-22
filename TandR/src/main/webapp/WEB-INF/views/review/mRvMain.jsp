<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../public/sessionChk.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/mfboardlist.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
	<section>
		<div id="maincontent">
			<a href="main.do"><img alt="로고" src="images/logo/T&R.png"
				height="30px" width="30px" id="logo"></a><a id="title1"
				href="masterpage.do">| T & R 관리페이지</a>
			<div id="sidemenu"><jsp:include page="../public/sidemenu.jsp"></jsp:include>
			</div>
			<div id="contentBox">
				<div id="mcount">총:&nbsp;&nbsp;${total } 개</div>
				<div id="fboard"><a href="masterFboard.fb">자유게시판</a></div>
				<div id="review"><u>Review</u></div>
				<div id="memberlist">
					<table id="resulttable">
						<tr>
							<td align="center">&nbsp;&nbsp;게시글번호</td>
							<td align="center">제목</td>
							<td align="center">&nbsp;&nbsp; 작성자</td>
							<td align="center">&nbsp;&nbsp; 조회수</td>
							<td align="center">&nbsp;&nbsp; 게시글상태</td>
						</tr>
						<tr>
							<td colspan="6"><div id="space">&nbsp;</div></td>
						</tr>
						<c:forEach items="${list }" var="review">
							<tr class="listM">
								<td align="center">&nbsp;${review.rvNum }</td>
								<td align="center">&nbsp;<a href="reviewView.re?rvNum=${review.rvNum }"> ${review.rvTitle }</a></td>
								<td align="center">&nbsp;${review.id}</td>
								<td align="center">&nbsp;${review.rvReadCount}</td>
								<td align="center">&nbsp;${review.rvDel}</td>
								
							</tr>
							<tr>
								<td colspan="5"><div id="space">&nbsp;</div></td>
							</tr>

						</c:forEach>
					</table>
				</div>
				<div id="resultbox">
					<c:if test="${empty list }">${"등록된 게시글이 없습니다." }<br>
					</c:if>
				</div>
				

				<div id="numberbar">
					<c:if test="${startPage > PAGE_PER_BLOCK }">
					<button onclick="location.href='masterReview.re?pageNum=${startPage-1}'">이전</button>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage== i }">
						<button onclick="location.href='masterReview.re?pageNum=${i}'" disabled="disabled">${i}</button>
					</c:if>
					<c:if test="${currentPage!= i }">
						<button onclick="location.href='masterReview.re?pageNum=${i}'">${i}</button>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있다 -->
				<c:if test="${endPage < totalPage }">
					<button onclick="location.href='masterReview.re?pageNum=${endPage+1}'">다음</button>
				</c:if>
				</div>
				<div id="searchbox">
					<form action="searchRvlist.re">
						<select name="whereRv" id="whereRv"><option value="id">아이디</option><option value="rvTitle">제목</option><option value="rvContent">내용</option> </select>
						 검색&nbsp;:&nbsp;<input type="text" id="rvsearch" name="rvsearch">
						 <input type="submit" value="검색">
					</form>
				</div>
				</div>
			</div>
	</section>
	<footer>
		<div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div>
	</footer>
</body>
</html>