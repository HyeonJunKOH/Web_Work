<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>step04_fotorama.jsp</title>
<!-- 플러그인 CSS -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<style>
   .container{
      width: 768px;
      margin: 0 auto;
   }
   .fotorama img{
      max-width: 100%;
   }
</style>
</head>
<body>
   <div class="container">
      <h1>fotorama를 이용한 이미지 슬라이더 만들기</h1>
      <div class="fotorama"
         data-allowfullscreen="true"
         data-nav="thumbs">
         <img src="${pageContext.request.contextPath }/vue2/images/top01.jpg" data-caption="야호옷" />
         <img src="${pageContext.request.contextPath }/vue2/images/top02.jpg" />
         <img src="${pageContext.request.contextPath }/vue2/images/top03.jpg" />
         <img src="${pageContext.request.contextPath }/vue2/images/top04.jpg" />
         <img src="${pageContext.request.contextPath }/vue2/images/top05.jpg" />
      </div>
   </div>

   <!-- jquery로딩 -->
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
   <!-- 플러그인 js 로딩 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>


</body>
</html>