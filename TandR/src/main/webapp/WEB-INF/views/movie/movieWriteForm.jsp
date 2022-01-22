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
		elPlaceHolder : "movieContent",
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
/* function checkFile(input) {
    if (input.files && input.files[0].size > (5 * 1024 * 1024)) {
        alert("파일 사이즈가 5mb 를 넘습니다.");
        input.value = null;
    }
   if( $(this).val() != "" ){
    	var ext = $(this).val().split('.').pop().toLowerCase();
    	      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
    		 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
    		 return false;
    	      } 
};
 */
function chk() {
	oEditors.getById["movieContent"].exec("UPDATE_CONTENTS_FIELD", []);
	var COMVISION = document.getElementById("movieContent").value;
	if (COMVISION == "" || COMVISION == null || COMVISION == '&nbsp;'
		|| COMVISION == '<br>' || COMVISION == '<br />'
		|| COMVISION == '<p>&nbsp;</p>' || COMVISION == '<p><br></p>') {

			alert("내용을 입력하세요.");

			oEditors.getById["movieContent"].exec("FOCUS"); //포커싱

			return false;
		}
	}
</script>
<link href="css/moviewriteform.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
<wrap>
	<header>
		<div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div>
	</header>
	<section>
		<div id="maincontent">
			<a id="title1">| 영화 등록</a>
			<div id="write_container" align="center">
				<div class="tb_frm">
					<form action="movieWrite.mv" name="movieWrite" id="movieWrite"
						method="post" onsubmit="return chk()"
						enctype="multipart/form-data">						
						<table border="1" id="boardtable">
							<tbody>
								<tr>
									<th>제목</th>
									<td><input type="text" name="movieTitle"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>무비 태그</th>
									<td><select class="movieTag" name="movieTag">
											<option value="1">상영종료</option>
											<option value="2">상영중</option>
											<option value="3">상영예정</option>
										</select></td>
								</tr>
								<tr>
									<th>개봉일</th>
									<td><input type="date" name="releaseDate"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>상영종료일</th>
									<td><input type="date" name="closeDate"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>감독</th>
									<td><input type="text" name="director"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>출연배우</th>
									<td><input type="text" name="actor"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>영화 정보</th>
									<td><input type="text" name="movieInfo"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>장르</th>
									<td><input type="text" name="movieGenre"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>영화 등급</th>
									<td><input type="number" name="movieGrade"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>평점</th>
									<td><select class="movieStar" name="movieStar">
											<option value="1">⭐</option>
											<option value="2">⭐⭐</option>
											<option value="3">⭐⭐⭐</option>
											<option value="4">⭐⭐⭐⭐</option>
											<option value="5">⭐⭐⭐⭐⭐</option>
										</select></td>
								</tr>
								<tr>
									<th>상영 시간</th>
									<td><input type="number" name="runningTime"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>
								<tr>
									<th>영화 가격</th>
									<td><input type="number" name="moviePrice"
										autofocus="autofocus" size="50" maxlength="255" required="required"></td>
								</tr>								
								<tr>
									<th>이미지 올리기</th>
									<td><input type="file" name="poster" id="poster" accept="image/jpeg, image/jpg, image/png, image/gif"
									onChange="checkFile(this)">
									5MB 이하의 jpg, gif, png, jpeg 파일만 가능합니다. </td>
								</tr>
								<tr>
								<td>
								상영정보 선택
								</td>
								<td>
								<select name="theater" multiple="multiple" id="theater">
								<optgroup label="극장선택"></optgroup>
								<c:forEach var="list" items="${list }" >
								<option value="${list.theaterCode }">극장코드:${list.theaterCode },극장위치:${list.theaterLoc },극장이름:${list.theaterName }</option>
								</c:forEach>
								</select>
								<select name="screen1" multiple="multiple" id="screen1">
								<optgroup label="강남cgv"></optgroup>
								<c:forEach var="list2" items="${list2 }" begin="0" end="19">
								<option value="${list2.screenCode }">스크린코드${list2.screenCode },관번호${list2.screenNum },상영시간${list2.screenTime }</option>
								</c:forEach>
								</select>
								<select name="screen2" multiple="multiple" id="screen2">
								<optgroup label="강남 메가박스"></optgroup>
								<c:forEach var="list2" items="${list2 }" begin="20" end="29">
								<option value="${list2.screenCode }">스크린코드${list2.screenCode },관번호${list2.screenNum },상영시간${list2.screenTime }</option>
								</c:forEach>
								</select>
								<select name="screen3" multiple="multiple" id="screen3">
								<optgroup label="고양cgv"></optgroup>
								<c:forEach var="list2" items="${list2 }" begin="30" end="44">
								<option value="${list2.screenCode }">스크린코드${list2.screenCode },관번호${list2.screenNum },상영시간${list2.screenTime }</option>
								</c:forEach>
								</select>
								<select name="screen4" multiple="multiple" id="screen4">
								<optgroup label="고양 롯데시네마"></optgroup>
								<c:forEach var="list2" items="${list2 }" begin="45" end="54">
								<option value="${list2.screenCode }">스크린코드${list2.screenCode },관번호${list2.screenNum },상영시간${list2.screenTime }</option>
								</c:forEach>
								</select>
								</td>
								</tr>
								<tr>
									<td colspan="2">영화 줄거리</td>
								</tr>
								<tr>
									<td class="contentArea" colspan="2"><textarea rows="18"
											cols="152" id="movieContent" name="movieContent"></textarea></td>
								</tr>
							</tbody>
						</table>
						<div class="btn_confirm1">
							<input type="submit" value="작성완료" id="btn_submit">
				
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
	</wrap>
</body>
<script type="text/javascript">
function checkFile(input) { 
    if (input.files && input.files[0].size > (5 * 1024 * 1024)) {
        alert("파일 사이즈가 5mb 를 넘습니다.");
        input.value = null;
    }
    var fileVal = $("#poster").val();
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