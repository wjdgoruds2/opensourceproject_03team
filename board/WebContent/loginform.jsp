<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
    <script> 

function writeCheck()
  {
   var form = document.writeform;
 
  if( !form.id.value )
   {
    alert( "ID�� �����ּ���" );
    form.id.focus();
    return;
   }
  if( !form.password.value )
  {
   alert( "��й�ȣ�� �����ּ���" );
   form.password.focus();
   return;
  }
  if( !form.name.value )
  {
   alert( "�̸��� �����ּ���" );
   form.name.focus();
   return;
  }
  if( !form.email.value )
  {
   alert( "�̸����� �����ּ���" );
   form.email.focus();
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
<title>ȸ������</title>
</head>
<body>

<form action ="/board/join.do" method="post">
	<table class="table table-striped table-bordered table-hover" style="text-align:center">
	<tr>
		<th>ID</th>
		<th><input type="text" name="id"></th>
	</tr>
	<tr>	
		<th>PASSWORD</th>
		<th><input type="text" name="password"></th>
	</tr>
	<tr>	
		<th>NAME</th>
		<th><input type="text" name="name"></th>
	</tr>
	<tr>	
		<th>EMAIL</th>
		<th><input type="text" name="email"></th>
	</tr>	
	<tr>
		<th></th>
		<th style="text-align:right">
			<input type=submit class="btn btn-success" value="���" Onclick="javascript:writeCheck();">
			<input type=button class="btn btn-secondary" value="���" OnClick="window.location='login.jsp'">
		</th>
	</tr>
	</table>

</form>
</body>
</html>