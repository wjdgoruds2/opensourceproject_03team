<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
<body>
<div style="text-align:right">
사용자ID : ${id} <input type=button class="btn btn-info" value="로그아웃" OnClick="window.location='logout.do'"><br/><br/>
<input  type=button class="btn btn-danger" value="목록으로 돌아가기" OnClick="window.location='list.do?'">
</div>

<c:if test="${not empty Replylist}"> 
<c:forEach items="${Replylist}" var="Arrayreply">
<table style="text-align:center" class="table table-striped table-bordered table-hover">
		<caption style="text-align:center">댓글 </caption>
		
		<tr >
				<td>번호</td>
				<td style="text-align:left">${Arrayreply.count}</td>
				<td>제목</td>
				<td colspan='2' style="text-align:left">${Arrayreply.title}</td>
				
		</tr>
		<tr>
			<td>작성자</td>
			<td style="text-align:left">${Arrayreply.id}</td>		
			<td>작성일자</td>
			<td style="text-align:left">${Arrayreply.boarddate}</td>					
		</tr>
			
		<tr >
			<td>내용</td>
			<td  colspan='3' style="text-align:left">${Arrayreply.content}</td>						
		</tr>
			
		</table>
		<div style="text-align:right">
		<c:if test="${Arrayreply.id eq id}">
			<input type=button class="btn btn-danger" value="삭제하기" OnClick="window.location='replydelete.do?count=${Arrayreply.count}'">
			<input type=button class="btn btn-warning" value="수정하기" OnClick="window.location='replymodifyform.do?count=${Arrayreply.count}'">	
		</c:if>	
		</div>
		</c:forEach>
		</c:if>
	<c:if test="${empty Replylist}">
		 <script language=javascript>
				  	self.window.alert("작성된 후기가 없습니다.처음 후기를 남겨주세요!");
				  	location.href="list.do";//원글번호를 받으면 가능할듯?
		 </script>
		
		</c:if> 
	
</body>