<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
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
	<form >
	<ul>
            <li><a href="list.do">공연 전체 보기</a></li>
           <li><a href="javascript:area('서울특별시')">지역별 보기</a></li>
            <li><a href="javascript:type('뮤지컬')">분야별 보기</a></li>
            <li><a href="myreservation.do">나의 예약확인하기</a></li>
            
     </ul>
	<c:if test="${not empty articleList}"> 
		<c:forEach items="${articleList}" var="article">
			<table class="table table-striped table-bordered table-hover" style="text-align:center">
			<caption style="text-align:center">나의 예매내역</caption>		
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
		
		</c:forEach>
		</c:if>
		<c:if test="${empty articleList}">
		<table class="table table-striped table-bordered table-hover" style="text-align:center">
		 <caption style="text-align:center">나의 예매내역</caption>	
		 <tr>	
					<td>예매내역이 없습니다</td>
		</tr>
		</table>
		</c:if> 
	</form>
</body>
</html>