<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function chk() {
	if(frm.password.value != frm.password2.value)
		{
			alert("암호와 암호확인이 서로 다릅니다");
			frm.password.value="";
			frm.password2.value="";
			frm.password.focus();
			return false;
		}
	
}
function chk2() {
	if(!frm.id.value)
		{
			alert("아이디를 입력해주세요");
			frm.id.focus();
			return false;
		}
	$.post('confirm.do',"id="+frm.id.value,function(data){
		$('#err').html(data);
	});
	
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
<link href="css/signUpForm.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>
<section>
<div id="maincontent">
<a id="title1">| Sign Up</a>
<div id="signInBox"> 
<form action="signUp.si" method="post" name="frm" onsubmit="return chk()">
<a href="main.do" id="logo"><img alt="로고" src="images/logo/T&R.png" height="120" width="120"></a>

<input type="text" id="postcode" name="postcode" placeholder="우편번호" required="required">
<input type="button" onclick="execDaumPostcode()" id="findbutton" value="우편번호 찾기">
<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" required="required">
<input type="hidden" id="jibunAddress" placeholder="지번주소"  >
<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" required="required">
<input type="hidden" id="extraAddress" placeholder="참고항목" >
<input type="hidden" id="engAddress" placeholder="영문주소"  >


<div id="idText">ID</div><input type="text" name="id" id="id" required="required" autofocus="autofocus" placeholder="ID(4~9)자리" maxlength="9" minlength="4">
<input type="button" onclick="chk2()" value="중복확인" id="idchker"><div id="err"></div>
<div id="passwordText">암호</div><input type="password" name="password" id="password" required="required" placeholder="암호(6~15)자리" maxlength="15"  minlength="6">
<div id="passwordText2">암호확인</div><input type="password" name="password2" id="password2" required="required" placeholder="암호 확인" maxlength="15"  minlength="6">
<div id="nameText">NAME</div><input type="text" name="name" id="name" required="required"  placeholder="이름">
<div id="addressText">주소</div>
<div id="mailaddressText">Mail</div><input type="text" name="mailaddress" id="mailaddress" required="required" placeholder="mail address" maxlength="18"><select required="required" id="mailaddress2" name="mailaddress2"> 
<option></option>
<option value="@naver.com">@naver.com</option><option value="@gmail.com">@gmail.com</option><option value="@daum.net">@daum.net</option><option value="@hotmail.com">@hotmail.com</option>
</select>
<div id="telText">Tel</div>
<div id="hip1">-</div>
<div id="hip2">-</div>
<select name="tel1" id="tel1" required="required">
<option></option>
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="070">070</option>
</select>
<input type="number" name="tel2" id="tel2" required="required" minlength="4" maxlength="4">
<input type="number" name="tel3" id="tel3" required="required" minlength="4" maxlength="4">
<input type="submit" value="Sign Up" id="signupbutton" style="cursor:pointer;">
</form>
<a href="signInForm.do" id="loginpage">이미 회원이십니까?</a>
</div>
</div>
</section>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>
</body>
</html>