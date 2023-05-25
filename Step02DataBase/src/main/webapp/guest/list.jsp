<%@page import="java.text.SimpleDateFormat"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GuestDao 객체의 참조값 얻어오기
	GuestDao dao=GuestDao.getInstance();
	//작성자 정보 불러오기
	List<GuestDto>list=dao.getList();;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/list.jsp</title>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
	<jsp:param value="guest" name="current"/>
	</jsp:include>
	<div class="container">
		<h1 style="text-align:center" >방명록 목록</h1>
		<div style="text-align:right">
			<a href="${pageContext.request.contextPath}/guest/insertform.jsp">
  				<span>방명록작성</span>
			</a>
		</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>내용</th>
				<th>작성일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<!-- for문 이용해서 작성된 방명록 정보 불러오기-->
		<%for(GuestDto tmp:list){%>
			<tr>
				<td><%=tmp.getNum()%></td>
				<td><%=tmp.getWriter()%></td>
				<td>
					<textarea rows="3" readonly><%=tmp.getContent()%></textarea>
				</td>
				<td><%=tmp.getRegdate()%></td>
				<td>
					<a href="/Step02DataBase/guest/updateform.jsp?num=<%=tmp.getNum()%>">수정</a>
				</td>
				<td>
					<form action="delete.jsp" method="post">
						<input type="hidden" name="num" value="<%=tmp.getNum()%>" />
						<input type="password" name="pwd" placeholder="4자리입력.." />
						<button type="submit">삭제</button>
					</form>
				</td>
			</tr>
		<%}%>
		</tbody>
	</table>
	</div>
</body>
</html>