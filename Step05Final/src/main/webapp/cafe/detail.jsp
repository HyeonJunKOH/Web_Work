<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 저장된 번호를 이용해서
	int num=(int)session.getAttribute("num");
	//수정할 글의 정보를 얻어온다.
	CafeDto dto=CafeDao.getInstance().getData(num);

	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/detail.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1><%=dto.getTitle()%></h1>
		<form action="insert.jsp" method="post">
			<div>
				<span><%=dto.getWriter()%></span><span><%=dto.getViewCount()%></span><span><%=dto.getRegdate()%></span>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content" rows="10"><%=dto.getContent()%></textarea>
			</div>
			<button type="submit">수정</button>
			<button type="submit">삭제</button>
		</form>
	</div>
</body>
</html>