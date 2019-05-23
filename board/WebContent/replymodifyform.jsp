<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
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
	<title>BOARD 테이블 레코드 삽입</title>
</head>
<body>
	<div style="text-align:right">
		사용자ID : ${id} <input type=button class="btn btn-info" value="로그아웃" OnClick="window.location='logout.do'">
	</div>
	<form action ="/board/replymodify.do" method="get">
		<c:forEach items="${Replylist}" var="Replylist">
			<table class="table table-striped table-bordered table-hover" style="text-align:center">
			<input type="hidden" name="count" value="${Replylist.count}">
				<caption style="text-align:center">게시판 수정</caption>		
				<tr>
					<td>제목</td>
					<td style="text-align:left"><input type="text" name="title" value="${Replylist.title}"></td>
				</tr>
				<tr>	
					<td>작성자</td>
					<td style="text-align:left">${Replylist.id}</td>
				</tr>
				<tr>	
					<td>작성일자</td>
					<td style="text-align:left">${Replylist.boarddate}</td>
				</tr>
				<tr>	
					<td>email</td>
					<td style="text-align:left">${Replylist.email}</td>
				</tr>
				<tr>	
					<td>내용</td>
					<td style="text-align:left"><textarea name="content" rows="10" placeholder="내용을 입력하세요" form="inform">${Replylist.content}</textarea></td>
				</tr>	
				<tr>
					<td></td>
					<td style="text-align:right">
						<input type=submit class="btn btn-warning" value="수정" Onclick="javascript:writeCheck();">
						<input type=button class="btn btn-secondary" value="취소" OnClick="window.location='contentreply.do?count=${Replylist.count}'">
					</td>
				</tr>	
			</table>
		
		</c:forEach>
	</form>
</body>
</html>