<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
 <html>
<head>
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<div style="text-align:right">
	사용자ID : ${id} <input type=button class="btn btn-info" value="로그아웃" OnClick="window.location='logout.do'">
	</div>
	<c:forEach items="${articleList}" var="article">
	<table class="table table-striped table-bordered table-hover" style="text-align:center">
		
		<caption style="text-align:center">게시판 내용</caption>
		<tr>
			<td>제목</td>
			<td style="text-align:left">${article.subject}</td>			
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
			<td>조회수</td>
			<td style="text-align:left">${article.score}</td>						
		</tr>
		<tr>
			<td>email</td>
			<td style="text-align:left">${article.email}</td>						
		</tr>		
		<tr>
			<td>내용</td>
			<td style="text-align:left">${article.content}</td>						
		</tr>
	
	</table>
	<div style="text-align:right">
	<c:if test="${article.id eq id}">
		<input type=button class="btn btn-danger" value="삭제하기" OnClick="window.location='delete.do?num=${article.num}'">
		
		<input type=button class="btn btn-warning" value="수정하기" OnClick="window.location='modifyform.do?num=${article.num}'">	
		</c:if>	
		<input type=button class="btn btn-warning" value="후기보기" onclick="location.href='replyform.do?subject=${article.subject}'">		
		<input type=button class="btn btn-secondary" value="돌아가기" OnClick="window.location='list.do'">
	</div>
	<form id="inform" action ="/board/reply.do" method="post">
		<table style="text-align:center" class="table table-striped table-bordered table-hover">
		<input type="hidden" name="subject" value="${article.subject}">
		<caption style="text-align:center">후기달기 </caption>
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