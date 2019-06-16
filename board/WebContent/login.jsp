<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
  
<title>로그인 페이지</title>
<script type="text/javascript">
   function login(){
      document.form.submit();
   }
   
   function cancel(){
      document.form.reset();
   }   
</script>


<style>
/*
Basic input element using psuedo classes
*/

html {
  font-family: 'Lora', sans-serif;
  width: 100%;
}

body {

  margin: 5% auto 0 auto;
  width: 90%;
  max-width: 1125px;
}

h1 {
  font-size: 28px;
  margin-bottom: 2.5%;
  font-family: 'Noto Serif KR', serif;
}

#loginForm {
   padding: 30px;
   background-color: rgba( 255, 255, 255, 0.2 );
}

input,
span,
label {
  font-family: 'Ubuntu', sans-serif;
  display: block;
  margin: 10px;
  padding: 5px;
  border: none;
  font-size: 22px;
}


input:focus {
  outline: 0;
}
/* Question */

input.question {
  font-size: 48px;
  font-weight: 300;
  border-radius: 2px;
  margin: 0;
  border: none;
  width: 80%;
  background: rgba(0, 0, 0, 0);
  transition: padding-top 0.2s ease, margin-top 0.2s ease;
  overflow-x: hidden; /* Hack to make "rows" attribute apply in Firefox. */
}
/* Underline and Placeholder */

input.question + label {
  display: block;
  position: relative;
  white-space: nowrap;
  padding: 0;
  margin: 0;
  width: 10%;
  border-top: 1px solid red;
  -webkit-transition: width 0.4s ease;
  transition: width 0.4s ease;
  height: 0px;
}

input.question:focus + label {
  width: 80%;
}

input.question:focus,
input.question:valid {
  padding-top: 35px;
}

input.question:focus + label > span,
input.question:valid + label > span {
  top: -100px;
  font-size: 22px;
  color: #333;
}

input.question:valid + label {
  border-color: green;
}

input.question:invalid {
  box-shadow: none;
}

input.question + label > span {
  font-weight: 300;
  margin: 0;
  position: absolute;
  color: #8F8F8F;
  font-size: 48px;
  top: -66px;
  left: 0px;
  z-index: -1;
  -webkit-transition: top 0.2s ease, font-size 0.2s ease, color 0.2s ease;
  transition: top 0.2s ease, font-size 0.2s ease, color 0.2s ease;
}

input[type="submit"]{
  font-family: 'Roboto Slab', serif;
  -webkit-transition: opacity 0.2s ease, background 0.2s ease;
  transition: opacity 0.2s ease, background 0.2s ease;
  display: block;
  opacity: 0;
  margin: 10px 0 0 0;
  padding: 10px;
  cursor: pointer;
  position: relative;
   
}


input[type="submit"]:hover {
  background: #EEE;
}

input[type="submit"]:active {
  background: #999;
}


input.question:valid ~ input[type="submit"]{
  -webkit-animation: appear 1s forwards;
  animation: appear 1s forwards;
}

input.question:invalid ~ input[type="submit"]{
  display: none;
}

@-webkit-keyframes appear {
  100% {
    opacity: 1;
  }
}

@keyframes appear {
  100% {
    opacity: 1;
  }
}

a{
color: white;
   text-decoration: none;
   font-size: 18px;
}
a:hover{
   font-size: 20px;
   text-decoration: underline;
}


#videobcg { 
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1000;
     overflow: hidden;
}
</style>
</head>

<body>
<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
     <source src="./video/Cheering-Crowd.mp4" type="video/mp4">
     <source src="Cheering-Crowd.webm" type="video/webm">
          Sorry, your browser does not support HTML5 video.
</video>

   <!-- <form action="login.do" method="post" name="form">
      <table class="table table-striped table-bordered table-hover">
         <caption style="text-align:center">로그인</caption>
         <tr>
            <th>ID</th> 
            <th><input type="text" name="id" /></th>
         </tr>
         <tr>
            <th>PW</th>
            <th><input type="password" name="password" /></th>
         </tr>
         <tr>
            <th></th>
            <th>
               <input type="button" class="btn btn-primary" value="로그인" onClick="login()" />
               <input type="button" class="btn btn-secondary" value="취소" onClick="cancel()" />
               <input type="button" class="btn btn-success" value="회원가입" onClick="window.location='loginform.jsp'" />
            </th>
         </tr>
      </table>
   </form> -->
   
<h1 style="margin-bottom: -2%;">안녕하세요! 문화정보 홈페이지입니다.</h1>
<h1>로그인이 필요합니다. <a style="margin-bottom: 20px; font-family: 'Noto Serif KR', serif; float: right;"href="#" onclick="window.location='loginform.jsp'; return false;">Sign Up!</a></h1>

 
<form id="loginForm" action="login.do" method="post" name="form"  onsubmit="return login();">
  <input type="text" name="id" class="question" id="nme" onsubmit="return writeCheck();" required autocomplete="off" />
  <label for="nme"><span>What's your ID?</span></label>
  <input type="text" name="password" class="question" id="msg" required autocomplete="off"/>
  <label for="msg"><span>What's your Password?</span></label>

  <input type="submit" value="Log In" onClick="login()" >
  <!-- <input type="button" class="btn btn-three" value="Cancel" onClick="cancel()" >  -->
 
</form>
</body>
</html>