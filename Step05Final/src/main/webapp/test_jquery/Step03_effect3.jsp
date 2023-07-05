<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/Step03_effect3.jsp</title>
<style>
	.box{
		width:100px;
		height:100px;
		background-color: yellow;
		border: 1px solid red;
	}
	.box2{
		width:100px;
		height:100px;
		background-color: yellow;
		border: 1px solid red;
		/* transition 효과를 줄 수 있는 모든(all) css 속성에 대해서 1초(1s) 동안 일정한비율(linear)로
		   적용을 시켜라
		*/
		transition: all 1s linear;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글버튼</button>
	<button id="moveBtn">움직이기</button>
	<button id="moveBtn2">움직이기2</button>
	<button id="moveBtn3">움직이기3</button>
	<div class="box"></div>
	<div class="box2"></div>
	<script>
		$("#moveBtn3").on("click",function(){
			$(".box2").css("margin-left","100px");
			//document.querySelector(".box").style.marginLeft="100px";
		});
		/*
			움직이기 버튼을 눌렀을때 .box div를 오른쪽으로 100px 움직이도록 해 보세요.
			단, 1초 동안 움직이도록
			hint : margin
		*/
		$("#hideBtn").on("click",function(){
			$(".box").fadeOut(1000,function(){
				alert("뿅~");
			});
		});
		$("#showBtn").on("click",function(){
			$(".box").fadeIn({
				duration:1200,
				complete:function(){
					alert("짠!");
				}
			});
		});
		$("#toggleBtn").on("click",function(){
			$(".box").fadeToggle();
		});
		$("#moveBtn").on("click",function(){
			let mLeft=0;
			//10/1000 초 마다 한번씩 호출되는 함수 안에서 .box를 움직이기
			let seq = setInterval(function(){
				mLeft +=1;
				$(".box").css("margin-left",mLeft+"px");
				if(mLeft >= 101){
					//인터발의 순서값(sequence)값을 이용해서 취소하기
					clearInterval(seq);
				}
			},10);
		});
		
		$("#moveBtn2").on("click",function(){
			$(".box").animate({
				"margin-left":"+=100px"
			},1000);
		});
	</script>
</body>
</html>