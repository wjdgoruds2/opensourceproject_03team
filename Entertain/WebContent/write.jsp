<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>

	<h1>게시판 글쓰기 화면</h1>
	<form action="write.do" method="post">
	제목<input type="text" name="title"></br>
	작성자<input type="text" name="title"></br>
	내용<textarea name="content" row="5"></textarea></br>
	<input type="submit" value="저장">
	</form>
	
	<a href="list.do">목록보기</a>
</body>
</html>