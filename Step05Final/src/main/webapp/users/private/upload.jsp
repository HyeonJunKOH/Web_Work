<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디
	String id=(String)session.getAttribute("id");
	//1. 파일 시스템 상에서 webapp 의 upload 폴더 까지의 절대경로를 얻어낸다.
	String realPath=application.getRealPath("/upload");
	//2. 아래의 MultipartRequest 객체가 예외 없이 잘 생성되면 webapp/upload 폴더에 파일이 자동으로 저장된다.
	// cos.jar 에 있는 MultipartRequest 클래스로 객체 생성하기 
	MultipartRequest mr=new MultipartRequest(request, //내부적으로 필요한 HttpServletRequest 객체 전달
			realPath,                       //업로드된 파일을 저장할 경로
			1024*1024*100,                  //최대 업로드 사이즈 제한
			"utf-8",                        //한글 파일명 깨지지 않도록
			new DefaultFileRenamePolicy()); //동일한 파일이 존재하면 자동으로 파일을 rename 해서 저장하도록
	
	//3. MulitipartRequest 객체의 메소드를 이용해서 폼전송된 내용을 추출해야 한다.
	String saveFileName=mr.getFilesystemName("image");//저장된 파일명
	//DB에 저장할 이미지 경로 구성하기
	String imagePath="/upload/"+saveFileName;
	//DB에 수정반영하고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setProfile(imagePath);
	UsersDao.getInstance().updateProfile(dto);
	//리다이렉트 응답하기
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/users/private/info.jsp");
%>
