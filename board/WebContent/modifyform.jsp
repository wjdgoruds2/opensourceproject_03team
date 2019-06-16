<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script> 
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
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Playfair+Display&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
	<title>댓글 수정</title>
	
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

footer{
	padding: 40px;
	height: 100px;
	background-color: gray;
	color: white;
	text-align: center;
}
</style>
	
</head>
<body>
<div class="container-fluid bg-1">
	<br/><b><i>${id} </i></b>님, 안녕하세요!　

  <div class="btn btn-three" style="margin-right: 10px;" OnClick="window.location='logout.do'">
<span>로그아웃</span>
  </div>
<h1 style="letter-spacing: -1px; font-family: 'Noto Serif KR', serif; text-align: center; margin-top: 100px; margin-bottom: 20px;"><b>게시판 수정</b></h1>
</div>


<div class="container bg-2 text-center" style="margin-top: 30px;">
		<form action ="/board/modify.do" enctype="multipart/form-data" method="post" name="writeform">
		<c:forEach items="${articleList}" var="article">
				<input type="hidden" name="num" value="${article.num}">
			<table class="table table-striped table-bordered table-hover" style="text-align:center">		
				<tr>
					<td>제목</td>
					<td style="text-align:left"><input type="text" name="subject" value="${article.subject}"></td>
				</tr>
				<tr>	
					<td>작성자</td>
					<td style="text-align:left">${article.id}</td>
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
					<td>내용</td>
					<td style="text-align:left"><textarea name="content"  cols="90" rows="5" placeholder="내용을 입력하세요" >${article.content}</textarea></td>
				</tr>
				<tr>
				<th>공연지역</th>
				<th style="text-align:left" >
				<select name="area" >
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
	   			<option selected value="${article.area}">${article.area}</option>
	   			</select>
				</th>
				</tr> 	
			
			<tr>	
				<th>공연장소</th>
				<th style="text-align:left"><input type="text" name="performlocation" value="${article.performlocation}"></th>
			</tr>
			<tr>	
				<th>공연날짜</th>
				<th style="text-align:left"><input type="date" name="performdate" value="${article.performdate}"></th>
			</tr>
			<tr>	
				<th>공연시간</th>
				<th style="text-align:left"><input type="text" name="performtime" value="${article.performtime}"></th>
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
	   				<option selected value="${article.type}">${article.type}</option>
				</th>
			</tr> 
			<tr>
				<th>첨부 이미지</th>
				<th style="text-align:left"> <input type="file" name="imgpath" value="${article.imgpath}" >
					<input type="hidden" name="imgpath1" value="${article.imgpath}">
				</th>
											
			</tr>	
				<tr>
					<td></td>
					<td style="text-align:right">
						<input type=button class="btn btn-warning" value="수정" Onclick="javascript:writeCheck();">
						<input type=button class="btn btn-secondary" value="취소" OnClick="window.location='content.do?num=${article.num}'">
					</td>
				</tr>
					
			</table>
		
		</c:forEach>
	</form>
	</div>
<footer>
    <div class="container">
      <p class="m-0 text-center text-white">오픈소스 전문 프로젝트 &copy; 3조</p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>