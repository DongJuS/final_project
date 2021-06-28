<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 버튼을 위해서 작성 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>




<style>
/* div{
border:1px solid black;
} */
.btn_margin {
	left: 50px;
	position: relative;
	margin-left: 20px;
}

#img_st {
	margin-top: 50px;
	margin-bottom: 0px;
}

#basic_sty {
	border: 1px solid black;
	width: 100px;
}

#box {
	border: 1px solid black;
}

.search {
	left: 200px;
}

.head {
	margin-top: 25px;
}

.table_title {
	width: 100px;
}

#center {
	text-align: center;
}
</style>


<header class="pt-5">

	<%--  <jsp:include page="../include/header.jsp"></jsp:include>
  --%>

	<jsp:include page="../include2/topLayout.jsp"></jsp:include>
</header>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}"/>';
						checkModal(result);
						history.replaceState({}, null, null)
						function checkModal(result) {
							if (result === "" || history.state) {
								return;
							}
							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글" + parseInt(result) + " 번이 등록됨")
							}
							$("#myModal").modal("show")

						}

						$("#regBtn").on("click", function() {
							self.location = "/board/register"
						})

						//내꺼 오타천국 
						var actionForm = $("#actionForm");
						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault()
									console.log('click')
									actionForm.find('input[name="pageNum"]')
											.val($(this).attr("href"))
									actionForm.submit()
								})

						//지아꺼
						/*    var actionForm = $("#actionForm");
						   $(".paginate_button a").on("click",function(e){
						      e.preventDefault();
						      console.log("click");
						      actionForm.find("input[name='pageNum']").val($(this).attr("href"));
						      //actionForm.submit();
						   }); */

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault()
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'/>")
											actionForm.attr("action",
													"/board/get")
											actionForm.submit()
										})

						var searchForm = $("#searchForm")
						$("#searchForm button").on(
								"click",
								function(e) {
									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요")
										return false;
									}
									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요")
										return false;
									}
									searchForm.find("input[name='pageNum']")
											.val("1")
									e.preventDefault();
									searchForm.submit();
								})

					})
</script>

<!-- 		------------------------------------------------------------------------------- -->
<div class="container">
	<div class="row">
		<div class="col-lg-12 ">
			<h1 class="page-header">게시판</h1>
		</div>
		<!-- col 12 -->
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="row justify-content-between">
				<div class="col-4 head">
					Total
					<c:out value='${pageMaker.total }' />
					건
				</div>


				<div class="col-6 search">
					<form id='searchForm' action='/board/list' method='get'>
						<select name='type'>
							<option value=""
								<c:out value="${pageMaker.cri.type==null?'selected': ''}"/>>----</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq'T'?'selected':''}"/>>제목</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq'C'?'selected': ''}"/>>내용</option>
							<option value="W"
								<c:out value="${pageMaker.cri.type eq'W'?'selected': ''}"/>>작성자</option>

						</select> <input type='text' name='keyword'
							value='<c:out value="${pageMaker.cri.keyword }"/>' /> <input
							type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }' />
						<input type='hidden' name='amount'
							value='${pageMaker.cri.amount }' />
						<button class='btn btn-info'>Search</button>
					</form>


				</div>
			</div>
		</div>
	</div>
	<!-- row -->



<c:choose>
  <c:when test="${id ne null}">
    <a href='javascript: like_func();'><img src=img src="http://lorempixel.com/300/200/sports/3/"/ id='like_img'></a>
  </c:when>
  <c:otherwise>
    <a href='javascript: login_need();'><img src='./images/dislike.png'></a>
  </c:otherwise>
</c:choose>





	<div class="row">
		<div class="col-lg-12">

			<table class="table" >
			
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col" id="center">제목</th>
						<!-- <th scope="col">파일</th> -->
						<th></th>
						<th scope="col">작성자</th>
						<th scope="col" id="center">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${list }">
						<tr>
							<td  scope="row">${board.bno }</td>
							<td style="width:550px" scope="row"  id="center"><a class='move'
								href='<c:out value="${board.bno }"/>'>${board.title } <b>[<c:out
											value="${board.replyCnt }" /> ]
								</b>
							</a></td>
							<td></td>
							<td scope="row">${board.writer }</td>
							<td scope="row" id="center"><fmt:formatDate pattern="yyyy/MM/dd"
							value="${board.regdate }"/></td>
						</tr>
					</c:forEach>



				</tbody>

			</table>
		</div>
		<!-- col 12 -->
	</div>
	<!-- row -->
	<button id='regBtn' type='button'>글쓰기</button>


<div class='pull-right'>
	<ul class='pagination'>
		<c:if test="${pageMaker.prev }">
			<li class='paginate_button previous'><a
				href="${pageMaker.startPage-1 }">Previous</a></li>
		</c:if>
		<c:forEach var='num' begin='${pageMaker.startPage }'
			end='${pageMaker.endPage }'>
			<li class="paginate_button ${pageMaker.cri.pageNum==num?"active":""}">
				<a href="${num }">${num }</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next }">
			<li class='paginate_button next'><a
				href="${pageMaker.endPage+1 }">Next</a></li>
		</c:if>
	</ul>
</div>
<form id='actionForm' action='/board/list' method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
	<input type='hidden' name='type' value="${pageMaker.cri.type }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">

</form>
<div class='modal fade' id='myModal' tabindex='-1' role='dialog'
	aria-labelledby='myModallabel' aria-hidden='true'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='close' data-dismiss='modal'
					aria-hidden='true'>&times;</button>
				<h4 class='modal-title' id='myModalLable'>Modal title</h4>
			</div>
			<div class='modal-body'>처리가 완료되었습니다.</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-info' data-dismiss='modal'>Close</button>
				<button type='button' class='btn btn-primary'>Save Changes</button>
			</div>
		</div>
	</div>
</div>
<!-- /.table-responsive -->
<c:choose>
  <c:when test="${id ne null}">
    <a href='javascript: like_func();'><img src="http://placehold.it/320x100?text=sample" /> id='like_img'></a>
  </c:when>
  <c:otherwise>
    <a href='javascript: login_need();'><img src="http://placehold.it/320x100/E8117F/ffffff?text=sample" /></a>
  </c:otherwise>
</c:choose>



</div>
<!-- container -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/* 좋아요 */
						function like_func(){
						  var frm_read = $('#frm_read');
						  var boardno = $('#boardno', frm_read).val();
						  //var mno = $('#mno', frm_read).val();
						  //console.log("boardno, mno : " + boardno +","+ mno);
						  
						  $.ajax({
						    url: "../liketo/like.do",
						    type: "GET",
						    cache: false,
						    dataType: "json",
						    data: 'rid=' +rid,
						    success: function(data) {
						      var msg = '';
						      var like_img = '';
						      msg += data.msg;
						      alert(msg);
						      
						      if(data.like_check == 0){
						        like_img = "http://placehold.it/320x100?text=sample";
						      } else {
						        like_img = "http://placehold.it/320x100/E8117F/ffffff?text=sample";
						      }      
						      $('#like_img', frm_read).attr('src', like_img);
						      $('#like_cnt').html(data.like_cnt);
						      $('#like_check').html(data.like_check);
						    },
						    error: function(request, status, error){
						      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    }
						  });
						}



						function updateHate(ths){
						    var idx = $("button.hateBtn").index(ths); 
						    faqrp_idx = $("input[name='faqrp_idx']").eq(idx).val();
						    if(!alreadyHateClick){
						        hcnt = parseInt(hcnt)+1;
						        alreadyLikeClick = true;
						        alreadyHateClick = true;
						    }
						    
						    var submitObj = new Object();
						    submitObj.faq_idx = faq_idx;
						    submitObj.faqrp_idx = faqrp_idx;
						    submitObj.me_id = me_id;
						    submitObj.faqrp_hateCnt=  hcnt;
						    
						    $.ajax({ 
						            url: path+"/onlinecounsel/csfaq/hateCnt.do", 
						            type: "POST", 
						            contentType: "application/json;charset=UTF-8",
						            data:JSON.stringify(submitObj),
						            dataType : "json",
						            async: false,
						           })
						          .done(function(resMap) {
						              alert("비추천하였습니다.");
						              location.reload();
						           }) 
						           .fail(function(e) {  
						               alert("한개의 글에 한번만 클릭이 가능합니다.");
						           }) 
						           .always(function() { 
						           }); 
						}
						

</script>


<!-- 	footer 시작		-------------------------------------------------------------- -->
<%-- <jsp:include page="../include/footer.jsp"></jsp:include>
 --%>
<jsp:include page="../include2/bottomLayout.jsp"></jsp:include>
