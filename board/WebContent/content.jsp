<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
 <html>
<head>
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>  
 	 function reply(subject){
 		
	  	location.href="replyform.do?subject="+encodeURI(encodeURIComponent(subject));
 	 }
 	 </script>
</head>

<body>
	<div style="text-align:right">
	사용자ID : ${id} <input type=button class="btn btn-info" value="로그아웃" OnClick="window.location='logout.do'">
	</div>
	<c:forEach items="${articleList}" var="article">
	
	
	<table class="table table-striped table-bordered table-hover" style="text-align:center">
		
		<caption style="text-align:center">공연/전시 정보</caption>
		<tr>
			<th>공연/전시 제목</th>
			<td style="text-align:left">${article.subject}</td>	
			<th>공연/전시 날짜</th>
			<td style="text-align:left">${article.performdate}</td>	
					
		</tr>
		<tr>
			<th>작성자</th>
			<td style="text-align:left">${article.id}</td>	
			<th>email</th>
			<td style="text-align:left">${article.email}</td>						
		</tr>
		<tr>
			<th>공연/전시 내용</th>
			<td colspan="3"style="text-align:left">${article.content}</td>								
		</tr>	
		<tr>
			<th>공연/전시 지역</th>
			<td style="text-align:left">${article.area}</td>
			<th>공연/전시 장소</th>
			<td style="text-align:left">${article.performlocation}</td>					
		</tr>
		<tr>
			<th>공연 분야</th>
			<td style="text-align:left">${article.type}</td>
			<th>조회수</th>
			<td style="text-align:left">${article.score}</td>								
		</tr>
	
	</table>
	<div style="text-align:right">
	<input type=button class="btn btn-warning" value="예약하기" OnClick="window.location='reservationform.do?num=${article.num}'">
	<c:if test="${article.id eq id}">
		<input type=button class="btn btn-danger" value="삭제하기" OnClick="window.location='delete.do?num=${article.num}'">
		
		<input type=button class="btn btn-warning" value="수정하기" OnClick="window.location='modifyform.do?num=${article.num}'">	
		</c:if>	
		<input type=button class="btn btn-warning" value="후기보기" onclick="reply('${article.subject}')">		
		<input type=button class="btn btn-secondary" value="돌아가기" OnClick="window.location='list.do'">
	</div>
	
	<br/><br/><br/>
	<form id="inform" action ="/board/reply.do" method="post">
		<table style="text-align:center" class="table table-striped table-bordered table-hover">
		<caption style="text-align:center">후기 작성하기</caption>
		<input type="hidden" name="subject" value="${article.subject}">
	
		<tr >
			<th>공연 제목</th>
			<td colspan='3'style="text-align:left" name="subject">${article.subject}</th>
				
		</tr>
		<tr >
			<th>제목</th>
			<td colspan='3'style="text-align:left"><textarea name="title" cols="90"  placeholder="제목을 입력하세요" form="inform"></textarea></th>
				
		</tr>
		<tr>
			<th>작성자</th>
			<td style="text-align:left">${id}</td>		
			<th>email</th>
			<td style="text-align:left">${email}</td>					
		</tr>
			
		<tr >
			<th>내용</th>
			<td  colspan='2' style="text-align:left"><textarea name="content" cols="90" rows="5" placeholder="내용을 입력하세요" form="inform"></textarea></td>						
			<td style="vertical-align:bottom">	
					<input type=submit class="btn btn-success" value="등록" Onclick="javascript:writeCheck();">
					<input type=button class="btn btn-secondary" value="취소" OnClick="window.location='list.do'">
					
			</td>
		</tr>
	</c:forEach>
			</table>
			
	</form>	
	
</body>
</html>