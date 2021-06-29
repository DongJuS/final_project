<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요들넷 - 요리 알려주는 네 남자들</title>
<!-- 슬라이딩 배너에 필요한 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/slick/slick-theme.css" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<style>
.hidden {
	visibility: hidden;
}

.logo_image {
	width: 80px;
	margin: 10px;
}

.logo_text {
	margin: 0 auto;
}

.logotext {
	width: 300px;
	top: 18px;
	position: relative;
}

.main_top_container {
	width: 100%;
	height: 250px;
	background: orange;
}

.top_top {
	width: 100%;
	height: 80px;
	display: inline-flex;
}

.top_bottom {
	width: 100%;
	height: 170px;
	text-align: center;
	position: relative;
}

.logo {
	display: inline;
	width: 0px;
}

.nav_bar {
	display: inline;
	color: white;
	right: 0px;
	position: absolute;
	font-size: 14px;
}

.nav_bar a:link {
	color: white;
	text-decoration: none;
}

#search_bar {
	width: 70%;
	height: 45px;
	padding-right: 45px;
	border-radius: 100px;
	border-style: solid;
}

.fa-search:before {
	content: "\f002";
	position: relative;
	right: 30px;
}

.main_bottom_container {
	width: 100%;
	height: 800px;
}

.main_bottom_content {
	width: 80%;
	height: 800px;
	margin: 0 auto;
}

.best_menu {
	margin: 0 auto;
	height: 250px;
}

.situational_recommend {
	margin: 0 auto;
	height: 250px;
}

.main_board {
	background-color: yellow;
	margin: 0 auto;
	height: 250px;
}

.main_icon {
	width: 25px;
}

.icon_text {
	font-size: x-large;
	font-family: 'Jua', sans-serif;
}

.post-slider {
	width: 100%;
	margin: 0px auto;
	position: relative;
}

.post-slider .silder-title {
	text-align: center;
	margin: 30px auto;
}

.post-slider .next {
	position: absolute;
	top: 50%;
	right: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
}

.post-slider .prev {
	position: absolute;
	top: 50%;
	left: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
}

.post-slider .post-wrapper {
	width: 90%;
	height: 220px;
	margin: 0px auto;
	overflow: hidden;
}

.post-slider .post-wrapper2 {
	width: 90%;
	height: 220px;
	margin: 0px auto;
	overflow: hidden;
}

.post-slider .post-wrapper .post {
	width: 300px;
	height: 300px;
	margin: 0px 10px;
	display: inline-block;
	background: white;
	border-radius: 5px;
}

.post-slider .post-wrapper2 .post {
	width: 300px;
	height: 300px;
	margin: 0px 10px;
	display: inline-block;
	background: white;
	border-radius: 5px;
}

.post-slider .post-wrapper .post .post-info {
	font-size: 15px;
	height: 30%;
	padding-left: 10px;
}

.post-slider .post-wrapper2 .post .post-info {
	font-size: 15px;
	height: 30%;
	padding-left: 10px;
}

.post-slider .post-wrapper .post .slider-image {
	width: 100%;
	height: 175px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.post-slider .post-wrapper2 .post .slider-image {
	width: 100%;
	height: 175px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.best_text {
	height: 30px !important;
}

.cttIcon {
	width: 30px;
	position: relative;
}

.icon_wrapper {
	width: 0px;
	height: 0px;
}

.b_l {
	top: 70px;
	left: -65px;
}

.b_r {
	position: absolute;
	right: 52px;
}

#autoMaker {
	padding: 3px;
	position: absolute;
	width: 200px;
	height: auto;
	background: white;
	margin-top: 3px;
	cursor: pointer;
}

#autoMaker>div {
	border: 1px solid #e6e6e6;
	margin-top: 3px;
}

#autoMaker>div:hover {
	background: #e6d1ff;
}

#count {
	border-bottom: 1px solid black;
	height: 50px;
}
</style>
</head>
<body>



	<div class="main_top_container">
		<div class="top_top">
			<div class="logo">
				<a href="#"><img class="logo_image"
					src="/resources/proimg/logo.png"></a>
			</div>

			<div class="nav_bar">
				<a href="#">로그인</a> | <a href="#">회원가입</a> | <a href="#">마이페이지</a>
			</div>
			<div class="logo_text">
				<img class="logotext" src="/resources/proimg/logotext2.png">
			</div>
		</div>

		<div class="top_bottom">
			<form action="index">


				<input id="search_bar" type="text" name="search"
					placeholder=" 가지고 계신 식재료를 입력해 주세요!"><span class="icon"><i
					class="fa fa-search"></i></span>
				<div id="autoMaker"></div>

				<div id="search_area"
					style="width: 300px; height: 100px; background-color: white;">1234</div>


			</form>
		</div>
	</div>
	<!-- =======================헤더============================ -->

	<div id="count">
		총
		<c:out value='${pageMaker.total }' />
		개의 레시피가 검색되었습니다.

	</div>
	<!-- 검색 갯수 -->
	<div class="main_bottom_container">

		<div class="main_bottom_content">

			<div class="best_menu">
				<div class="best_text">
					<img src="/resources/proimg/star.png" class="main_icon"><span
						class="icon_text">베스트 추천메뉴</span>
				</div>
				<div class="icon_wrapper">
					<i class="prevButton"><img class="cttIcon b_l prev"
						src="/resources/proimg/previcon.png"></i> <i class="nextButton"><img
						class="cttIcon b_r next" style="top: 353px;"
						src="/resources/proimg/nexticon.png"></i>
				</div>


				
					<div class="page-wrapper" style="position: relative;">
						<!--page slider -->
						<div class="post-slider">

							<div class="post-wrapper">
							<c:forEach var="board" items="${list }">
								<div class="post">
									<img src="${board.img }" class="slider-image">
									<div class="post-info">
										<h4>
											<a href="#" class="post-subject">"${board.name } </a>
										</h4>
									</div>
								</div>
								</c:forEach>
								<div class="post">
									<img src="/resources/proimg/star.png" class="slider-image">
									<div class="post-info">
										<h4>
											<a href="#"> 계란말이 </a>
										</h4>
									</div>
								</div>

							</div>
							
						</div>
						<!--post slider-->
					</div>
			</div>
<p></p>

			<div class="situational_recommend">

				<div class="best_text">
					<img src="/resources/proimg/star.png" class="main_icon"><span
						class="icon_text">상황별 추천메뉴</span>
				</div>
				<div class="icon_wrapper">
					<i class="prevButton"><img class="cttIcon b_l prev2"
						src="/resources/proimg/previcon.png"></i> <i class="nextButton"><img
						class="cttIcon b_r next2" style="top: 600px;"
						src="/resources/proimg/nexticon.png"></i>
				</div>
				<div class="page-wrapper" style="position: relative;">
					<!--page slider -->
					<div class="post-slider">

						<div class="post-wrapper2">
							<div class=".post">
								<img src="/resources/proimg/star.png" class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#" class="post-subject">김치볶음밥 </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img src="/resources/proimg/star.png" class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#"> 계란말이 </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img src="/resources/proimg/star.png" class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">간장공장공장장 </a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img src="/resources/proimg/star.png" class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">캐러셀개헬</a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img src="/resources/proimg/star.png" class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">믿을수없어</a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img src="/resources/proimg/star.png" class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">뽀잉</a>
									</h4>
								</div>
							</div>
						</div>
					</div>
					<!--post slider-->
				</div>

			</div>
			<div class="main_board"></div>
		</div>
		<div class="icon_wrapper">
			<img src="/resources/proimg/kakao_icon.png"
				style="width: 66px; position: absolute; right: 13px;">
		</div>

	</div>
	<div id="target"></div>
	<jsp:include page="footer.jsp" />


	<script>
		$(document).ready(function() {		
			$('.post-wrapper').slick({
				slidesToShow : 4,
				slidesToScroll : 2,
				autoplay : true,
				autoplaySpeed : 10000,
				nextArrow : $('.next'),
				prevArrow : $('.prev')
			});
			$('.post-wrapper2').slick({
				slidesToShow : 4,
				slidesToScroll : 2,
				autoplay : true,
				autoplaySpeed : 10000,
				nextArrow : $('.next2'),
				prevArrow : $('.prev2')
			});
			
			var cookings= [];
			var searchList = [];
			/* var path = window.location.pathname;
			console.log(path); */
			$.getJSON('/resources/projson/reci2.json',function(data){
				
				$.each(data, function(i,item){
					/* html.push('<div>');
					html.push('<h3>11'+item.id + '</h3>');
					html.push('<div>'+item.name + '</div>');
					html.push('<div>'+item.summary+ '</div>');
					html.push('<div>'+item.ingre[0].ingre_name+'</div>');
					html.push('</div>');
					html.push('</div>'); */
					for(var key in item.ingre){
						cookings.push(item.ingre[key].ingre_name)
					}
				
				});
			
				cookings.sort();
				cookings = cookings.filter((element,index)=>{
				return cookings.indexOf(element)===index;
			});
			$('#target').html(cookings.join(' '));
			});
			
			var isComplete = false; 	//autoMaker 자식이 선택되었는지 여부
			$('#search_bar').keyup(function(){
			    var txt = $(this).val();
			    if(txt != ''){  //빈줄이 들어오면
			        $('#autoMaker').children().remove();

			        cookings.forEach(function(arg){
			            if(arg.indexOf(txt) > -1 ){
			                $('#autoMaker').append(
			                    $('<div>').text(arg)
			                );		
			            }
			        });
			        $('#autoMaker').children().each(function(){
			            $(this).click(function(){
			            	/* $('#search_area').val($(this).text()); */
			                $('#search_area').append(
			                	$('<div>').text($(this).text())
			                	);
			                searchList.push($(this).text());
			                $('#search_bar').val('');
			                $('#autoMaker').children().remove();	
			                isComplete = true;
			                console.log(searchList);
			                /* console.log(cookings); */
			            });
			        });			
			    } else {
			        $('#autoMaker').children().remove();
			    }  
			});
			$('#search_bar').keydown(function(event){
			    if(isComplete) {  //autoMaker 자식이 선택 되었으면 초기화
			        $('#search_bar').val('')	
			    }
			});
			var objParams = {
				 "cookings" : cookings, 
				"searchList" : searchList
			};
			/* var realurlp = location.protocol + location.host + "/project/index"; */
			$(".fa-search").click(function(){
				$.ajax({
					url : "/project/index",
					dataType : "json",
					type : "POST",
					data : objParams,
					contentType :  "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(retVal){
						if(retVal.code =="OK"){
							alert(retVal.message);
						}else{
							alert(retVal.message);
						}
						
					},
					error : function(request, status, error){
						console.log("AJAX_ERROR");
						alert(request.responseText);
						console.log(status);
						console.log(error);
					}
				});
			})
		});
	</script>
</body>
</html>