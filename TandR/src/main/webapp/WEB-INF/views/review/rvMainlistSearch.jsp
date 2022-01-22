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
		<a id="category1" href="reviewMain.re" class="mymenu"><u>Review</u></a>
		<a id="category2" href="fboardMain.fb" class="mymenu">자유게시판</a>
		<a id="category3" href="eventMain.ev" class="mymenu">Event</a>
		<a id="title2">| Review</a>

		<div id="main_container">
			<table style="text-align=center;" border="0" id="main_table">
				<thead>
					<tr>
						<th>게시글번호</th>
						<th width="50%">제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>👍</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<th colspan="5">게시글이 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach var="review" items="${list }">
							<tr>
								<td>${review.rvNum}</td>
								<c:if test="${review.rvDel== 'y' }">
									<th colspan="5" class="line">삭제된 게시글 입니다</th>
								</c:if>
								<c:if test="${review.rvDel== 'm' }">
									<th colspan="5" class="line">관리자에 의해 삭제된 게시글 입니다</th>
								</c:if>
								<c:if test="${review.rvDel != 'y' && review.rvDel != 'm' }">
									<td><span>
										<c:if test="${review.rvReadCount> 50 }">
											🔥
										</c:if>
										</span>
										<a href="reviewView.re?rvNum=${review.rvNum }&pageNum=${currentPage}">${review.rvTitle }</a>
										<c:if test="${review.rvlike > 10 }">
											<span></span><span></span>
										</c:if>
									<input type="hidden" name="movieCode" value="${review.movieCode }" >
									</td>
									<td>${review.id }</td>
									<td>${review.rvDate }</td>
									<td>${review.rvReadCount }</td>
									<td>${review.rvlike }
										<c:if test="${review.rvlike > 5 }">
										<span>💖</span></c:if></td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>‍<br>
			<br>
			<div id="pagebar" align="center">
				<c:if test="${startPage > PAGE_PER_BLOCK }">
					<button onclick="location.href='searchRvmainlist.re?pageNum=${startPage-1}&rvsearch=${rvsearch }&whereRv=${whereRv}'">이전</button>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${currentPage== i }">
						<button onclick="location.href='searchRvmainlist.re?pageNum=${i}&rvsearch=${rvsearch }&whereRv=${whereRv}'" disabled="disabled">${i}</button>
					</c:if>
					<c:if test="${currentPage!= i }">
						<button onclick="location.href='searchRvmainlist.re?pageNum=${i}&rvsearch=${rvsearch }&whereRv=${whereRv}'">${i}</button>
					</c:if>
				</c:forEach>
				<!-- 보여줄 것이 남아있다 -->
				<c:if test="${endPage < totalPage }">
					<button onclick="location.href='searchRvmainlist.re?pageNum=${endPage+1}&rvsearch=${rvsearch }&whereRv=${whereRv}'">다음</button>
				</c:if>
			<!-- num=0 처음 쓴글 -->
		</div>
		</div>
		<div id="searchbox">
			<form action="searchRvmainlist.re">
				<select name="whereRv">
				<option value="${whereRv}">${whereMS}</option>
				<option value="everything">통합검색</option>
					<option value="id">아이디</option>
					<option value="rvTitle">제목</option>
					<option value="rvContent">내용</option>
					<option value="movieTitle">영화제목</option> </select>
				검색&nbsp;:&nbsp;<input type="text" id="rvsearch" name="rvsearch" value="${rvsearch }">
				<input type="submit" value="검색">
			</form>
		</div>	
	</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>