<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<style>
header {
	background-color: #FF4500;
}

tr {
	text-align: center;
}

#view1 {
	text-align: center;
}

li {
	display: none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header class="pt-5">
		<jsp:include page="../include2/topLayout.jsp" flush="false" />
	</header>
	<div class='container'>
		<div id='view1'>
			<img src='<c:out value="${recipe.img }"/>' width='600px'>
		</div>
		<div id='view1'>
			<img src='/resources/img/heart.png' class="rounded-circle" width='100px'
				height='100px'><br> <span>유저 닉네임(유저 아이디)</span>
		</div>
		<div id='view1'>
			<h3>
				<c:out value="${recipe.name }" />
			</h3>
			<p>
				<c:out value="${recipe.summary }" />
			</p>

			<table class="table">
				<tr>
					<th colspan='3'><b>[재료]</b></th>
				</tr>
				<c:forEach var='ingre' items='${ingre}'>
					<tr>
						<td><c:out value='${ingre.ingre_name }' /></td>
						<td><c:out value='${ingre.ingre_count }' /></td>
						<td><c:out value='${ingre.ingre_unit }' /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
<h2>연습 좋아요</h2>
  <div style="text-align: right;">
       <a class="btn btn-outline-dark heart">
           <img id="heart" src="">
       </a>
   </div>


<script>
    $(document).ready(function () {

        var heartval = ${heart};

        if(heartval>0) {
            console.log(heartval);
            $("#heart").prop("src", "/resources/img/attach.png");
            $(".heart").prop('name',heartval)
        }
        else {
            console.log(heartval);
            $("#heart").prop("src", "/resources/img/heart.png");
            $(".heart").prop('name',heartval)
        }

        $(".heart").on("click", function () {

            var that = $(".heart");

            var sendData = {'Rid' : '${IngreVO.Rid}','heart' : that.prop('name')};
            $.ajax({
                url :'/board/heart',
                type :'POST',
                data : sendData,
                success : function(data){
                    that.prop('name',data);
                    if(data==1) {
                        $('#heart').prop("src","/resources/img/attach.png");
                    }
                    else{
                        $('#heart').prop("src","/resources/img/heart.png");
                    }


                }
            });
        });
    });
</script>
		
		
		<div id='detail_step'>
			<div>
				<b>[조리과정]</b> <span>steps</span>
			</div>
			<div class='row'>
				<c:forEach var='proce' items='${proce }'>
					<div class="col-xs-12 col-sm-6 col-md-8">
						<p>
						<img src="<c:out value='${proce.pimg }'/>" width='300px'>
					</div>
					<div class="col-xs-6 col-md-4">
							<c:out value="${proce.txt }" />
					</div>
				</c:forEach>
			</div>

		</div>
		<br>
		<div class='row'>
			<div>
				<form>
					<button id="like" type="button" class="btn btn-primary">
					<span onclick="location.href='/board/prefer/${p.id}'">맛있어</span></button>
					<button id="dislike" type="button" class="btn btn-danger">난별로</button>
				</form>
			</div>
		</div>
	</div>

	</div>
	<!-- 컨테이너 끝 -->
	<br>
	<!-- 댓글 시작 -->

	<div class='container'>
		<div class='veiw_reply'>
			<div>
				<div class='media_reply_list'>
					<div>
						<h4>
							<strong>여기에 아이디</strong> 댓글단 시간
						</h4>
						<span>댓글 내용 내용 내용내용내용</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i>Reply

			<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
				Reply</button>

		</div>
		<div class="panel-body">
			<ul class="chat">
				<li class="left clearfix" data-rno="12">
					<div>
						<div class="header">
							<!-- <strong class="primary-font"> user00</strong> <small
									class="pull-right text-muted">2021-05-18-13:13</small> -->
						</div>
						<!-- <p>Good job</p> -->
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	
	
	
	
</body>
</html>