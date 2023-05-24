<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GuestDao 객체의 참조값 얻어오기
	GuestDao dao=GuestDao.getInstance();
	//작성자 정보 불러오기
	List<GuestDto>list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/list.jsp</title>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h1 style="text-align:center" >방명록 목록</h1>
		<div style="text-align:right">
			<a href="insertform.jsp">
  				<span>방명록작성</span>
			</a>
		</div>
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>작성자</td>
				<td>내용</td>
				<td>비밀번호</td>
				<td>일자</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
		<!-- for문 이용해서 작성된 방명록 정보 불러오기-->
		<%for(GuestDto tmp:list){%>
			<tr>
				<td><%=tmp.getNum()%></td>
				<td><%=tmp.getWriter()%></td>
				<td><%=tmp.getContent()%></td>
				<td><%=tmp.getPwd()%></td>
				<td><%=tmp.getRegdate()%></td>
				<td>
					<a href="/Step02DataBase/member/updateform.jsp?num=<%=tmp.getNum()%>">수정</a>
				</td>
				<td>
					<a href="delete.jsp?num=<%=tmp.getNum()%>">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-x" viewBox="0 0 16 16">
  							<path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm.256 7a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Z"/>
  							<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm-.646-4.854.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 0 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 .708-.708Z"/>
						</svg>
						<span class="visually-hidden">삭제하기</span>
					</a>
				</td>
			</tr>
		<%}%>
		</tbody>
	</table>
	</div>
</body>
</html>