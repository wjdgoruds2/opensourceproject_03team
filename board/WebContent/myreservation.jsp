<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>예약확인 하기</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
     
      <meta name="description" content="">
 	 <meta name="author" content="">
  	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
  <link href="css/list.css" rel="stylesheet">
  

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
	</script>
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
	<div class="card">
 	<div class="card-body p-4">
	<form method="post">
	<div align="center">
     		 <span style="font-size: 30px;"><b>나의 예약 확인하기<b/></span>
     	</div>
     		 
	<c:if test="${not empty articleList}"> 
		<c:forEach items="${articleList}" var="article">
			
			
			<table class="table table-striped table-bordered table-hover form-container form-1 form-1" style="text-align:center; padding-left:40%" >
			
				<tr>
					<td>제목</td>
					<td style="text-align:left">${article.subject}</td>
				</tr>
				<tr>	
					<td>이름</td>
					<td style="text-align:left">${article.name}</td>
				</tr>
				<tr>	
					<td>전화번호</td>
					<td style="text-align:left">${article.phone}</td>
				</tr>
				<tr>	
					<td>카드</td>
					<td style="text-align:left">${article.card}</td>
				</tr>
				<tr>	
					<td>작성일자</td>
					<td style="text-align:left">${article.boarddate}</td>
				</tr>
				<tr>	
					<td>email</td>
					<td style="text-align:left">${article.email}</td>
				</tr>
				<tr>	
					<td>공연/전시 시간</td>
					<td style="text-align:left" >${article.performtime}</td>
				</tr>
				<tr>	
					<td>공연/전시 날짜</td>
					<td style="text-align:left">${article.performdate}</td>
				</tr>
				<tr>	
					<td>공연/전시 위치</td>
					<td style="text-align:left">${article.performlocation}</td>
				</tr>
				<tr>	
					<td>공연/전시 지역</td>
					<td style="text-align:left">${article.area}</td>
				</tr>
				<tr>	
					<td>공연/전시 유형</td>
					<td style="text-align:left" >${article.type}</td>
				</tr>
				
			</table>
			
			<div style="text-align:center">	
				<input type=button class="btn btn-danger" value="취소하기" OnClick="window.location='deletereservation.do?num=${article.num}'">
				</div><br>
		
		</c:forEach>
		</c:if>
		<c:if test="${empty articleList}">
		<table class="table table-striped table-bordered table-hover" style="text-align:center">
		 <tr>	
					<td>나의 예매내역이 없습니다</td>
		</tr>
		</table>
		</c:if> 
	</form></div></div>
	<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">오픈소스 전문 프로젝트 &copy; 3조</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
         <script src="js/jquery.dropotron.min.js"></script>
         <script src="js/browser.min.js"></script>
         <script src="js/breakpoints.min.js"></script>
         <script src="js/util.js"></script>
         
</body>
</html>