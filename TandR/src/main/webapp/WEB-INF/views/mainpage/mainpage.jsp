<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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


<section>
<div id="maincontent">
<a id="title1">NOW SHOWING ></a>
<div id="mainvideo"><jsp:include page="../public/main video.jsp"></jsp:include></div>
<a id="title2">Ranking</a>
<div id="ranking">
<div class="top10space">&nbsp;</div>
<c:forEach items="${list }" var="val">
<c:set var="i" value="${i+1 }"></c:set>
<a href="movieInfo.mv?movieCode=${val.movieCode }" class="top10">${i } .
<c:choose>
        <c:when test="${fn:length(val.movieTitle) gt 8}">
        <c:out value="${fn:substring(val.movieTitle, 0, 7)}">
        </c:out>...</c:when>
        <c:otherwise>
        <c:out value="${val.movieTitle}">
        </c:out></c:otherwise>
</c:choose>
</a><br>
<div class="top10space">&nbsp;</div>
</c:forEach>
</div>
<a id="title3" href="eventMain.ev">| Event</a>
<div id="mainEvent"><jsp:include page="../public/main Event.jsp"></jsp:include></div>

<a id="title4">| 리뷰게시판</a>
<div id="maincontent4">

<table>
				<thead>
					<tr>
						<th>글번호</th>
						<th width="40%">제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list2 }">
						<tr>
							<th colspan="5">게시글이 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${not empty list2 }">
						<c:forEach var="review" items="${list2 }">
							<tr>
								<td>${review.rvNum }</td>
								<c:if test="${review.rvDel == 'y' }">
									<th colspan="5">삭제된 게시글 입니다</th>
								</c:if>
								<c:if test="${review.rvDel != 'y' }">
									<td>
										<!-- 답변글은 들여쓰기를 해야하므로 level이 0보다 크다 --> 
										<a href="reviewView.re?rvNum=${review.rvNum }&pageNum=${currentPage}">${review.rvTitle }</a>
										<c:if test="${review.rvReadCount > 50 }">
											<img alt="" src="#">
										</c:if>
									</td>
									<td>${review.id }</td>
									<td>${review.rvDate }</td>
									<td>${review.rvReadCount }</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
<a href="reviewMain.re" class="more">see more ></a>
</div>

<a id="title5">| 자유게시판</a>
<div id="maincontent5">

<table>
				<thead>
					<tr>
						<th>글번호</th>
						<th width="40%">제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list3 }">
						<tr>
							<th colspan="4">게시글이 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${not empty list3 }">
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
					</c:if>
				</tbody>
			</table>
<a href="fboardMain.fb" class="more">see more ></a>
</div>

</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>