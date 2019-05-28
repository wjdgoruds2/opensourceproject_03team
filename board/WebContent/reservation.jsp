<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script> 
		function writeCheck()
		  {
		   var form = document.writeform;
		   
		  if( !form.name.value )
		   {
		    alert( "이름을 적어주세요" );
		    form.name.focus();
		    return;
		   }
		 
		  
		  if( !form.phone.value )
		   {
		    alert( "전화번호를 적어주세요" );
		    form.phone.focus();
		    return;
		   }
		  
		  if( !form.card.value )
		   {
		    alert( "카드를 적어주세요" );
		    form.card.focus();
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
	<form action ="/board/reservation.do" method="post" name="writeform" >
		<c:forEach items="${articleList}" var="article">	
			<table class="table table-striped table-bordered table-hover" style="text-align:center">
				<caption style="text-align:center">예약하기</caption>		
				<tr>
					<td>제목</td>
					<td style="text-align:left"><input type="text" name="subject" value="${article.subject}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>이름</td>
					<td style="text-align:left"><input type="text" name="name"></td>
				</tr>
				<tr>	
					<td>전화번호</td>
					<td style="text-align:left"><input type="text" name="phone"></td>
				</tr>
				<tr>	
					<td>카드</td>
					<td style="text-align:left"><input type="text" name="card"></td>
				</tr>
				<tr>	
					<td>작성일자</td>
					<td style="text-align:left">${article.boarddate}</td>
				</tr>
				<tr>	
					<td>email</td>
					<td style="text-align:left"><input type="text" name="email"></td>
				</tr>
				<tr>	
					<td>공연/전시 시간</td>
					<td style="text-align:left" ><input type="text" name="perfodrmtime"value="${article.performtime}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>공연/전시 날짜</td>
					<td style="text-align:left"><input type="text" name="performdate"value="${article.performdate}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>공연/전시 위치</td>
					<td style="text-align:left"><input type="text" name="performlocation"value="${article.performlocation}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>공연/전시 지역</td>
					<td style="text-align:left"><input type="text" name="area" value="${article.area}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>공연/전시 유형</td>
					<td style="text-align:left" ><input type="text" name="type"value="${article.type}" readonly onfocus="this.blur();"></td>
				</tr>
				<tr>	
					<td>내용</td>
					<td style="text-align:left" ><input type="text" name="content" value="${article.content}" readonly onfocus="this.blur();"></textarea></td>
				</tr>	
				<tr>
					<td></td>
					<td style="text-align:right">
						<input type=button class="btn btn-warning" value="예약" Onclick="javascript:writeCheck();">
						<input type=button class="btn btn-secondary" value="취소" OnClick="window.location='content.do?num=${article.num}'">
					</td>
				</tr>	
			</table>
		
		</c:forEach>
	</form>
</body>
</html>