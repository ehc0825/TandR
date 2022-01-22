<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../public/sessionChk.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function chk() {
	if(frm.password1.value==""||frm.password1.value==null)
	{
	frm.password1.value=frm.password.value;
	}
	if(frm.password2.value==""||frm.password2.value==null)
	{
	frm.password2.value=frm.password.value;
	}
	if(frm.password1.value != frm.password2.value)
	{
		alert("암호와 암호확인이 서로 다릅니다");
		frm.password1.value="";
		frm.password2.value="";
		frm.password1.focus();
		return false;
	}
	if(frm.postcode.value==""||frm.postcode.value==null||frm.roadAddress.value==""||frm.roadAddress.value==null||frm.detailAddress.value==""||frm.detailAddress.value==null)
		{
		frm.postcode.value=frm.address.value;
		}
}

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
         
                document.getElementById("engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<link href="css/mypage.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>


<section>
<div id="maincontent">
		<a id="title1" href="myPage.si" class="mymenu">| My Page</a> 
		<a id="category1" href="myBoard.si" class="mymenu">작성글보기</a>
		<a id="category2" href="myTicket.si" class="mymenu"> 예약정보</a>
		<a id="category3" href="memberinfo.si" class="mymenu"><u>회원정보</u></a>
		 <a id="title2">| 회원정보</a>
<div id="signInBox"> 
<form action="memberinfochange.si" method="post" name="frm" onsubmit="return chk()">
<a href="main.do" id="logoi"><img alt="로고" src="images/logo/T&R.png" height="120" width="120"></a>

<input type="text" id="postcode" name="postcode" placeholder="우편번호" >
<input type="button" onclick="execDaumPostcode()" id="findbutton" value="우편번호 찾기">
<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" >
<input type="hidden" id="jibunAddress" placeholder="지번주소"  >
<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" >
<input type="hidden" id="extraAddress" placeholder="참고항목" >
<input type="hidden" id="engAddress" placeholder="영문주소"  >
<input type="hidden" value="${member.address }" name="address" id="address">
<input type="hidden" value="${member.password }" name="password" id="password">
<div id="idText">ID</div><input type="text" name="id" id="id" required="required" readonly="readonly" value="${member.id }" maxlength="18" minlength="4">
<div id="passwordText">암호</div><input type="password" name="password1" id="password1"  placeholder="암호(6~15)자리" maxlength="15"  minlength="6">
<div id="passwordText2">암호확인</div><input type="password" name="password2" id="password2" placeholder="암호 확인" maxlength="15"  minlength="6">
<div id="nameText">NAME</div><input type="text" name="name" id="name" required="required"  readonly="readonly" value="${member.name }">
<div id="addressText">주소</div>
<input type="text" name="addressnow" id="addressnow"  value="${member.address }" readonly="readonly" >
<div id="mailaddressText">Mail</div><input type="email" name="mailaddress" id="mailaddress" required="required" placeholder="mail address" value="${member.mailaddress }">
<div id="telText">Tel</div>


<input type="tel" name="tel2" id="tel2" maxlength="16" value="${member.tel }" pattern="\d{3,4}-\d{3,4}-\d{{4}">
<input type="submit" value="회원정보수정" id="signupbutton" style="cursor:pointer;">
</form>
</div>
		
		</div>
	</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>