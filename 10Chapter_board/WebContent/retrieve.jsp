<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� �ڼ��� ����</title>
</head>
<body>
 <h1>�� �ڼ��� ����</h1>
  <form action="update.do" method="post">
   <input type="hidden" name="num" value="${retrieve.num}">
    �۹�ȣ: ${retrieve.num}  &nbsp;&nbsp;&nbsp;&nbsp; ��ȸ��: ${retrieve.readcnt}<br>
	����<input type="text" name="title" value="${retrieve.title}"><br>
	�ۼ���<input type="text" name="author" value="${retrieve.author}"><br>
	����<textarea name="content" rows="10" >${retrieve.content}</textarea><br>
	<input type="submit" value="����">
  </form>
 <a href="list.do">���</a>
 <a href="delete.do?num=${retrieve.num}">����</a>
  <a href="replyui.do?num=${retrieve.num}">�亯�ޱ�</a>
</body>
</html>