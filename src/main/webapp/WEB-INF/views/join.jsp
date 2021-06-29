<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.id_input_C1{
color: green;
display: none;
}
.id_input_C2{
color: red;
display: none;
}
.final_idc{
color:red;
display: none;
}
.final_pwdc{
color: red;
 display: none;
}
.final_pwdec{
color : red;
 display: none;
}
/* 비밀번호 유효성검사 */
.input_pwdec_1{
color: green;
display: none;
}
.input_pwdec_2{
color:red;
display: none;
}
.final_emailc{
color: red;
display: none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<div id=msg></div>

<form action="/joinProc" method="post" id="join_form">
<input class=id_input type=text name=id placeholder="아이디를 입력해주세요">
<span class="id_input_C1">사용가능한 아이디입니다</span>
<span class="id_input_C2">이미 사용중인 아이디입니다</span>
<span class="final_idc">아이디를 입력해주세요</span>
<!-- 아이디 입력 -->
<br/>
<input class ="pwd_input" type="password" name="pwd" placeholder="비밀번호를 입력해주세요">
<span class="final_pwdc">비밀번호를 입력해주세요</span>
<!-- 비밀번호 입력 -->
<br/><input class="pwd_equal" type="password" placeholder="비밀번호를 확인해주세요">
<span class="final_pwdec">비밀번호를 입력해주세요</span>
<span class="input_pwdec_1">비밀번호가 일치합니다</span>
<span class="input_pwdec_2">비밀번호가 일치하지 않습니다</span>
<!-- 비밀번호 확인 -->
<br/>
<input class = "email_input" type="email" name="email" placeholder="이메일을 입력해주세요">
<span class="final_emailc">이메일을 입력해주세요</span>
<!-- 이메일  -->
<br/>
<input  class ="join_btn"type="button" value="가입하기">
</form>
<script type="text/javascript">
var idc = false;	//id
var idcc = false; //id중복검사
var pwdc = false; //pwd
var pwdcc = false;// pwd체크
var pwdcorrect = false; //pwd일치
var emailc =  false; //email

$(document).ready(function(){

 	$('.join_btn').click(function(){
		var id = $('.id_input').val()
 		var pwd  = $('.pwd_input').val()
 		var pwde = $('.pwd_equal').val()
 		var email = $('.email_input').val()
 		/* 아이디 유효성검사 */		
        if(id == ""){
            $('.final_idc').css('display','block')
            idc = false
        }else{
            $('.final_idc').css('display', 'none')
            idc= true
        }
 		/* 비밀번호 유효성검사 */
 		if(pwd== ""){
 			$('.final_pwdc').css('display','block')
 			pwdc= false
 		}else{
 			$('.final_pwdc').css('display','none')
 			pwdc=true
 		}
 		/* 비밀번호 확인 유효성 검사 */
 		if(pwde==""){
 			$('.final_pwdec').css('display','block')
 			pwdcorrect = false
 		}else{
 			$('.final_pwdec').css('display','none')
 			pwdcorrect = true
 		}
 		if(email==""){
 			$('.final_emailc').css('display','block')
 			emailc = false
 		}else{
 			$('.final_emailc').css('display','none')
 			emailc=true
 		}
 		if(idc&&pwdc&&pwdcorrect&&emailc == true){ 
 		$('#join_form').attr("action",'/joinProc')
		$('#join_form').submit() 
		}
 		return false; 
	}) 
	
})
/* id중복확인 */
  $('.id_input').on("propertychange change keyup paste", function() {
	  var id = $('.id_input').val()
	  var data = {id : id}
	  
	  $.ajax({
		  type: "post",
		  url : "/Idcheck",
		  data : data,
		  success : function(result){
		/* 		 console.log("성공 여부 " + result) */
		if(result !="fail"){
			$('.id_input_C1').css("display","inline-block")
			$('.id_input_C2').css("display","none")
			idcc=true //id중복이없을때
		}
		else{
			$('.id_input_C2').css("display","inline-block")
			$('.id_input_C1').css("display","none")
			idcc=false //id중복일때
		}
	  }
	  })
/*     console.log("keyup 테스트") */
  })
  /* 비밀번호 일치하는지 */
$('.pwd_equal').on("propertychange change keyup paste", function() {
	var pwd = $('.pwd_input').val()
	var pwdc = $('.pwd_equal').val()
	if(pwd== pwdc){
	$('.input_pwdec_1').css('display','block')
	$('.input_pwdec_2').css('display','none')
	pwdcorrect = true
	}else{
		$('.input_pwdec_1').css('display','none')
		$('.input_pwdec_2').css('display','block')
		pwdcorrect = false
		
	}
	
})
</script>
</body>
</html>