<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/insertform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<!-- 회원정보(이름,주소)를 입력할 수 있는 양식(form)을 작성해보세요 -->
		<h1>회원추가 양식</h1>
		<form action="insert.jsp" method="post">
			<div class="mb-1">
				<label for="name" class="form-label">이름</label>
				<input type="text" id="name" name="name" class="form-control"/>
			</div>
			<div class="mb-2">
				<label for="addr" class="form-label">주소</label>
				<input type="text" id="addr" name="addr" class="form-control"/>
			</div>
			<button class="btn btn-success" type="submit">추가</button>
		</form>
	</div>
	
</body>
</html>