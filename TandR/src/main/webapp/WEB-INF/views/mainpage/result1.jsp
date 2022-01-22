<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/result1.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp?result=${result }"></jsp:include></div></header>

<br>

<section>
<div id="maincontent">
<a id="title1">| Search Result</a>
<div id="searchResult"> 
<br>
<c:if test="${empty list3 }">
<a id="title3">| 리뷰게시판</a>
					<br>
					<div id="container">
		<table id="maintable">
				<thead>
					<tr>
						<th>게시글번호 |</th>
						<th width="40%">제목</th>
						<th>| 작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>추천</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="review" items="${list2 }">
							<tr>
								<td>${review.rvNum }</td>
								<c:if test="${review.rvDel == 'y' }">
									<th colspan="5">삭제된 게시글 입니다</th>
								</c:if>
								<c:if test="${review.rvDel != 'y' }">
									<td>
										<!-- 답변글은 들여쓰기를 해야하므로 level이 0보다 크다 --> 
										<a href="reviewView.re?rvNum=${review.rvNum }">${review.rvTitle }</a>
										<c:if test="${review.rvReadCount > 50 }">
											<img alt="" src="#">
										</c:if>
									</td>
									<td>${review.id }</td>
									<td>${review.rvDate }</td>
									<td>${review.rvReadCount }</td>
									<td>${review.rvlike }</td>
								</c:if>
							</tr>
						</c:forEach>
				
				</tbody>
			</table>
			<a href="searchRvmainlist.re?whereRv=everything&rvsearch=${result }" class="more">see more ></a>
			</div>
			</c:if>
		<c:if test="${empty list2 }">	
	<a id="title3">| 자유게시판</a><br>		
			<div id="container">
			<table id="maintable">
				<thead>
					<tr>
						<th>게시글번호 |</th>
						<th width="40%">제목</th>
						<th>| 작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>댓글</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="fboard" items="${list3 }">
							<tr>
								<td>${fboard.fbNum }</td>
								<c:if test="${fboard.fbDel == 'y' }">
									<th colspan="4">삭제된 게시글 입니다</th>
								</c:if>
								<c:if test="${fboard.fbDel != 'y' }">
									<td>
										<!-- 답변글은 들여쓰기를 해야하므로 level이 0보다 크다 --> 
								<a href="fboardView.fb?fbNum=${fboard.fbNum }&pageNum=${currentPage}">${fboard.fbTitle }</a>
										<c:if test="${fboard.fbReadCount > 50 }">
											<img alt="" src="#">
										</c:if>
									</td>
									<td>${fboard.id }</td>
									<td>${fboard.fbDate }</td>
									<td>${fboard.fbReadCount }</td>
									
								</c:if>
							</tr>
						</c:forEach>
				</tbody>
			</table>
			<a href="searchFbmainlist.fb?whereFb=everything&fbsearch=${result }" class="more">see more ></a>
			</div>
			</c:if>
			
</div>
</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>