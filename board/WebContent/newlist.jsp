<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   


<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  
  
    <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
  <link href="css/card-flipper.css" rel="stylesheet">
    <link href="css/card.css" rel="stylesheet">
    <link href="css/flipper.css" rel="stylesheet">
        <link href="css/footer.css" rel="stylesheet">
  
  <!------ Include the above in your HEAD tag ---------->
     <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	

  <title> 문화/정보 사이트 </title>
<script>
  
function types(_type){
	  	location.href="contenttype.do?type="+encodeURI(encodeURIComponent(_type));
 	 }
 function reply(subject){
	
 	location.href="replyform.do?subject="+encodeURI(encodeURIComponent(subject));
 }
  function area(_area){
	location.href="contentarea.do?area="+encodeURI(encodeURIComponent(_area));
}

$('#carouselExample').on('slide.bs.carousel', function (e) {

  
    var $e = $(e.relatedTarget);
    var idx = $e.index();
    var itemsPerSlide = 3;
    var totalItems = $('.carousel-item').length;
    
    if (idx >= totalItems-(itemsPerSlide-1)) {
        var it = itemsPerSlide - (totalItems - idx);
        for (var i=0; i<it; i++) {
            // append slides to end
            if (e.direction=="left") {
                $('.carousel-item').eq(i).appendTo('.carousel-inner');
            }
            else {
                $('.carousel-item').eq(0).appendTo('.carousel-inner');
            }
        }
    }
});





  $(document).ready(function() {
/* show lightbox when clicking a thumbnail */
    $('a.thumb').click(function(event){
      event.preventDefault();
      var content = $('.modal-body');
      content.empty();
        var title = $(this).attr("title");
        $('.modal-title').html(title);        
        content.html($(this).html());
        $(".modal-profile").modal({show:true});
    });

  });
  
//optional
	$('#blogCarousel').carousel({
			interval: 5000
	});
	  
 	 function reply(subject){
 		
	  	location.href="replyform.do?subject="+encodeURI(encodeURIComponent(subject));
 	 }
</script>
</head>



<body>

  <!-- Navigation -->
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

<section id="team" class="pb-5" style="border: 1px solid #FFFFFF; height: auto; width: 85%; margin:auto; " >
<div class="container-fluid">
<h2   style="padding: 0px 0px 0px 50px"> 최근 올라온 공연   &nbsp </h2>
<br/>
<div>
            <div class="row blog" style="background-color:#E0E0E0; margin:0px 5px 0px 5px; padding: 20px 10px 20px 10px; " >
                <div class="col-md-12"  >
                    <div id="blogCarousel" class="carousel slide" data-ride="carousel">

                        <ol class="carousel-indicators"   >
                            <li data-target="#blogCarousel" data-slide-to="0" class="active"  ></li>
                            <li data-target="#blogCarousel" data-slide-to="1"></li>
                        </ol>
                        

                        <!-- Carousel items -->
                        <div class="carousel-inner">

                       <div class="carousel-item active">
                       <div class="row" style="background-color:white; padding: 20px 10px 20px 10px; "   >
                                
                          <c:forEach items="${articleList}" var="article" begin="0" end="3" > 
                                <div class="col-md-3">
                                <div class="box19">
                       			<img src="./img/${article.imgpath}" style="height: 80%; width: 100%;" >
                        		<div class="box-content">
                        		<h3 class="title">${article.subject}</h3>
                        		<br/><br/>
                        		<p class="title" > 
									<font size="3" color="white" >
                            		${article.performdate}<br/>
                            		${article.performlocation}<br/>
                            		</font>
                            		</p>
                            			<ul class="icon" style="position:absolute; right:30%; bottom:10% " >
                                			<li><a href="content.do?num=${article.num}"><i class="fa fa-search" style=" padding:2px 0px 10px 0px; " ><br/>

                                			<font size="1.5" color="white"  ><br/> 더보기 </font>
								
											</i></a></li>
                                			<li><a onclick="reply('${article.subject}')";>
                                			<i class="fa fa-commenting-o" style=" padding:2px 0px 10px 0px; "><br/><font size="1" color="white" > <br/> 댓글</font> </i></a></li>
                            			</ul>
                            
                        				</div>
                    					</div>
                                    </div>
                                    </c:forEach>
                                    

                            </div>
                                <!--.row-->
                            </div>
                            <!--.item-->

                            <div class="carousel-item">
                                <div class="row" style="background-color:white; padding: 20px 10px 20px 10px; "  >
                                    <c:forEach items="${articleList}" var="article" begin="4" end="7" > 
                                <div class="col-md-3">
                                <div class="box19">
                       			<img src="./img/${article.imgpath}" style="height: 80%; width: 100%;" >
                        		<div class="box-content">
                        		<h3 class="title">${article.subject}</h3>
                        		<br/><br/>
                        		<p class="title" > 
									<font size="3" color="white" >
                            		${article.performdate}<br/>
                            		${article.performlocation}<br/>
                            		</font>
                            		</p>
                            			<ul class="icon" style="position:absolute; right:30%; bottom:10% " >
                                			<li><a href="content.do?num=${article.num}"><i class="fa fa-search" style=" padding:2px 0px 10px 0px; " ><br/>

                                			<font size="1.5" color="white"  ><br/> 더보기 </font>
								
											</i></a></li>
                                			<li><a href="replyform.do?subject=${article.subject}";>
                                			<i class="fa fa-commenting-o" style=" padding:2px 0px 10px 0px; "><br/><font size="1" color="white" > <br/> 댓글</font> </i></a></li>
                            			</ul>
                            
                        				</div>
                    					</div>
                                    </div>
                                    </c:forEach>
                                </div>
                                <!--.row-->
                            </div>
                            <!--.item-->

                        </div>
                        <!--.carousel-inner-->
                    </div>
                    <!--.Carousel-->

                </div>
            </div>
</div>
</div>
<br/>

<div class="wrapper" style="background-color:#E0E0E0; margin:10px 30px 0px 30px; padding: 20px 0px 20px 0px; right:50%;text-align:center;  " >	
	<p> <font size="4" color="grey" > <i> < 더보기 > </i> </font> </p>
	<div class="container">
	<div style="text-align:center">
		<input class="btn btn-secondary" type="submit" value="최신순으로 보기"   OnClick="window.location='list.do'" style="background-color:grey; margin:0px 15px 0px 15px; padding: 10px 70px 10px 70px; text-align:center; " />
		<input class="btn btn-secondary" type="submit" value="분야별로 보기"  OnClick="javascript:types('뮤지컬')" style="background-color:grey; margin:0px 15px 0px 15px; padding: 10px 70px 10px 70px; text-align:center; " />
		<input class="btn btn-secondary" type="submit" value="지역별으로 보기"  OnClick="javascript:area('서울특별시')" style="background-color:grey; margin:0px 15px 0px 15px; padding: 10px 70px 10px 70px; text-align:center; " />	
	</div>

	</div>
</div>

</section>

<br/>
<br/>

<section id="what-we-do"  style="border: 1px solid #FFFFFF; background-color:#F0F0F0; height: auto; width: 85%; margin:auto; "  >
		<div class="container-fluid">
			<h2   style="padding: 0px 0px 0px 50px"> 최근 올라온  댓글 </h2>
			<div class="row mt-5"  style="background-color:#E0E0E0; margin:0px 0px 0px 5px; padding: 20px 10px 0px 10px; " >
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-4">
							<h3 class="card-title" >${Replylist[0].title} 
							<p style="text-align:right" ><font size="2" color=grey > ${Replylist[0].subject} &nbsp&nbsp </font></p>
							</h3>
							<p class="card-text"> <font size="4" ><i> ${Replylist[0].content}</i> </font> </p>
							
							<a onclick="reply('${Replylist[0].subject}')" title="Read more" class="read-more" >Read more<i class="fa fa-angle-double-right ml-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-5">
							<h3 class="card-title" >${Replylist[1].title} 
							<p style="text-align:right" ><font size="2" color=grey > ${Replylist[1].subject} &nbsp&nbsp </font></p>
							</h3>
							<p class="card-text"> <font size="4" ><i> ${Replylist[1].content}</i> </font> </p>
							
							<a onclick="reply('${Replylist[1].subject}')" title="Read more" class="read-more" >Read more<i class="fa fa-angle-double-right ml-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-2">
							<h3 class="card-title" >${Replylist[2].title} 
							<p style="text-align:right" ><font size="2" color=grey > ${Replylist[2].subject} &nbsp&nbsp </font></p>
							</h3>
							<p class="card-text"> <font size="4" ><i> ${Replylist[2].content}</i> </font> </p>
							
							<a onclick="reply('${Replylist[2].subject}')" title="Read more" class="read-more" >Read more<i class="fa fa-angle-double-right ml-2"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="background-color:#E0E0E0; margin:0px 5px 0px 5px; padding: 0px 10px 20px 10px; " >
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-4">
							<h3 class="card-title" >${Replylist[3].title} 
							<p style="text-align:right" ><font size="2" color=grey > ${Replylist[3].subject} &nbsp&nbsp </font></p>
							</h3>
							<p class="card-text"> <font size="4" ><i> ${Replylist[3].content}</i> </font> </p>
							
							<a onclick="reply('${Replylist[3].subject}')" title="Read more" class="read-more" >Read more<i class="fa fa-angle-double-right ml-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-5">
							<h3 class="card-title" >${Replylist[4].title} 
							<p style="text-align:right" ><font size="2" color=grey > ${Replylist[4].subject} &nbsp&nbsp </font></p>
							</h3>
							<p class="card-text"> <font size="4" ><i> ${Replylist[4].content}</i> </font> </p>
							
							<a onclick="reply('${Replylist[4].subject}')" title="Read more" class="read-more" >Read more<i class="fa fa-angle-double-right ml-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
					<div class="card">
						<div class="card-block block-2">
							<h3 class="card-title" >${Replylist[5].title} 
							<p style="text-align:right" ><font size="2" color=grey > ${Replylist[5].subject} &nbsp&nbsp </font></p>
							</h3>
							<p class="card-text"> <font size="4" ><i> ${Replylist[5].content}</i> </font> </p>
							
							<a onclick="reply('${Replylist[5].subject}')" title="Read more" class="read-more" >Read more<i class="fa fa-angle-double-right ml-2"></i></a>
						</div>
					</div>
				</div>
				
			</div>
		</div>	
	</section>


    <hr>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">오픈소스 전문 프로젝트 &copy; 3조</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>

</html>
    