<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
 <html>
<head>

<title>전시/공연 정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
   

  ul {
		
      text-align: center; 
      border :5px dotted red;
		background-color: pink;
      padding:20px;
  
  }
  ul li {
		
      display: inline;
      padding:20px;
  }
  ul li a {
      text-decoration: none;

  }
  ul li a:hover {
	
      padding: 20px;
      background-color: purple;
      color: white;
  }
   #nav {
  			 	text-align: center; 
     			 border :1px solid black;
     			padding:20px;
                width: 15%;
                float: left;
                height: 255%;
                
            }
   #content {
                width: 85%;
                float: right;
                height: 255%;
            }
  </style>

  <script>  
 	 function area(_area){
	  	location.href="contentarea.do?area="+encodeURI(encodeURIComponent(_area));
 	 }
 	
 	 function type(_type){
	  	location.href="contenttype.do?type="+encodeURI(encodeURIComponent(_type));
 	 }
 	 </script>
</head>

<body>
	<div style="text-align:right">
		사용자ID : ${id} <input type=button class="btn btn-info" value="로그아웃" OnClick="window.location='logout.do'">
	</div>

	<ul>
            <li><a href="list.do">공연 전체 보기</a></li>
            <li><a href="javascript:area('서울특별시')">지역별 보기</a></li>
            <li><a href="javascript:type('뮤지컬')">분야별 보기</a></li>
            <li><a href="myreservation.do?">나의 예약확인하기</a></li>
            
     </ul>
     <div id="nav">
     <p><b>★지역</b></p><br>
     <dl>
            <dt><a href="javascript:area('서울특별시')">서울특별시</a></dt><hr>
            <dt><a href="javascript:area('부산광역시')">부산광역시</a></dt><hr>
            <dt><a href="javascript:area('인천광역시')">인천광역시</a></dt><hr>
            <dt><a href="javascript:area('대구광역시')">대구광역시</a></dt><hr>
            <dt><a href="javascript:area('광주광역시')">광주광역시</a></dt><hr>
            <dt><a href="javascript:area('대전광역시')">대전광역시</a></dt><hr>
            <dt><a href="javascript:area('울산광역시')">울산광역시</a></dt><hr>
            <dt><a href="javascript:area('세종특별자치시')">세종특별자치시</a></dt><hr>
            <dt><a href="javascript:area('경기도')">경기도</a></dt><hr>
            <dt><a href="javascript:area('강원도')">강원도</a></dt><hr>
            <dt><a href="javascript:area('충청남도')">충청남도</a></dt><hr>
            <dt><a href="javascript:area('충청북도')">충청북도</a></dt><hr>
            <dt><a href="javascript:area('경상북도')">경상북도</a></dt><hr>
            <dt><a href="javascript:area('경상남도')">경상남도</a></dt><hr>
            <dt><a href="javascript:area('전라북도')">전라북도</a></dt><hr>
            <dt><a href="javascript:area('전라남도')">전라남도</a></dt><hr>
            <dt><a href="javascript:area('제주도')">제주도</a></dt>
            
            
     </dl>
    </div>
     <div id="content">
	<table class="table table-striped table-bordered table-hover" id="home">
		<caption style="text-align:center"> 전시/공연 정보 </caption>
		<c:if test="${not empty articleList}"> 	
			<c:forEach items="${articleList}" var="article">
		<tr>
			<th style="text-align:center">지역</th>
			<th style="text-align:center">전시/공연 제목</th>
			<th style="text-align:center">작성자</th>
			<th style="text-align:center">작성일자</th>
			<th style="text-align:center">조회수</th>
		</tr>
		
		<tr>
			<th style="text-align:center">${article.area}</th>
			<th style="text-align:left"><a href="content.do?num=${article.num}">
			${article.subject}</a></th>
			<th style="text-align:center">${article.id}</th>
			<th style="text-align:center">${article.boarddate}</th>
			<th style="text-align:center">${article.score}</th>			
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty articleList}">
		 <tr>
			<th style="text-align:center">해당 지역의 예정 공연/전시가 없습니다</th>
		</tr>
		
		</c:if> 
		</table>				
			<div id="searchForm" style="text-align:center">
				<form>
					<select name="opt">
						<option value="0">전시/공연 제목</option>
						<option value="1">내용</option>
						<option value="2">작성자</option>
					</select>
					<input type="text" size="20" name="condition"/>
					<input class="btn btn-secondary" type="submit" value="검색"/>
				</form>
			</div>
		</div>
</body>
</html>