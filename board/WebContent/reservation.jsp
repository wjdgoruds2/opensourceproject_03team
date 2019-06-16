<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>공연 보기</title>
    <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  

	<!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
  <link href="css/list.css" rel="stylesheet">
 
      <link rel="stylesheet" href="css/main2.css" />

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<script>
	
	 function area(_area){
		  	location.href="contentarea.do?area="+encodeURI(encodeURIComponent(_area));
	 	 }
	 	function type(_type){
		  	location.href="contenttype.do?type="+encodeURI(encodeURIComponent(_type));
	 	 }
	
	$(function () {
	    $('.navbar-toggle').click(function () {
	        $('.navbar-nav').toggleClass('slide-in');
	        $('.side-body').toggleClass('body-slide-in');
	        $('#search').removeClass('in').addClass('collapse').slideUp(200);

	        /// uncomment code for absolute positioning tweek see top comment in css
	        //$('.absolute-wrapper').toggleClass('slide-in');
	        
	    });
	   
	   // Remove menu for searching
	   $('#search-trigger').click(function () {
	        $('.navbar-nav').removeClass('slide-in');
	        $('.side-body').removeClass('body-slide-in');

	        /// uncomment code for absolute positioning tweek see top comment in css
	        //$('.absolute-wrapper').removeClass('slide-in');

	    });
	});
	function writeCheck()
	  {
	   var form = document.writeform;
	   
	  if( !form.subject.value )
	   {
	    alert( "제목을 적어주세요" );
	    form.subject.focus();
	    return;
	   }
	 
	  if( !form.content.value )
	   {
	    alert( "내용을 적어주세요" );
	    form.content.focus();
	    return;
	   }  
	 
	  form.submit();
	  }
	</script>
	<style>
		body{
font-family: 'Noto Sans KR', sans-serif;
}
.bg-1{
	background-color: gray;
	color: #FFFFFF;
	text-align: right;
}

*, *::before, *::after {
  box-sizing: border-box;
}
.basicBox {
  width: 130px;
  height: 40px;
  margin: 15px auto;
  color: #908383;
  font-size: 1.25rem;
  line-height: 40px;
  text-transform: uppercase;
  text-align: center;
  position: relative;
  cursor: pointer;
}

svg {
  position: absolute;
  top: 0;
  left: 0;
}
svg rect {
  fill: none;
  stroke: #908383;
  stroke-width: 1;
}
.basicBox:hover svg rect {
  stroke: #908383;
}

/* Basic Box */
svg rect {
  stroke-dasharray: 400, 0;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
.basicBox:hover svg rect {
  stroke-width: 3;
  stroke-dasharray: 35, 220;
  stroke-dashoffset: 38;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}

.btn-three {
	color: #FFF;
	transition: all 0.5s;
	position: relative;
}
.btn-three::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	background-color: rgba(255,255,255,0.1);
	transition: all 0.3s;
}
.btn-three:hover::before {
	opacity: 0 ;
	-webkit-transform: scale(0.5,0.5);
	        transform: scale(0.5,0.5);
}
.btn-three::after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	opacity: 0;
	transition: all 0.3s;
	border: 1px solid rgba(255,255,255,0.5);
	-webkit-transform: scale(1.2,1.2);
	        transform: scale(1.2,1.2);
}
.btn-three:hover::after {
	opacity: 1;
	-webkit-transform: scale(1,1);
	        transform: scale(1,1);
}

.btn-two {
	color: #908383;
	transition: all 0.5s;
	position: relative;
}
.btn-two::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	background-color: rgba(144, 131, 131,0.1);
	transition: all 0.3s;
}
.btn-two:hover::before {
	opacity: 0 ;
	-webkit-transform: scale(0.5,0.5);
	        transform: scale(0.5,0.5);
}
.btn-two::after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	opacity: 0;
	transition: all 0.3s;
	border: 1px solid rgba(144, 131, 131,0.5);
	-webkit-transform: scale(1.2,1.2);
	        transform: scale(1.2,1.2);
}
.btn-two:hover::after {
	opacity: 1;
	-webkit-transform: scale(1,1);
	        transform: scale(1,1);
}
</style>
  </head>



 <body>
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="mainlist.do">문화/정보 사이트</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarResponsive">

        <ul class="navbar-nav mr-auto">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              MY INFO
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="myreservation.do"> 나의 예약 정보</a>
              <a class="dropdown-item" href="mycontent.do">나의 게시물</a>
              <a class="dropdown-item" href="myreply.do">나의 댓글</a>
            </div>
          </li>
        </ul>
        <div style="position: absolute; right:0; color:white;"">
		사용자ID : ${id} <input type=button class="btn btn-info" value="로그아웃" OnClick="window.location='logout.do'">
	</div>
      </div>
    </div>
  </nav>
  
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('./image/main1_.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <p><i><b>모든 공연/전시 예매는 여기서!</b></i></p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('./image/main2_.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <p><i><b>지역별,분야별 공연/전시 정보를 한눈에!</b></i></p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image:url('./image/main3_.jpg')">
          <div class="carousel-caption d-none d-md-block">
           <p><i><b>나의 정보 관리도 손쉽게!</b></i></p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>
  <div class="container bg-2 text-center" style="margin-top: 30px;">
<div class="card">
 <div class="card-body p-4">

          
  <form action ="/board/reservation.do" method="post">
		<c:forEach items="${articleList}" var="article">	
			<table class="table table-striped table-bordered table-hover" style="text-align:center">
				<caption style="text-align:center">예약하기</caption>		
				<tr>
					<td>제목</td>
					<td style="text-align:left"><input type="text" name="subject"value="${article.subject}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>이름</td>
					<td style="text-align:left"><input type="text" name="name"></td>
				</tr>
				<tr>	
					<td>전화번호</td>
					<td style="text-align:left"><input type="text" name="phone"></td>
				</tr>
				<tr>	
					<td>카드</td>
					<td style="text-align:left"><input type="text" name="card"></td>
				</tr>
				<tr>	
					<td>작성일자</td>
					<td style="text-align:left">${article.boarddate}</td>
				</tr>
				<tr>	
					<td>email</td>
					<td style="text-align:left"><input type="text" name="email"></td>
				</tr>
				<tr>	
					<td>공연/전시 시간</td>
					<td style="text-align:left" ><input type="text" name="performtime"value="${article.performtime}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>공연/전시 날짜</td>
					<td style="text-align:left"><input type="text" name="performdate"value="${article.performdate}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>공연/전시 위치</td>
					<td style="text-align:left"><input type="text" name="performlocation"value="${article.performlocation}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>공연/전시 지역</td>
					<td style="text-align:left"><input type="text" name="area" value="${article.area}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>공연/전시 유형</td>
					<td style="text-align:left" ><input type="text" name="type"value="${article.type}" readonly onfocus="this.blur();"></td>
				</tr>	
				<tr>
					<td></td>
					<td style="text-align:right">
						<input type=submit class="btn btn-warning" value="예약" Onclick="javascript:writeCheck();">
						<input type=button class="btn btn-secondary" value="취소" OnClick="window.location='content.do?num=${article.num}'">
					</td>
				</tr>	
			</table>
		
		</c:forEach>
	</form>
	</div>
	</div>
</div>
	
	<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">오픈소스 전문 프로젝트 &copy; 3조</p>
    </div>
    <!-- /.container -->
  </footer>
  	
  	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="vendor/jquery/jquery.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
         <script src="js/jquery.dropotron.min.js"></script>
         <script src="js/browser.min.js"></script>
         <script src="js/breakpoints.min.js"></script>
         <script src="js/util.js"></script>
         
         <script src="js/main2.js"></script>
  </body>
  </html>