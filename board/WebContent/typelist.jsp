<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <title>공연 보기</title>
    <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <style>
	#up_button{
			
                width: 70px;
                height: 30px;
                border:solid 2px dodgerblue;
                position: fixed;
                bottom: 150px;
                right: 20px;
                text-align: center;
				
           }
    </style>

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



  <div style="background-color:white; margin:30px 60px 30px 60px" >
  	
  </div>
  
<section id="team" class="pb-5" style="border: 1px solid #FFFFFF; height: auto; width:100%   "  >
  	<div class="content"  >
  	<div class="container"  >
  	<div class="row">
  			
  	<div class="col-md-3" style="background-color:grey; text-align:center; margin:20px 0px 40px 0px; padding:0px; border-radius: 2em; " >
  	<div style=" background-color:#F0F0F0 ; margin:0px 0px 0px 0px; padding:30px 10px 30px 10px;  border-radius: 2em; box-shadow: 0px 5px 3px #6a6a6a; " >
        <a href="writeform.jsp" style="text-decoration:none" > <i class="fa fa-pencil" style="color:black; font-size:1.5em; " > </i>
		<font color="black" size="5.5" > &nbsp 글 쓰기  </font>	
        </a>
  	</div>
	
  	<nav class="navbar navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
   

    <!-- Main Menu -->
    <div class="side-menu-container"  >
        <div class="nav navbar-nav" style="font-size:1.2em; margin:50px 10px 30px 20px; text-align:left;  " >

            <div class="active"><a href="list.do" style="text-decoration:none" ><span class="glyphicon glyphicon-plane"  ></span> <font color="white" >공연 전체 보기 </font> </a> <hr> </div>
            
            <div class="panel panel-default" id="dropdown">
            
                <a data-toggle="collapse" href="#dropdown-lvl1" style="text-decoration:none" >
                    <span class="glyphicon glyphicon-user"></span><font color="white"> 분야별 보기 &nbsp <i class="fa fa-sort-desc" style="color:white;" ></i>  </font> <span class="caret"></span>
                </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl1" class="panel-collapse collapse">
                    <div class="panel-body"  style="font-size:0.8em; margin: 10px 20px 20px 20px" >
                        <ul class="nav navbar-nav">
                        
                            <li><a href="javascript:type('뮤지컬')"> <font color="#F0F0F0" > 뮤지컬 </font> </a></li>
                            <li><a href="javascript:type('콘서트')"> <font color="#F0F0F0" > 콘서트 </font> </a></li>
                            <li><a href="javascript:type('연극')"> <font color="#F0F0F0" > 연극 </font> </a></li>
							<li><a href="javascript:type('클래식/무용')"> <font color="#F0F0F0" > 클래식/무용 </font> </a></li>
							<li><a href="javascript:type('스포츠')"> <font color="#F0F0F0" > 스포츠 </font> </a></li>
							<li><a href="javascript:type('레저')"> <font color="#F0F0F0" > 레저 </font> </a></li>
							<li><a href="javascript:type('클래식/무용')"> <font color="#F0F0F0" > 클래식/무용 </font> </a></li>
							<li><a href="javascript:type('전시/행사)"> <font color="#F0F0F0" > 전시/행사 </font> </a></li>
							<li><a href="javascript:type('아동/가족')"> <font color="#F0F0F0" > 아동/가족 </font> </a></li>
							<li><a href="javascript:type('기타')"> <font color="#F0F0F0" > 기타 </font> </a></li>

                        </ul>
                    </div>
                </div>
                <hr>
            </div>
            <!-- Dropdown-->
            <div class="panel panel-default" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl2" style="text-decoration:none" > 
                    <span class="glyphicon glyphicon-user"></span> <font color="white" > 지역별 보기 &nbsp  </font> 
                   
               		<span class="caret"></span><font color="white" > <i class="fa fa-sort-desc" style="color:white;" ></i> </font> 
               </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl2" class="panel-collapse collapse">
                    <div class="panel-body" style="font-size:0.8em; margin: 10px 20px 20px 20px" >
                        <ul class="nav navbar-nav" >
							<li><a href="javascript:area('서울특별시')"> <font color="#F0F0F0" > 서울특별시</font></a></li>
	  						<li><a href="javascript:area('부산광역시')"> <font color="#F0F0F0" > 부산광역시</font></a></li>
	   						<li><a href="javascript:area('인천광역시')"> <font color="#F0F0F0" > 인천광역시</font></a></li>
	   						<li><a href="javascript:area('대구광역시')"> <font color="#F0F0F0" > 대구광역시</font></a></li>
	   						<li><a href="javascript:area('광주광역시')"> <font color="#F0F0F0" > 광주광역시</font></a></li>
	  						<li><a href="javascript:area('대전광역시')"> <font color="#F0F0F0" > 대전광역시</font></a></li>
	 			 			<li><a href="javascript:area('울산광역시')"> <font color="#F0F0F0" > 울산광역시</font></a></li>
				   			<li><a href="javascript:area('세종특별자치시')"> <font color="#F0F0F0" > 세종특별자치시</font></a></li>
	 			  			<li><a href="javascript:area('경기도')"> <font color="#F0F0F0" > 경기도</font></a></li>
	 			 			<li><a href="javascript:area('강원도')"> <font color="#F0F0F0" > 강원도</font></a></li>
				  		 	<li><a href="javascript:area('충청남도')"> <font color="#F0F0F0" > 충청남도</font></a></li>
				  			<li><a href="javascript:area('충청북도')"> <font color="#F0F0F0" > 충청북도</font></a></li>
				  			<li><a href="javascript:area('경상북도')"> <font color="#F0F0F0" > 경상북도</font></a></li>
				  			<li><a href="javascript:area('경상남도')"> <font color="#F0F0F0" > 경상남도</font></a></li>
				   			<li><a href="javascript:area('전라북도')"> <font color="#F0F0F0" > 전라북도</font></a></li>
				   			<li><a href="javascript:area('전라남도')"> <font color="#F0F0F0" > 전라남도</font></a></li>
				   			<li><a href="javascript:area('제주도')"> <font color="#F0F0F0" > 제주도</font></a></li>
                        </ul>
                    </div>
                </div>
		 </div>
        </div>
    	</div><!-- /.navbar-collapse -->
    	
		</nav>
  		
  		</div>
  		
  				<div class="col-md-9" >
  					<div class="control-box p-3 main-content">
  					<div>
  					<div class="container">
					<div class="row"  >
  					<h2 style="padding:10px 0px 10px 20px;" > 분야별 보기 : ${types} </h2>
  					</div>
					 <div  class="card-body row no-gutters align-items-center">
                               
				<form action="/board/list.do" method="post">
					<select name="opt">
						<option value="0">전시/공연 제목</option>
						<option value="1">내용</option>
						<option value="2">작성자</option>
					</select>
					<input type="text" size="20" name="condition"/>
					<input class="btn btn-lg btn-success" type="submit" value="검색"/>
				</form>
			</div>
                    	
					</div>
  					</div>
  					
  					
  					<c:if test="${not empty articleList}">
					<c:forEach items="${articleList}" var="article" begin="0" > 	
						<hr>									
  						<div class="row" style="padding:30px 0px 30px 30px" >

  						      <div class="col-lg-5">
        						<img class="img-fluid rounded" src="./img/${article.imgpath}" alt="" style="width:100%; height:50%" >
     						 </div>
      						<div class="col-lg-7" >
      							<h3> ${article.subject} </h3>
        						<p>${article.content}</p>
        						<ul>
          						<li>${article.performdate}</li>
          						<li>${article.performlocation}</li>
          						<li>${article.performtime}</li>
       							 </ul>
       								<div style="position:absolute; right:10px; bottom:10px;" > 
       									<a href="content.do?num=${article.num}" title="Read more" class="read-more" >Read more<i class="fa fa-angle-double-right ml-2"></i></a>
									</div>
   							 </div>	
   							  
   						</div>	
   						
   							
  					</c:forEach>
  					</c:if> 
  								<c:if test="${empty articleList}">
		 <tr>
			<th style="text-align:center;">해당 분야의 예정 공연/전시가 없습니다</th>
		</tr>
		
		</c:if>		
		<hr>
		<c:set var="a" value="${number}" scope="session"/>	
    			<c:set var="b" value="${_size}" scope="session"/>	
				<nav aria-label="Page navigation example"  >
  						<ul class="pagination" style="padding-left:20px"  >
    						
    						<c:if test="${a>1}" >
    						<li class="page-item">
      							<a class="page-link" href="list.do?number=${_number}" aria-label="Previous">
        							<span aria-hidden="true">«</span>
        							<span class="sr-only">Previous</span>
     							 </a>
    						</li>
    						</c:if>
    					<c:forEach  var="i" begin="1" end="${_size}" >	
    						<c:if test="${i==a}">
    							<li class="page-item active"><a class="page-link" href="list.do?number=${i}" >${i}</a></li>
							</c:if> 
 							<c:if test="${i!=a}">
    							<li class="page-item"><a class="page-link" href="list.do?number=${i}">${i}</a></li>
							</c:if> 
    					</c:forEach>
    						
    					<c:if test="${a<b}">
   						 <li class="page-item">
     						 <a class="page-link" href="list.do?number=${number_}" aria-label="Next">
       							 <span aria-hidden="true">»</span>
      							  <span class="sr-only">Next</span>
    						  </a>
    					</li>
    					</c:if>
 					 </ul>
					</nav>
  					</div>

				</div>
  				
  			</div>
  		</div>
  	</div>
  	
  	</section>
  	  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">오픈소스 전문 프로젝트 &copy; 3조</p>
    </div>
    <!-- /.container -->
  </footer>
  	<div id="up_button"><a class="jb-wrap"href="#">top</a></div>
  	
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

    