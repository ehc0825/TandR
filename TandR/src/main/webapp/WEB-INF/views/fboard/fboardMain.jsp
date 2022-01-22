<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/board.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
<style type="text/css">
td:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>

<section>
<div id="maincontent">
		<a id="title1">| Forum</a> 
		<a id="category1" href="reviewMain.re" class="mymenu">Review</a>
		<a id="category2" href="fboardMain.fb" class="mymenu"><u>자유게시판</u></a>
		<a id="category3" href="eventMain.ev" class="mymenu">Event</a>
		<a id="title2">| 자유게시판</a>

		<div id="main_container">
			<table style="text-align=center;" border="0" id="main_table">
				<thead>
					<tr>
						<th>게시글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>댓글</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<th colspan="5">게시글이 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach var="fboard" items="${list }">
							<tr>
								<td>${fboard.fbNum }</td>
								<c:if test="${fboard.fbDel == 'y' }">
									<th colspan="5" class="line">삭제된 게시글 입니다</th>
								</c:if>
								<c:if test="${fboard.fbDel== 'm' }">
									<th colspan="5" class="line">관리자에 의해 삭제된 게시글 입니다</th>
								</c:if>
								<c:if test="${fboard.fbDel != 'y' && fboard.fbDel != 'm' }">
									<td><span>
										<c:if test="${fboard.fbReadCount > 50 }">
											🔥
										</c:if>
										</span>
										<a href="fboardView.fb?fbNum=${fboard.fbNum }&pageNum=${currentPage}">${fboard.fbTitle }</a>
										<c:if test="${fboard.replyCount > 4 }">
											<span></span><span></span>
										</c:if>
									</td>
									<td>${fboard.id }</td>
									<td>${fboard.fbDate }</td>
									<td>${fboard.fbReadCount }</td>
									<td>${fboard.replyCount }
										<c:if test="${fboard.replyCount > 5 }">
										<span>💬<span>
										</c:if></td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>‍<br>
			<br>
			<div id="write_btn">
				<button id="writecontent" onclick="location.href='fboardWriteFormbefore.fb?fbNum=0&pageNum=${currentPage}'">글쓰기</button>
				</div>
			<div id="pagebar" align="center">
				<c:if test="${startPage > PAGE_PER_BLOCK }">
					<button onclick="location.href='fboardMain.fb?pageNum=${startPage-1}'">이전</button>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage== i }">
						<button onclick="location.href='fboardMain.fb?pageNum=${i}'" disabled="disabled">${i}</button>
					</c:if>
					<c:if test="${currentPage!= i }">
						<button onclick="location.href='fboardMain.fb?pageNum=${i}'">${i}</button>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있다 -->
				<c:if test="${endPage < totalPage }">
					<button onclick="location.href='fboardMain.fb?pageNum=${endPage+1}'">다음</button>
				</c:if>
			<!-- num=0 처음 쓴글 -->
		</div>
		</div>
	<div id="searchbox">
		<form action="searchFbmainlist.fb">
			<select name="whereFb" id="whereFb"><option value="id">아이디</option><option value="fbTitle">제목</option><option value="fbContent">내용</option> </select>
			 검색&nbsp;:&nbsp;<input type="text" id="fbsearch" name="fbsearch">
				 <input type="submit" value="검색">
		</form>
	</div>	
	</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>