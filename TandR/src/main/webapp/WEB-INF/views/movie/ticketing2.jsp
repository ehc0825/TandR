<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@include file="../public/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ticket&Review</title>
<link href="css/ticket.css?update" rel="stylesheet" type="text/css">
<link rel="icon" href="images/logo/tricon.ico">
</head>
<body>

<header><div id="headbar"><jsp:include page="../public/topmenu.jsp"></jsp:include></div></header>

<section>
<div id="maincontent">
<a id="title1">| Ticketing</a>

<div class="reserve-container">
        <div class="movie-part">
            <div class="reserve-title">영화</div>
            <c:forEach items="${list }" var="val">            
            <div class="movie-list-container">
            <button class="movie-list-button" onclick="location.href='ticketing2.mv?movieCode=${val.movieCode }'">${val.movieTitle }</button>
            </div>            
            </c:forEach>
        </div>
        <div class="theater-part">
            <div class="reserve-title">극장</div>            
            <div class="theater-container">
            <c:forEach items="${list2}" var="val">
            	<div class="theater-wrapper">            	
				<div class="theater-location-wrapper">
            	<button class="theater-location">${val.theaterLoc }</button>
            	<button class="theater-place" onclick="location.href='ticketing3.mv?movieCode=${movie.movieCode}&theaterCode=${val.theaterCode }'">${val.theaterName }</button>
            	</div>             	   
            	</div>                                                    
           	</c:forEach>
           	</div>
                                      
        </div>
        <div class="day-part">
        <div class="reserve-title">날짜</div>           
        </div>        
        <div class="time-part">
        <div class="reserve-title">시간</div>
        </div>
	</div>       
 
</div>
</section>
            
<script>
var movieListButton = document.getElementsByClassName("movie-list-button");

function handleClick(event) {
  console.log(event.target);
  console.log(event.target.classList);
  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < movieListButton.length; i++) {
    	movieListButton[i].classList.remove("clicked");
    }
    event.target.classList.add("clicked");
  }
}
function init() {
  for (var i = 0; i < movieListButton.length; i++) {
	  movieListButton[i].addEventListener("click", handleClick);
  }
}

init();

</script>

<footer><div id="footcontent"><jsp:include page="../public/bottom.jsp"></jsp:include></div></footer>

</body>
</html>