<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�۾���</title>
</head>
<body>
<h1>�Խ��� �۾��� ȭ��</h1>
 <form action="write.do" method="post">
	����<input type="text" name="title"><br />
	�ۼ���<input type="text" name="author"><br />
	����<textarea name="content" rows="5" ></textarea><br />
	<input type="submit" value="����">
  </form>
 <a href="list.do">��Ϻ���</a>
</body>
</html>