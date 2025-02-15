<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!Doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Dashboard Template · Bootstrap v5.2</title>
 

<style>
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#body {
	font-family: 'NanumSquareNeo-Variable';
}

.replyContent {
	background-color: white;
	width: 100%;
	height: 100px;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
}
.replyContentNope {
	background-color: white;
	width: 100%;
	height: 100px;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
}

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.form-popup {
	background-color: lightgray;
	display: grid;
	margin: auto;
	margin-top: 50px;
	padding: 40px;
	align-items: center;
	justify-content: center;
	width: 100%;
}

.form-floating {
	margin-left: 30px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.joinInfo {
	background-color: white;
	width: 100%;
	height: 100px;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
}

#boxWrap {
	width: auto;
	height: auto;
}

#boxWrap : after {
	content: "";
	display: block;
	clear: both;
}

#boxWrap p+p {
	margin-left: 5px;
}

#boxWrap .original {
	float: left;
	width: 100px;
	height: 100px;
	background-color: #cbcbcb;
	text-align: center;
	line-height: 100px;
}

.btnWrap {
	width: 100%;
}

.right {
	
	margin-right: 400px;
	margin-left: 200px;
	line-height: 50px;
	text-align: center;
	border-radius: 20px;
	width: 150px;
}

.table {
	vertical-align: middle;
	text-align: center;
}

.find-btn {
	text-align: center;
}

.find-btn1 {
	display: inline-block;
}

.wiwidth {
	width: 400px;
}

.make {
	float: right;
	margin-right: 20px;
}
input[type="checkbox"] {
    display:none;
}

input[type="checkbox"] + label {
    color:#f2f2f2;
}

input[type="checkbox"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) left top no-repeat;
    cursor:pointer;
}

input[type="checkbox"]:checked + label span {
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -19px top no-repeat;
}

.checkcheck{
	

}
</style>


<!-- Custom styles for this template -->
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- summernote -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
  <script src="resources/css/summernote-bs4.min.js"></script>
  <script src="resources/css/summernote-ko-KR.js"></script>
</head>
<body id="body">
	
	<header>
		<jsp:include page="../common/navbar.jsp"></jsp:include>
	</header>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position" style="height: 1000px;">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/projectManage.ad"> <span
								data-feather="file" class="align-text-bottom"></span> <br>
							<br> 프로젝트 승인 / 거절
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/reviewManage.ad"> <span
								data-feather="shopping-cart" class="align-text-bottom"></span> <br>
							<br> 리뷰 신고 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/noticeManage.ad"> <span
								data-feather="users" class="align-text-bottom"></span> <br>
							<br> 공지사항 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/adManage.ad"> <span
								data-feather="layers" class="align-text-bottom"></span> <br>
							<br> 광고의뢰 관리
						</a>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/memberManage.ad"> <span
								data-feather="layers" class="align-text-bottom"></span> <br>
							<br> 회원 관리
						</a></li>
					</ul>
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">공지사항 관리</h1>
					<button type="button" class="btn btn-primary btn-lg make" id="make" type="button" onclick="location.href='${contextPath}/noticeMake.ad'">
						<span class="">이벤트 / 공지사항 작성</span>
					</button>
				</div>
				
				<table class="table" style="height: auto;">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">공지사항 / 이벤트</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">수정</th>							
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">

						<c:forEach var="m" items="${mList }" varStatus="r">
						
<%-- 						<span style="display: none">${ m.noticeTitle }</span> --%>
<%-- 						<input type="hidden" name="code" class="code" value="${ m.noticeNum }" > --%>
									
							<tr>
								<th scope="row">${r.count }</th>
								<td>

									<c:if test="${ m.noticeDivision == 'N' }">
									공지사항
									</c:if>
									<c:if test="${ m.noticeDivision == 'E' }">
									이벤트
									</c:if>
								</td>
								<td>${ m.noticeTitle }</td>
								<td>${ m.noticeModifyDate }</td>
								<td>
									
									<c:if test="${ m.noticeStatus == 'N' }">
										수정불가능
									</c:if>
									<c:if test="${ m.noticeStatus == 'Y' }">
										<button class="btn btn-primary answerBtn" type="button">
										<span style="display: none">${ m.noticeNum }</span>
										<input type="hidden" name="title" class="title" value="${ m.noticeDivision }" >
										글 수정</button>
									</c:if>
								</td>
								<td><c:if test="${m.noticeStatus == 'Y' }">
										<div class="btn-group">
											<button type="button"
												class="btn btn-sm btn-outline-danger dropdown-toggle"	
												data-bs-toggle="dropdown" aria-expanded="false">
												글 삭제</button>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item delete"
													data-bs-toggle="modal" data-bs-target="#delete">
														글 삭제<span style="display: none">${m.noticeTitle }</span>
												</a></li>
											</ul>
										</div>
									</c:if> <c:if test="${m.noticeStatus eq 'N' }">
										<button type="button"
											class="btn btn-sm btn-outline-secondary dropdown-toggle"
											data-bs-toggle="dropdown" aria-expanded="false" disabled>
											삭제된 글</button>
									</c:if></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
								
				<div id="delete" class="modal fade" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">게시글 삭제</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>정말 글을 삭제시키시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-sm btn-outline-secondary"
									data-bs-dismiss="modal">삭제취소</button>
								<form action="${contextPath }/deleteNotice.ad" method="post">
									<input type="hidden" name="id">
									<button id="modalDeleteButton" type="button"
										class="btn btn-sm btn-outline-danger">글 삭제</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<nav aria-label="Standard pagination example" style="float: right;">
					<ul class="pagination">
						<li class="page-item">
							<c:url var="goBack" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
							</c:url> 
							<a class="page-link" href="${ goBack }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:url var="goNum" value="${ loc }">
								<c:param name="page" value="${ p }"></c:param>
							</c:url>
							<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
						</c:forEach>
						<li class="page-item"><c:url var="goNext" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
							</c:url> 
							
							<a class="page-link" href="${ goNext }" aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
				
			</main>
		</div>
	</div>


	<script>
	
    
		$(document).ready(function() {
			$('.myForm').hide();
		});
		
		$(document).ready(function() {
			$('.myMakeForm').hide();
		});
		
// 		$('.answerBtn').click(function() {
// 			const num = $(this).val();
// 			console.log(num);
// 			$('.myForm' + num).show();
// 		});
		
		$('.make').click(function() {
			$('.myMakeForm').show();
		});
		
		$('label').css('display', 'inline-block');
	
		$('.cancel').click(function() {
			const num = $(this).val();
			$('.myForm' + num).toggle();
		});
		
		$('.makeNope').click(function() {	
			$('.myMakeForm').hide();
		});

		$(document).on("click", ".answerBtn", function(){
            const code = this.children[0].innerText;
            const division = this.children[1].value;
            
			
			console.log(code);
            console.log(division);
            
            location.href = '${contextPath}/editNotice.ad?code='+code+'&division='+division;
            
    	});
		
// 		$(document).on("click", ".featured__item__pic.set-bg", function(){
//             console.log(this);
//             const cateNum = this.children[0].value;
//             const cateName = this.children[1].innerText;
//             console.log(cateNum);
//             console.log(cateName);
            
//             location.href = '${contextPath}/selectCategory.su?cateName='+cateName+'&cateNum='+cateNum+'&page='+${pi.currentPage};
//     });
		
//  		$('.answerBtn').click(function(){

//  				$("input[name=title]").val(title);
// 				const code = $(this).parent().parent().parent().find("input");
				
// 				console.log(code);
// 				for( var i =0; i<10; i++){
// 					console.log(title[i])
// 				}
// 				for(var tResult of tValue){
// 					console.log(tResult);
// 				}
// 				for(var cResult of cValue){
// 					console.log(cResult);
// 				}
				
				

//  		});
 		
 		
 	// // 			$(this).siblings('.hiddenReply').val($(this).siblings()[3].querySelector('textarea').value);
 	// // 			$(this).siblings('.hiddenTitle').val($(this).siblings()[1].querySelector('textarea').value);
		 // 			$(this).siblings('.code').val($(this).siblings()[8].value);
// 				$('.answerBtn').submit();
		
		//삭제 정보 넘기기	
		const btns = $(".delete");
		for(const btn of btns) {
			btn.addEventListener("click", function(){
				const id = $(this).find("span").text();
				$("input[name=id]").val(id);
				console.log(id);
			});
		}
		
		// 글 삭제	
		$("#modalDeleteButton").on("click", function(){
			$("form").submit();
		});
					
	</script>
	
	

</body>
</html>

