<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test02.jsp</title>
</head>
<body>
	<h1>Promise 테스트</h1>
	<script>
		let p1=new Promise(fuction(resolve,reject){
			/*
			함수의 인자로 전달되는 resolve, reject는 함수이다
			resolve는 작업을 완료 했을때 호출 해야하는 함수
			reject는 작업이 실패 했을때 호출 해야하는 함수
			resolve는 함수가 호출되면 .then()안에 있는 함수가 자동 호출 도니다.
			reject 함수가 호출 되면 .catch()안에 있는 함수가 자동 호출 된다.
			*/
			//resolve();
			reject();
			console.log("reject 함수를 호출 했습니다.");
		});
		//2. p1 Promise가 resolve 되었을 때 호출되는 함수 등록
		p1.then(function(){
			console.log("then 안에 있는 함수가 호출 되었습니다.")
		});
		//3. p1 Promise가 reject 되었을 때 호출 되는 함수 등록
		p1.cathch(function(){
			console.log("catch 안에 있는 함수가 호출 되었습니다.")
		});
	</script>
</body>
</html>