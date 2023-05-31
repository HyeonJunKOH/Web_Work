<%@ page language="java" contentType="application.json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.get 방식 파라미터 추출하기
	String inputEmail=request.getParameter("inputEmail");
	//2. DB 에 이미 존재하는 이메일 인지 알아내서 사용가능 여부를 판정한다.
	boolean canUseEmail=true;
	if(inputEmail.equals("tttmmm100@naver.com") || inputEmail.equals("gura1234@naver.com")){
		canUseEmail=false;
	}
	//3. json으로 사용가능 여부 응답
%>
{canUseEmail:<%=canUseEmail%>}