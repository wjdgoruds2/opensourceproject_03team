<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�亯�� ���� ȭ��</title>
</head>
<body>
<h1>�亯�� ���� ȭ��</h1>
 <form action="reply.do" method="post">
  <input type="hidden" name="num" value="${replyui.num}">
<input type="hidden" name="repRoot" value="${replyui.repRoot}">
<input type="hidden" name="repStep" value="${replyui.repStep}">
<input type="hidden" name="repIndent" value="${replyui.repIndent}">

  	�����۹�ȣ${replyui.num}&nbsp; ��ȸ��${replyui.readcnt}<br />
	����<input type="text" name="title" value="${replyui.title}"><br />
	�ۼ���<input type="text" name="author" ><br />
	����<textarea name="content" rows="10" >${replyui.content}></textarea><br />
	<input type="submit" value="�亯�ޱ�">
  </form>
 <a href="list.do">��Ϻ���</a>

</body>
</html>