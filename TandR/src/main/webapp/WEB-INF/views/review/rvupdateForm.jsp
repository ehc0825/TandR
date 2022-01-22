<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainpage/sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<script type="text/javascript" src="se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
var oEditors = [];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "rvContent",
		sSkinURI : "se2/SmartEditor2Skin.html",
			htParams : { 
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseToolbar : true, 
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : false, 
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : true,
				fOnBeforeUnload : function(){ }},
				fCreator : "createSEditor2"
	});
});

function chk() {
	oEditors.getById["rvContent"].exec("UPDATE_CONTENTS_FIELD", []);
	var COMVISION = document.getElementById("fbContent").value;
	if (COMVISION == "" || COMVISION == null || COMVISION == '&nbsp;'
		|| COMVISION == '<br>' || COMVISION == '<br />'
		|| COMVISION == '<p>&nbsp;</p>' || COMVISION == '<p><br></p>') {

			alert("내용을 입력하세요.");

			oEditors.getById["rvContent"].exec("FOCUS"); //포커싱

			return false;
		}
	}
</script>
<link href="css/review.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
	<header>
		<div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div>
	</header>
	<section>
		<div id="maincontent">
			<a id="title1">| Review</a> <a id="title2">| 게시글 작성</a>
			<div id="write_container" align="center">
				<div class="tb_frm">
					<form action="reviewUpdate.re" name="rwrite" id="rwrite"
						method="post" onsubmit="return chk()"
						enctype="multipart/form-data">
						<input type="hidden" name="rvNum" value="${rvNum}"> 
						<input type="hidden" name="pageNum" value="${pageNum}">
						<input type="hidden" name="prePhoto" value="${review.rvPhoto }">
						<table border="1" id="boardtable">
							<tbody>
								<tr>
									<th>제목</th>
									<td><input type="text" name="rvTitle"
										autofocus="autofocus" size="50" maxlength="255" required="required" value="${review.rvTitle }"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${id }</td>
								</tr>
								<tr>
									<th>영화</th>
									<td>${review.movieTitle }</td>
								</tr>
								<tr>
									<th>평점</th>
									<td>
										<label for="s1">⭐<input type ="radio" name ="rvStar" id="s1" value="1"></label>
										<label for="s2">⭐⭐<input type ="radio" name ="rvStar" id="s2" value="2"></label>
										<label for="s3">⭐⭐⭐<input type ="radio" name ="rvStar" id="s3" value="3"></label>
										<label for="s4">⭐⭐⭐⭐<input type ="radio" name ="rvStar" id="s4" value="4"></label>
										<label for="s5">⭐⭐⭐⭐⭐<input type ="radio" name ="rvStar" id="s5" value="5" checked="checked"></label>
									</td>
								</tr>
								<tr>
									<th>이미지 변경</th>
									<td colspan="2"><input type="file" name="rvPhoto" id="rvPhoto" accept="image/jpeg, image/jpg, image/png, image/gif"
									onChange="checkFile(this)">
									5MB 이하의 jpg, gif, png, jpeg 파일만 가능합니다. </td>
								</tr>
								<tr>
									<td colspan="4">▽내용</td>
								</tr>
								<tr>
									<td class="contentArea" colspan="4"><textarea rows="24"
											cols="100" id="rvContent" name="rvContent">${review.rvContent }</textarea></td>
								</tr>
							</tbody>
						</table>
						<div class="btn_confirm1">
							<input type="submit" value="수정완료" id="btn_submit">
						</div>
						<div class="btn_confirm2">
							<input type="button" value="취소" onclick="history.back()">
						</div>
						<div class="btn_confirm3">
							<input type="reset" value="다시 쓰기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div>
	</footer>
</body>
<script type="text/javascript">
function checkFile(input) { 
    if (input.files && input.files[0].size > (5 * 1024 * 1024)) {
        alert("파일 사이즈가 5mb 를 넘습니다.");
        input.value = null;
    }
    var fileVal = $("#photo").val();
    console.log(fileVal)
    if( fileVal != "" ){
        var ext = fileVal.split('.').pop().toLowerCase(); //확장자분리
        //아래 확장자가 있는지 체크
        if($.inArray(ext, ['jpg','jpeg','gif','png']) == -1) {
          alert('jpg,gif,jpeg,png 파일만 업로드 할수 있습니다.');
		  input.value = null;	
          return;
    	}
	}
};
</script>
</html>