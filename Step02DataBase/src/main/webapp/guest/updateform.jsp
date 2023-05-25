<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 작성자의 번호를 얻어낸다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. 번호를 이용해서 DB에 저장된 수정할 작성자의 정보를 얻어낸다.
	GuestDto dto=GuestDao.getInstance().getData(num);
	//3. 수정할 양식을 클라이언트에게 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/updateform.jsp</title>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="guest" name="current"/>
	</jsp:include>
	<div class="container mt-5">
		<h1>방명록 수정 양식</h1>
		<form action="update.jsp" method="post" class="row g-3">
			<div class="mb-1">
				<label for="num">번호</label>
				<input type="text" id="num" name="num" value="<%=dto.getNum()%>" readonly/>
			</div>
			<div class="mb-1">
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer" value="<%=dto.getWriter()%>" />
			</div>
			<div class="mb-1">
				<label for="content">내용</label>
				<textarea name="content" id="content" rows="3"><%=dto.getContent()%></textarea>
			</div>
			<div class="mb-1">
				<label for="pwd">비밀번호</label>
				<input type="password" id="pwd" name="pwd"/>
			</div>
			<button class="btn btn-outline-primary" type="submit">수정하기</button>
			<button class="btn btn-outline-warning" type="reset">취소</button>
		</form>
	</div>


</body>
</html>