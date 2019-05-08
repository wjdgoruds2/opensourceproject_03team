<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charse!=EUC-KR">
	<title> 답변글 쓰기 화면 </title>
</head>
<body>
	<h1> 답변글 쓰기 화면 </h1>
	<form action="reply.do" method="post">
	
		<input type="hidden" name="num" value="${retrieve.num}">
		<input type="hidden" name="num" value="${retrieve.repRoot}">
		<input type="hidden" name="num" value="${retrieve.repStep}">
		<input type="hidden" name="num" value="${retrieve.replindent}">
		
		
		원래글번호: ${retrieve.num} &nbsp;&nbsp;&npsp;&npssp;
		조회수: ${retrieve.readcnt }<br/>
		
		제목<input type="text" name="title" value="${retrieve.title}"><br>
		작성자<input type="text" name="author"><br>
		내용<textarea name="content" rows="10"> ${retrieve.content}
		</textarea> <br>
		
		<input type="submit" value="답변달기">
	</form>
	<a href="list.do">목록 보기</a>
</body>

</html>