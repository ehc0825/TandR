<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/boardView.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

function upReply(replyNum) {
	var rpUpdate = document.getElementById("rpUpdate"+replyNum);
	console.log(rpUpdate);
	rpUpdate.style.display = "block";
}
function closeReply(replyNum) {
	var rpUpdate = document.getElementById("rpUpdate"+replyNum);
	console.log(rpUpdate);
	rpUpdate.style.display = "none";
}
function reReply(replyNum) {
	var reWrite = document.getElementById("reWrite"+replyNum);
	console.log(reWrite);
	reWrite.style.display = "block";
}
function closeReRe(replyNum) {
	var reWrite = document.getElementById("reWrite"+replyNum);
	console.log(reWrite);
	reWrite.style.display = "none";
}
function delFboard() {
	var con = confirm("게시글을 삭제하시겠습니까?");
	if(con) {
		location.href="fboardDelete.fb?fbNum=${fboard.fbNum}";
	}
}
function delReply(replyNum) {
	var con = confirm("댓글을 삭제 하시겠습니까?");
	if(con) {
		location.href="replyDelete.rp?fbNum=${fboard.fbNum}&replyNum=" + replyNum;
	}
}
function suspendFboard() {
	var con = confirm("게시글을 정지하시겠습니까?");
	if(con) {
		location.href="suspendFboard.fb?fbNum=${fboard.fbNum}";
	}
}
</script>
</head>
<body>
<wrap>
<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>

<section>
<div id="maincontent">
    <div class="container_top">
      <a class="title1" href="fboardMain.fb?fbNum=${fboard.fbNum}&pageNum=${pageNum }">| 자유게시판</a>
      <a class="title2">| ${fboard.fbTitle }</a>
      <div id="viewbtn">
			<c:if test="${id eq 'master' }">
				<button onclick="suspendFboard()">정지</button>
			</c:if>		
			<c:if test="${id == fboard.id}">
					<button
						onclick="location.href='fboardUpdateForm.fb?fbNum=${fboard.fbNum}&pageNum=${pageNum }'">수정</button>
					<button onclick="delFboard()">삭제</button>
			</c:if>
            <button onclick="location.href='fboardMain.fb'">목록</button>
	  </div>
      
      <div id="writerInfo">|&nbsp;작성자 ${fboard.id } |&nbsp;
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
      		|&nbsp;${fboard.fbDate } |&nbsp;조회 ${fboard.fbReadCount } |&nbsp;댓글 ${replyCount }</div>
    </div>
    <article class="main_content">
    <c:if test="${fboard.photo != null }">
      <img alt="photo" src="images/fboard/${fboard.photo }">
    </c:if>
	  <br>
      <div class="content">
         ${fboard.fbContent }
      </div>
    </article>
    
    <div id="replyArea">
    <span style="color: yellow; background-color: yellow;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span style="font-size: 9pt;">댓글 총 ${replyCount } </span>
		<font color="#666666">─────────────────────────────────────────────</font>
    </div>
    <article class="reply">
     	<c:if test="${id != null }">
	     	<form action="replyWrite.rp?fbNum=${fboard.fbNum}&replyNum=0&ref=0&ref_level=0&ref_step=0" method="post" class="replyInsert_frm">
				<pre><textarea name="replyContent"placeholder="댓글을 입력하세요 (어그로, 욕설 댓글은 제재의 대상입니다.)" style="width: 55%;
    					height: 6em; border-radius:1px; resize: none;"></textarea></pre>
					<div class="submit_box">
					<input type="submit" value="등록하기">
					</div>
			</form>	
     	</c:if>
			
     	<c:forEach var="reply" items="${rpList2 }">
     		
     		
     		<c:if test="${reply.ref_level != 0 }"> <!-- 답글일 때 -->
						<div class="re"></div>
			<p class="reRe_top">
			<c:if test="${reply.replyDel == 'n' }">
					<span>${reply.id}</span>
				<%--<span> <img alt="프로필" src="/semojeon/upload/${reply.profile}"> <span>멤버등급 뿌리기 --%>
						<!-- 댓글의 id와 세션의 id가 같으면 수정/삭제 가능 -->
						<c:if test="${reply.id == id}">
						<input type="hidden" value="${reply.replyNum }">
							<span class="updatebtn_area">
								<span class="rpUpdate_btn" onclick="upReply(${reply.replyNum})">수정</span>
								<span class="rpDelete_btn" onclick="delReply(${reply.replyNum})">삭제</span>
							</span><!-- updatebtn_area 끝 -->
						</c:if>
								<c:if test="${id != null }">
								<c:if test="${reply.ref_level == 0 }">
									<span class="reReplybtn" onclick="reReply(${reply.replyNum})">답글</span>
								</c:if>
								</c:if>
							<!-- 내용, 날짜 -->	
							<pre class="rpcon">${reply.replyContent}</pre>
							<div class="replyDate">${reply.replyDate}</div>
			<font color="#666666">───────────────────────────────────</font>
			</c:if>
			</c:if>
			</p><!-- re_top -->
						
			
			<p class="re_top">
			<c:if test="${reply.ref_level == 0 }">
			<c:if test="${reply.replyDel == 'n' }">
					<span>${reply.id}</span>
				<%--<span> <img alt="프로필" src="/semojeon/upload/${reply.profile}"> <span>멤버등급 뿌리기 --%>
						<!-- 댓글의 id와 세션의 id가 같으면 수정/삭제 가능 -->
						<c:if test="${reply.id == id}">
						<input type="hidden" value="${reply.replyNum }">
							<span class="updatebtn_area">
								<span class="rpUpdate_btn" onclick="upReply(${reply.replyNum})">수정</span>
								<span class="rpDelete_btn" onclick="delReply(${reply.replyNum})">삭제</span>
							</span><!-- updatebtn_area 끝 -->
						</c:if>
								<c:if test="${id != null }">
								<c:if test="${reply.ref_level == 0 }">
									<span class="reReplybtn" onclick="reReply(${reply.replyNum})">답글</span>
								</c:if>
								</c:if>
							<!-- 내용, 날짜 -->	
							<pre class="rpcon">${reply.replyContent}</pre>
							<div class="replyDate">${reply.replyDate}</div>
			<font color="#666666">───────────────────────────────────</font>
			</c:if>
			</c:if>
			</p><!-- re_top -->
			<p class="re_top">
			<c:if test="${reply.replyDel == 'y' }">
				<div></div>
				<div id="delMsg">삭제된 댓글 입니다.</div>					
				<div></div>
			<font color="#666666">───────────────────────────────────</font>
			</c:if>
			</p>
			
			
     		<%--댓글수정 창--%> 
     		<div id="rpUpdate${reply.replyNum }" style="display: none;">
    	 		<form  action="replyUpdate.rp?fbNum=${fboard.fbNum}&replyNum=${reply.replyNum }" method="post" class="rpupdate_frm">
					<pre><textarea name="replyContent" style="width: 55%; height: 6em; border-radius:1px; resize: none;">${reply.replyContent } </textarea></pre>
						<div class="submit_box">
						<input type="submit" class="btn btn_small" value="수정">
						<span class="re_cancelbtn" onclick="closeReply(${reply.replyNum})">취소</span>
						</div>
				</form>
			</div>
			<div id="reWrite${reply.replyNum }" style="display: none;">
				<form action="replyWrite.rp?fbNum=${fboard.fbNum}&replyNum=0&ref=${reply.replyNum }&ref_level=1&ref_step=0" method="post"
				 class="reReplyInsert_frm">
				<pre><textarea name="replyContent"placeholder="댓글을 입력하세요 (어그로, 욕설 댓글은 제재의 대상입니다.)" style="width: 55%; margin-left: 20px;
    					height: 6em; border-radius:1px; resize: none;"></textarea></pre>
					<div class="submit_box">
					<input type="submit" value="등록하기">
					<span class="re_cancelbtn" onclick="closeReRe(${reply.replyNum})">취소</span>
					</div>
				</form>	
			
			</div>
		</c:forEach>
    </article>
</div>
</section>

 
<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</wrap>
</body>
</html>