<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="../public/sessionChk.jsp" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){ 
	var people=1;
	var count;
	$("select[name=people]").change(function(){
		people=$(this).val(); //value값 가져오기
		  console.log($("select[name=people] option:selected").text());
		});
    $("input[type='checkbox']").on("click" , function(){ 
      count = $("input:checked[type='checkbox']").length; 
             if(count > people){ 
            $(this).prop("checked" , false); 
                    //또는 this.checked=false;
            alert("선택하신 인원 수 이상은 예매하실 수 없습니다."); 
            count=count-1;
          }
        
    }); 
    $('#chkbutton').on("click",function(){
    	if(count != people){
   		 alert("선택하신 인원수와 선택하신 좌석수가 일치하지 않습니다");
   		 return false;
   	}
    });
});

</script>
<link href="css/ticket.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">

<style>
        .seat {
        	
            width: 40px;
            height: 40px;
        }
        
        .clicked {
            background-color: red;
            color: white;
        }
    </style>


</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>

<section>
<div id="maincontent">
<a id="title1">| Ticketing</a>
<a id="title2">| 좌석 선택</a>
<div id="movieNowBox">

<form action="ticketing6.mv" method="post" name="frm">

<p>영화 이름: ${movie.movieTitle }</p>
<input type=hidden value=${movie.movieCode } name="movieCode">
<input type=hidden value="${movie.movieTitle }" name="movieTitle">
<p>영화 값: ${movie.moviePrice }</p>
<input type=hidden value=${movie.moviePrice } name="moviePrice">
<p>상영관 위치: ${theater.theaterLoc } ${theater.theaterName }</p>
<input type=hidden value=${theater.theaterLoc } name="theaterLoc">
<input type=hidden value=${theater.theaterName } name="theaterName">


<p>상영관: ${screenNum }관</p>
<input type=hidden value=${screenNum } name="screenNum">

<p>날짜: ${showingDay }</p>
<input type=hidden value="${showingDay }" name="showingDay">

<input type=hidden value=${nowShowing.nsCode } name="nsCode">


<p>상영 시작 시간: ${screenTime.screenTime }</p>
<input type=hidden value=${screenTime.screenTime } name="screenTime">

<br>
<div>인원 선택 &nbsp;&nbsp;&nbsp;&nbsp;

<select class="age" name="age">
	<option value="1">어린이</option>
	<option value="2">청소년</option>
	<option value="3">성인</option>
</select>
<select class="people" name="people" id="people">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
</select>
</div>

<br><br><br><br>

<img alt="포스터" src="images/poster/screen.jpeg" width="360">


<br>
<table>
<c:forEach items="${arr }" begin="0" end="6" step="1" var="i">
<tr>
<c:forEach begin="1" end="9" step="1" var="j">
<td>
<input type="checkbox" name="seat" value="${i }${j}" onClick="count_ck(this);">${i }${j}
</td>
</c:forEach>
</tr>
</c:forEach>
</table>
<c:forEach items="${list6 }" var="dto">
<script type="text/javascript">
var checked=document.getElementsByName("seat");
var size=document.getElementsByName("seat").length;
for(var i=0; i<size; i++)
	{
	if(checked[i].value=='${dto.seats}'){
		checked[i].disabled=true;
	}
	}
</script>
</c:forEach>

<br>

<input type="hidden" name="rsCode" value="${rsCode}">

<br>
<div>결제 방법 선택 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<select name="rsCheck" required="required">
<option></option>
<option>무통장입금: 농협 1111-111-111</option>
<option>포인트 결제</option>
</select>
</div>

<br>
<br>
<button style="width:330px; text-align:center; background-color:black;" class="button" id="chkbutton"><b>결제</b></button>

</form>


</div>
</div>
</section>
            


<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>

</body>

</html>