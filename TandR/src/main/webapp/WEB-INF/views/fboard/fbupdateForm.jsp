<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainpage/sessionChk.jsp" %>
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
			elPlaceHolder : "fbContent",
			sSkinURI : "se2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : false,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : true,
				fOnBeforeUnload : function() {
				}
			},
			fCreator : "createSEditor2",
		});
	});
	$(window).load(function(){
		oEditors.getById["fbContent"].exec("UPDATE_CONTENTS_FIELD", [fboard.fbContent]);
	});
	function chk() {
		oEditors.getById["fbContent"].exec("UPDATE_CONTENTS_FIELD", []);
		 var COMVISION = document.getElementById("fbContent").value;
		    if( COMVISION == ""  || COMVISION == null || COMVISION == '&nbsp;' || COMVISION == '<br>' || COMVISION == '<br />' || COMVISION == '<p>&nbsp;</p>'|| COMVISION =='<p><br></p>')  {

		         alert("내용을 입력하세요.");

		         oEditors.getById["fbContent"].exec("FOCUS"); //포커싱

		         return false;

		    }
	}
</script>
<link href="css/board.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
	<header>
		<div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div>
	</header>
	<section>
		<div id="maincontent">
			<a id="title1">| 자유게시판</a> <a id="title2">| 게시글 수정</a>
			<div id="write_container" align="center">
				<div class="tb_frm">
					<form action="fboardUpdate.fb" name="fwrite" id="fwrite"	method="post" onsubmit="return chk()"
					enctype="multipart/form-data">
						<input type="hidden" name="fbNum" value="${fbNum}">
						 <input type="hidden" name="pageNum" value="${pageNum}">
						 <input type="hidden" name="prePhoto" value="${fboard.photo }">
						<table border="1" id="boardtable">
							<tbody>
								<tr>
									<th>제목</th>
									<td><input type="text" name="fbTitle"
										autofocus="autofocus" required="required" size="50" maxlength="255" value="${fboard.fbTitle }"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${id }</td>
								</tr>
								<tr>
									<th>이미지 변경</th>
									<td><input type="file" name="photo" id="photo" accept="image/jpeg, image/jpg, image/png, image/gif"
									onChange="checkFile(this)"></td>
								</tr>
								<tr>
									<td colspan="2">▽내용</td>
								</tr>
								<tr>
									<td class="contentArea" colspan="2"><textarea rows="24"	cols="100" id="fbContent" name="fbContent">${fboard.fbContent }</textarea></td>
								</tr>
							</tbody>
						</table>
						<div class="btn_confirm1">
							<input type="submit" value="수정완료" id="btn_submit">
						</div>
						<div class="btn_confirm2">
							<input type="button" value="취소" onclick="history.back()">
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