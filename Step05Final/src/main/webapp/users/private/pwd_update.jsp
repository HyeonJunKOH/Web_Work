<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에서 수정할 회원의 아이디를 읽어온다.
	String id=(String)session.getAttribute("id");
	//폼 전송 되는 기존비밀번호와 새 비밀번호를 가져온다.
	String pwd=request.getParameter("pwd");
	String newpwd=request.getParameter("newpwd");
	
	//작업의 성공여부
	boolean isSuccess=false;
	
	//현재 비밀번호
	String currentPwd=UsersDao.getInstance().getData(id).getPwd();
	//만일 현재 비밀번호하고 입력한 비밀번호와 같으면
	if(currentPwd.equals(pwd)){
		//수정 작업을 수행
		UsersDto dto=new UsersDto();
		dto.setId(id);
		dto.setPwd(newpwd);
		isSuccess=UsersDao.getInstance().updatePwd(dto);
	}
	//만일 성공이면 
	if(isSuccess){
		//로그아웃 처리
		session.removeAttribute("id");
	}
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/private/update.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){%>
			<p>
				비밀번호를 수정하고 로그아웃 되었습니다.
				<a href="${pageContext.request.contextPath}/users/loginform.jsp">다시 로그인</a>
			</p>
		<%}else{%>
			<p>
				구 비밀번호가 일치하지 않습니다.
				<a href="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp">다시 시도</a>
			</p>
		<%}%>
	</div>
</body>
</html>