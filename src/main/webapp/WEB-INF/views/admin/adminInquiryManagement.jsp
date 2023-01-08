
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

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.form-popup {
	border-radius: 20px 20px 20px 20px/20px 20px 20px 20px;
	background-color: #FAE4FF;
	display: grid;
	margin: auto;
	margin-top: 50px;
	padding: 40px;
	align-items: center;
	justify-content: center;
	width: 100%;
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
	padding: 20px;
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
	float: right;
	margin-right: 30px;
	margin-left: 10px;
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
</style>


<!-- Custom styles for this template -->

<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
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
							href="${ contextPath }/admin.ad"> <span data-feather="home"
								class="align-text-bottom"></span> <br> <br> 사이트 관리
						</a></li>
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
							href="${ contextPath }/inquiryManage.ad"> <span
								data-feather="bar-chart-2" class="align-text-bottom"></span> <br>
								<br> 문의 관리
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
					<h1 class="h2">문의관리</h1>

				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">처리상태</th>
							
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach var="m" items="${mList }" varStatus="r">
							<tr>
								<th scope="row" class="check">${r.count }</th>
								<td>${ m.inquiryCate }</td>
								<td>${ m.inquiryTitle }</td>
								<td>${ m.writer }</td>
								<td>
<%-- 									<c:if test="${ m.inquiryStatus =='N' }"> --%>
										<button class="btn btn-primary answerBtn" type="button" value="${ r.index }">답변하기</button>
<%-- 									</c:if> --%>
<%-- 									<c:if test="${ m.inquiryStatus =='Y' }"> --%>
<!-- 										답변완료 -->
<%-- 									</c:if> --%>
								</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<c:forEach var="m" items="${ mList }" varStatus="r">
					<div class="shadow p-3 mb-5 bg-body rounded myForm myForm${ r.index }">
						<form action="${contextPath }/inquiryManage.ad" method="post" class="answerForm">
							<fieldset>
								<h1>
									<br>&nbsp;&nbsp;&nbsp;&nbsp;문의 답변
								</h1>
								<div class="textForm">
										<input type="hidden" value="${ r.count }" class="reply">
										<c:if test="${r.count == r.count} ">
											<textarea name="replyContentNope" class="replyContentNope" readonly>${ m.inquiryContent }</textarea>
										</c:if>
								</div>
								<br>
								<div class="textForm">
									<textarea name="replyContent" class="replyContent" placeholder="답변 내용">${ m.answerContent}</textarea>
								</div>
								<br>
	
								<button type="button" class="btn cancel btn-primary btn-lg right" value="${ r.index }">Close</button>
	
								<button type="button" class="btn reply btn-primary btn-lg right">답변</button>
								<input type="hidden" name="reply" class="hiddenReply" value="" >
								<input type="hidden" name="code" class="code" value="${ m.inquiryCode }">
							</fieldset>
						</form>
					</div>
				</c:forEach>

				<nav aria-label="Standard pagination example" style="float: right;">
					<ul class="pagination">
						<li class="page-item"><c:url var="goBack" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
							</c:url> <a class="page-link" href="${ goBack }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:url var="goNum" value="${ loc }">
								<c:param name="page" value="${ p }"></c:param>
							</c:url>
							<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
						</c:forEach>
						<li class="page-item"><c:url var="goNext" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
							</c:url> <a class="page-link" href="${ goNext }" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</main>
		</div>
	</div>



	<script>
		$(document).ready(function() {
			$('.myForm').hide();
		});

		$('.answerBtn').click(function() {
			const num = $(this).val();
			console.log(num);
			$('.myForm' + num).show();
		});

		$('label').css('display', 'inline-block');

		$('.cancel').click(function() {
			const num = $(this).val();

			$('.myForm' + num).hide();
		});
		
		$('.reply').click(function(){
			$(this).siblings('.hiddenReply').val($(this).siblings()[3].querySelector('textarea').value);
			$(this).siblings('.code').val($(this).siblings()[7].value);
			console.log($(this).siblings()[7].value);
			$(this).parent().parent('.answerForm').submit();
		});
	</script>


</body>
</html>
