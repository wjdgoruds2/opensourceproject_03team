<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
 <html>
<head>
<title>게시판</title>
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
 	 function reply(subject){
 		
	  	location.href="replyform.do?subject="+encodeURI(encodeURIComponent(subject));
 	 }
 	 
	function writeCheck(){
 	 var form = document.writeform;
 	 
 		if( !form.title.value ){
		alert( "제목을 적어주세요" );
   		form.subject.focus();
   		return;
  		}
 		if( !form.content.value ){
   		alert( "내용을 적어주세요" );
   		form.content.focus();
   		return;
 	 	}  
	 form.submit();
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

<br/>
<br/>
	<c:forEach items="${articleList}" var="article">
	
<div class="container my-5">

  <!-- Grid row -->
  <div class="row">

    <!-- Grid column -->
    <div class="col-md-12">

      <div class="card ">
        <div class="card-body p-4">

          <!-- Grid row -->
          <div class="row">

            <!-- Grid column -->
            <div class="col-lg-4">

            

              <div class="media mb-3">
                <img src="./img/${article.imgpath}" alt="${article.imgpath}" width="300" height="400" class="d-flex mr-3">
              </div>
             
              <hr class="blue-border mb-4">
              
              <div style="text-align:center">
                <c:if test="${article.id eq id}">
				<input type=button class="btn btn-danger btn-lg" value="삭제하기" OnClick="window.location='delete.do?num=${article.num}'">
				<input type=button class="btn btn-warning btn-lg" value="수정하기" OnClick="window.location='modifyform.do?num=${article.num}'">	
				</c:if>	
              </div>

            </div>
            <!-- Grid column -->

            <!-- Grid column -->
            <div class="col-lg-8">

              <h3 class="mb-4 py-2 mt-lg-0 mt-4 text-center font-weight-bold text-uppercase">공연/전시 내용</h3>
	
             
              

  

<!-- Table with panel -->
          <table class="table table-striped table-bordered " style="text-align:center;height:300px"  >
		
		
		
		<tr>
			<th class="table-danger">공연/전시 제목</th>
			<td style="text-align:left" >${article.subject}</td>	
			<th class="table-danger">공연/전시 날짜</th>
			<td style="text-align:left">${article.performdate}</td>	
					
		</tr>
		<tr>
			<th class="table-primary">작성자</th>
			<td style="text-align:left">${article.id}</td>	
			<th class="table-primary">email</th>
			<td style="text-align:left">${article.email}</td>						
		</tr>
		<tr>
			<th class="table-danger">공연/전시 내용</th>
			<td colspan="3"style="text-align:left">${article.content}</td>								
		</tr>	
		<tr>
			<th class="table-primary">공연/전시 지역</th>
			<td style="text-align:left">${article.area}</td>
			<th class="table-primary">공연/전시 장소</th>
			<td style="text-align:left">${article.performlocation}</td>					
		</tr>
		<tr>
			<th class="table-danger">공연 분야</th>
			<td style="text-align:left">${article.type}</td>
			<th class="table-danger">조회수</th>
			<td style="text-align:left">${article.score}</td>								
		</tr>

	</table>
                <!-- Grid row -->

                </form><br><br>
                <button type="button" class="btn btn-primary btn-lg btn-block mb-lg-0 mb-5" OnClick="window.location='reservationform.do?num=${article.num}'">예약하기</button><br><br>
                <div style="text-align:right">
                <input type=button class="btn btn-info btn-lg" value="댓글보기" onclick="reply('${article.subject}')">	
                <input type=button class="btn btn-secondary btn-lg" value="돌아가기" OnClick="window.location='mainlist.do'">
            	</div>

            </div>
            <!-- Grid column -->

          </div>
          <!-- Grid row -->

        </div>
      </div>

    </div>
    <!-- Grid column -->

  </div>
  <!-- Grid row -->

</div>
	
<br/>
	
	<form id="inform" action ="/board/reply.do" method="post" name="writeform" >
		<h3 class="mb-4 py-2 mt-lg-0 mt-4 text-center font-weight-bold text-uppercase">댓글 작성하기</h3>
		<table style="text-align:center" class="table  table-striped  table-bordered ">
		
		<input type="hidden" name="subject" value="${article.subject}">
	
		<tr >
			<th class="table-danger">공연 제목</th>
			<td colspan='3'style="text-align:left" name="subject">${article.subject}</th>
				
		</tr>
		<tr >
			<th class="table-primary">제목</th>
			
			<td colspan='3'style="text-align:left"><input type="text" name="title"  cols="90"  placeholder="제목을 입력하세요" form="inform"></td>
		
		</tr>
		<tr>
			<th class="table-danger">작성자</th>
			<td style="text-align:left">${id}</td>		
			<th class="table-danger">email</th>
			<td style="text-align:left">${email}</td>					
		</tr>
			
		<tr >
			<th class="table-primary">내용</th>
			<td  colspan='2' style="text-align:left"><textarea name="content" cols="90" rows="5" placeholder="내용을 입력하세요" form="inform"></textarea></td>						
			<td style="vertical-align:bottom">	
					<input type=button class="btn btn-success btn-lg" value="등록" Onclick="javascript:writeCheck();">
					<input type=button class="btn btn-secondary btn-lg" value="취소" OnClick="window.location='mainlist.do'">
					
			</td>
		</tr>
	</c:forEach>
	</table>
			
	</form>	
	  	  <!-- Footer -->
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