<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Step01_event2.jsp</title>
<style>
   .active{
      border: 1px solid red;
      background-color: yellow;
   }
</style>
</head>
<body>
   <h1>이벤트 처리</h1>
   <ul id="myNav">
      <li><a href="#">one</a></li>
      <li><a href="#">two</a></li>
      <li><a href="#">three</a></li>
   </ul>
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
   <script>
		//id 가 myNav인 요소의 자손 요소 중에서 a를 선택해서 focus 이벤트가 발생하면 실행할 함수 등록
      $("#myNav a").on("focus", function(e){
         $(e.target).parent().addClass("active");
      });
      
      $("#myNav a").on("blur", function(e){
         $(e.target).parent().removeClass("active");
      });
   </script>
</body>
</html>






