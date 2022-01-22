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
		elPlaceHolder : "eventContent",
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
	oEditors.getById["eventContent"].exec("UPDATE_CONTENTS_FIELD", []);
	var COMVISION = document.getElementById("eventContent").value;
	if (COMVISION == "" || COMVISION == null || COMVISION == '&nbsp;'
		|| COMVISION == '<br>' || COMVISION == '<br />'
		|| COMVISION == '<p>&nbsp;</p>' || COMVISION == '<p><br></p>') {

			alert("내용을 입력하세요.");

			oEditors.getById["eventContent"].exec("FOCUS"); //포커싱

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
			<a id="title1">| Event</a> <a id="title2">| 이벤트 등록</a>
			<div id="write_container" align="center">
				<div class="tb_frm">
					<form action="eventWrite.ev" method="post" enctype="multipart/form-data">
						<input type="hidden" name="eventNum" value="${eventNum}"> 
						<table border="1" id="boardtable">
							<tbody>
								<tr>
									<th>이벤트명</th>
									<td><input type="text" name="eventTitle"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${id }</td>
								</tr>
								<tr>
									<th>이미지 올리기</th>
									<td><input type="file" name="photo" id="photo" accept="image/jpeg, image/jpg, image/png, image/gif"
											onChange="checkFile(this)">
									</td>
								</tr>
								<tr>
									<td colspan="2">▽내용</td>
								</tr>
								<tr>
									<td class="contentArea" colspan="2"><textarea rows="24"	cols="100" id="eventContent" name="eventContent"></textarea></td>
								</tr>
							</tbody>
						</table>
						<div class="btn_confirm1">
							<input type="submit" value="등록완료" id="btn_submit">
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
</html>