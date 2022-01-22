<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/reviewView.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
<c:set var="id" value='${sessionScope.id}'></c:set>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

function delReview() {
	var con = confirm("게시글을 삭제하시겠습니까?");
	if(con) {
		location.href="reviewDelete.re?rvNum=${review.rvNum}";
	}
}
function suspendReview() {
	var con = confirm("게시글을 정지하시겠습니까?");
	if(con) {
		location.href="suspendReview.re?rvNum=${review.rvNum}";
	}
}

</script>
</head>
<body>
<wrap>
<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>

<section>
<div id="maincontent">
	<input type="hidden" name="rvNum" value="${rvNum}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="movieCode" value="${movieCode }">
	
    <div class="container_top">
      <a class="title1" href="reviewMain.re?fbNum=${review.rvNum}&pageNum=${pageNum }">| Review</a>
      <a class="title2">| ${review.rvTitle }</a>
      <div id="viewbtn">
			<c:if test="${id eq 'master' }">
				<button onclick="suspendReview()">정지</button>
			</c:if>		
			<c:if test="${id == review.id}">
					<button
						onclick="location.href='reviewUpdateForm.re?rvNum=${review.rvNum}&pageNum=${pageNum }'">수정</button>
					<button onclick="delReview()">삭제</button>
			</c:if>
			<button onclick="location.href='likesInsert.re?rvNum=${review.rvNum}&id=${id}'">👍</button>
            <button onclick="location.href='reviewMain.re'">목록</button>
            
	  </div>
      
      <div id="writerInfo">|&nbsp;작성자 ${review.id } |&nbsp;
      		회원등급 <c:if test="${member.score >= 0&&member.score <= 20}">
			🥉
			</c:if>
			<c:if test="${member.score >= 21&&member.score <= 40 }">
			🥈
			</c:if>
			<c:if test="${member.score >= 41&&member.score <= 60 }">
			🥇
			</c:if>
			<c:if test="${member.score >= 61&&member.score <= 81}">
			💎
			</c:if>
			<c:if test="${member.score >= 81}">
			👑
			</c:if>
      		|&nbsp;${review.rvDate } |&nbsp;조회 ${review.rvReadCount }|&nbsp;👍${review.rvlike}
      </div>
      <div id="movieInfo">
      	|&nbsp; ${review.movieTitle }
      	|&nbsp;<c:if test="${review.rvStar == 1 }">⭐</c:if>
      		<c:if test="${review.rvStar == 2 }">⭐⭐</c:if><c:if test="${review.rvStar == 3 }">⭐⭐⭐</c:if>
      		 <c:if test="${review.rvStar == 4 }">⭐⭐⭐⭐</c:if><c:if test="${review.rvStar == 5 }">⭐⭐⭐⭐⭐</c:if> 
      </div>
    </div>
    <article class="main_content">
    <c:if test="${review.rvPhoto != null }">
      <img alt="photo" src="images/review/${review.rvPhoto }">
    </c:if>
	  <br>
      <div class="content">
         ${review.rvContent }
      </div>
    </article>
    
    
</div>
</section>

 
<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</wrap>
</body>
</html>