<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Playfair+Display&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
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
	<script>
			function OnMouseIn(n){
				n.src="./image/delete_hover.png";
				
			}
			function OnMouseOut(n){
				n.src="./image/delete.png";
				
			}
			function OnMouseIn_1(n){
				
				n.src="./image/edit_hover.png";
			}
			function OnMouseOut_1(n){
			
				n.src="./image/edit.png";
			}
			
		</script>

<div class="container-fluid bg-1">
	<br/><b><i>${id} </i></b>님, 안녕하세요!　

  <div class="btn btn-three" style="margin-right: 10px;" OnClick="window.location='logout.do'">
<span>로그아웃</span>
  </div>
<h1 style="letter-spacing: -1px; font-family: 'Noto Serif KR', serif; text-align: center; margin-top: 100px; margin-bottom: 20px;"><b>댓글보기</b></h1>
</div>
<div class="basicBox" style="margin:10px;" OnClick="javascript:location.href='mainlist.do?';"> 
<p>목록으로 돌아가기</p>
  <svg width="130" height="40" viewBox="0 0 130 40" xmlns="http://www.w3.org/2000/svg">
    <rect x='0' y='0' fill='none' width='130' height='40'/>
  </svg>
</div>
<c:if test="${not empty Replylist}"> 
<c:forEach items="${Replylist}" var="Arrayreply">



<div class="container bg-2 text-center" style="margin-top: 20px;">

<p style="text-align:left; font-size: 25px; font-family: 'Playfair Display', serif; margin-bottom: -1%;" ><b>${Arrayreply.id}</b></p> 
<p style="text-align:right;"> 작성일자: ${Arrayreply.boarddate}</p>
<table style="text-align:center; margin: auto;" class="table table-hover">
		<!--<caption style="text-align:center">댓글 </caption>-->

			<tr>
				<td style="width: 20%;">제목</td>
				<td style="text-align:left">${Arrayreply.title}</td>
				
		</tr>

		<tr >
			<td>내용</td>
			<td style="text-align:left"><textarea readonly="readonly" style="width: 890px; height: 110px; background: none; outline: none; border-bottom: medium none; border-left: medium none; border-right: medium none; border-top: medium none;">${Arrayreply.content}</textarea></td>						
		</tr>
			
		</table>
	</div>

		<div class="container bg-2 text-right" style="margin-top: 20px; margin-bottom: 20px;">
		<c:if test="${Arrayreply.id eq id}">
		<img id="edit" onmouseover="OnMouseIn_1(this)" onmouseout="OnMouseOut_1(this)" src="./image/edit.png" width="40px" height="40px" onclick="window.location='replymodifyform.do?count=${Arrayreply.count}'">
		<img id="delete" style="margin-left: 10px;" onmouseover="OnMouseIn(this)" onmouseout="OnMouseOut(this)" src="./image/delete.png" width="40px" height="40px" onclick="window.location='replydelete.do?count=${Arrayreply.count}'">
		</c:if>	
		</div>

		</c:forEach>
		</c:if>
	<c:if test="${empty Replylist}">
		 <script language=javascript>
				  	self.window.alert("작성된 댓글이 없습니다. 처음 댓글을 남겨주세요!");
				  	location.href="mainlist.do";//원글번호를 받으면 가능할듯?
		 </script>
		
		</c:if> 
	<footer>
    <div class="container">
      <p class="m-0 text-center text-white">오픈소스 전문 프로젝트 &copy; 3조</p>
    </div>
    <!-- /.container -->
  </footer>
</body>