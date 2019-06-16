<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %> 
<%@ page import="java.sql.*" %> 
		
	<script > 
	
	function writeCheck()
 	 {
  	 var form = document.writeform;
   
  	if( !form.subject.value ){
	alert( "제목을 적어주세요" );
    form.subject.focus();
    return true;
   	}
 
  	if( !form.content.value ){
    alert( "내용을 적어주세요" );
    form.content.focus();
    return true;
  	 }  
  	
 	 form.submit();
  	}
	
	
	 </script>
<html>
<head>
	 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
 
	<form id="inform" enctype="multipart/form-data"  action ="/board/write.do" method="post" name="writeform" >
		<table style="text-align:center" class="table table-striped table-bordered table-hover">
			<caption style="text-align:center">게시판 작성</caption>
			<tr >
				<th>공연제목</th>
				<th style="text-align:left"><input type="text" name="subject"></th>
				
			</tr>
			<tr>
				<th>작성자</th>
				<th style="text-align:left">${id} </th>
			</tr>
			<tr>
				<th>email</th>
				<th style="text-align:left">${email}</th>
			</tr>
			<tr>	
				<th>공연내용</th>
				<th style="text-align:left"><textarea name="content"  cols="90" rows="5" placeholder="내용을 입력하세요" form="inform"></textarea></th>
			</tr>
			<tr >
				<th>공연지역</th>
				<th style="text-align:left">
				<select name="area">
	  			<option selected value="서울특별시">서울특별시</option>
	  			<option selected value="부산광역시">부산광역시</option>
	   			<option selected value="인천광역시">인천광역시</option>
	   			<option selected value="대구광역시">대구광역시</option>
	   			<option selected value="광주광역시">광주광역시</option>
	  			<option selected value="대전광역시">대전광역시</option>
	  			<option selected value="울산광역시">울산광역시</option>
	   			<option selected value="세종특별자치시">세종특별자치시</option>
	   			<option selected value="경기도">경기도</option>
	  			<option selected value="강원도">강원도</option>
	  		 	<option selected value="충청남도">충청남도</option>
	  			<option selected value="충청북도">충청북도</option>
	  			<option selected value="경상북도">경상북도</option>
	  			<option selected value="경상남도">경상남도</option>
	   			<option selected value="전라북도">전라북도</option>
	   			<option selected value="전라남도">전라남도</option>
	   			<option selected value="제주도">제주도</option>
	   			<option selected value="">--공연/전시 지역--</option>
	   			</select>
				</th>
				
			</tr> 	
			
			<tr>	
				<th>공연장소</th>
				<th style="text-align:left"><input type="text" name="performlocation"></th>
			</tr>
			<tr>	
				<th>공연날짜</th>
				<th style="text-align:left"><input type="date" name="performdate"></th>
			</tr>
			<tr>	
				<th>공연시간</th>
				<th style="text-align:left"><input type="text" name="performtime"></th>
			</tr>
			<tr>	
				<th>분야</th>
				<th style="text-align:left">
				<select name="type">
	   				<option selected value="뮤지컬">뮤지컬</option>
	   				<option selected value="콘서트">콘서트</option>
	   				<option selected value="연극">연극</option>
	   				<option selected value="클래식/무용">클래식/무용</option>
	   				<option selected value="스포츠">스포츠</option>
	   				<option selected value="레저">레저</option>
	   				<option selected value="전시/행사">전시/행사</option>
	   				<option selected value="아동/가족">아동/가족</option>
	   				<option selected value="기타">기타</option>
	   				<option selected value="">--공연/전시 분야--</option>
				</th>
			</tr> 
			 <tr>
				<th>첨부 이미지</th>
				<th style="text-align:left"><input type="file" name="imgpath"></th>
			</tr>
			<tr>
				<th></th>
				<th style="text-align:right">	
					<input type=button class="btn btn-success" value="등록" Onclick="javascript:writeCheck();">
					<input type=button class="btn btn-secondary" value="취소" OnClick="window.location='mainlist.do'">
				</th>
			</tr>
		</table>
	</form></div></div>
	<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">오픈소스 전문 프로젝트 &copy; 3조</p>
    </div>
    <!-- /.container -->
  </footer>
  	
  	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/b4aae4cb0e.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/leafo/sticky-kit/v1.1.2/jquery.sticky-kit.min.js"></script>
    <script type="text/javascript">
    	$(".sidebar").stick_in_parent();
    </script>
</body>
</html>