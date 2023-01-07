﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>펀딩 상세페이지</title>
  <!-- CSS Files -->
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
  <link rel="stylesheet" href="resources/css/fundingMain.css" />
  <link rel="stylesheet" href="resources/css/bootstrap-custom.css" />

	<!-- kakao share -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
	<script>
	  Kakao.init('9d6a7c5e2b95f01e1fdfee7c815cc918'); // 사용하려는 앱의 JavaScript 키 입력
	</script>
	
	<style>
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		.font{font-family: 'NanumSquareNeo-Variable';}
		
		.creator-info{
			    border: 1px solid #8c86c7;
		    	border-radius: 8px;
		    	padding: 16px;
		}
		
		.i{color: #8c86c7;}
		
		.btn{outline: 1px solid #8c86c7;}
		
	</style>

</head>
<body>
  <div class="funding-header text-center font">
    <div class="background"></div>
    <p class="title-info" style="color: #8c86c7;">${ f.fundingCate }</p>
    <h2 class="title"><a href="#">${ f.fundingTitle }</a></h2>
  </div>
  <div class="container-fluid text-center funding-category font">
    <div class="row">
      <div class="col-2 offset-2"><a class="tab-link" href="${ contextPath }/selectFundingBoard.fund?bId=${f.fundingNum}&writerNo=${creatorNum}" style="font-weight: 1000px; color:black;">정보 </a></div>
      <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingNotice.fund?bId=${f.fundingNum}">새소식 </a></div>
      <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingReview.fund?bId=${f.fundingNum}">리뷰 </a></div>
      <div class="col-2"><a class="tab-link" href="#">서포터 ${ supCount } <span class="count-total"></span></a></div>
    </div>
  </div>

  <div class="container funding-content">
    <div class="row g-2">
      <!-- 왼쪽 사이드바 -->
      <div class="col-md-9">
      		<!-- 정보 -->
	      <div class="left-content">
	        <!-- 대표 이미지-->
	        <img src="${ contextPath }/resources/funding/${img.imageRename}" alt="..." width="100%" height="600px">
			
			<!-- 펀딩 요약 -->
			<h4 class="font m-3">${ f.fundingSummary }</h4>
			
	        <!-- 안내사항 -->
	        <div class="notification" style="background-color: #8c86c7;">
	          <p style="color: white;">
	            <strong>목표 금액</strong> <span class="toLocaleMoney">${ f.targetMoney }</span><br>
	            <strong>펀딩 기간</strong> <span>${ f.fundingStart } ~ ${ f.fundingEnd }</span><br>
	          </p>
	          <p style="color: white;">
	            100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.
	          </p>
	        </div>
	
	        <div class="about-funding">
	          <span class="icon"></span>
	          <strong>크라우드펀딩 제대로 알고 펀딩하자</strong>
	          <button class="more-button">자세히 알아보기</button>
	        </div>
	        
	        <!-- 상품 상세설명 -->
	        <div class="funding-detail">
	          <p><strong>펀딩 이야기</strong></p>
	          ${ f.fundingContent }
	        </div>
	        <br><br><br>
	      </div>
	      
      </div>

      <!-- 오른쪽 사이드바 -->
      <div class="col-md-3 right-content font">
        <div class="state-box">
          <jsp:useBean id="now" class="java.util.Date"/>
          <fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowFmtTime" scope="request"/>
           <fmt:parseNumber value="${ f.fundingEnd.time / (1000*60*60*24) }" integerOnly="true" var="feFmtTime" scope="request"/>
          <p class="remaining-day"><strong>${feFmtTime - nowFmtTime + 1 }일 남음</strong></p>
          <div style="height: 2px; width: 100%; background-color: gray;"><span id="progressBar" style="display: block; background-color: #8c86c7; height: 2px; width: 26%;"></span></div>
          <fmt:formatNumber value="${ f.currentMoney / f.targetMoney }" type="percent" var="percentage"/>
          <input type="hidden" value="${ percentage }" id="progressBarPercent">
          <p class="achievement-rate"><strong>${ percentage }</strong> 달성</p>
          <p class="total-amount"><strong class="toLocaleMoney">${ f.currentMoney }</strong>원 펀딩</p>
          <p class="total-supporter"><strong>${ supCount }</strong>명의 서포터</p>
        </div>
        
        <div class="container goal-box">
          <div class="row g-0">
            <div class="col-3"><strong>목표금액</strong></div>
            <div class="col-9"><p class="goal-amount toLocaleMoney">${ f.targetMoney }</p></div>
          </div>
          <div class="row g-0">
            <div class="col-3"><strong>펀딩 기간</strong></div>
            <div class="col-9"><p class="fundint-period">${ f.fundingStart } ~ ${ f.fundingEnd }
            </p></div>
          </div>
          <div class="row g-0">
            <div class="col-3"><strong>결제</strong></div>
            <div class="col-9"><p class="perchase-procedure">목표금액 달성시 ${ f.fundingEnd }에 결제 진행</p></div>
          </div>
        </div>

		<c:set value="<%= new java.util.Date() %>" var="today"></c:set>
		<fmt:formatDate value="${ today }" pattern="yyyy-MM-dd" var="fmtToday"/>
        <div class="container funding-buttons g-0">
<!--           <button class="btn-funding" data-bs-toggle="modal" data-bs-target="#funding-modal">펀딩하기</button> -->
		<c:if test="${ m != null && fmtToday > f.fundingStart}">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="location.href='${contextPath}/payView.pay?fundingNum=${ bId }'">펀딩하기</button>
		</c:if>
		<c:if test="${ m == null && fmtToday > f.fundingStart }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="noLogin()">펀딩하기</button>
		</c:if>
		<c:if test="${ m != null && fmtToday < f.fundingStart}">
		 	<button class="btn-funding" style="background-color: #8c86c7;">오픈예정 알림신청</button>
		</c:if>
		<c:if test="${ m == null && fmtToday < f.fundingStart }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="noLogin()">오픈예정 알림신청</button>
		</c:if>
          <div class="row g-1">
          <c:if test="${ !ok }">
          	<c:if test="${ m == null }">
            <div class="col-sm-6"><button onclick="noLogin()" class="btn-funding-small">
              <img src="${ contextPath }/resources/funding/찜X1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
           </c:if>
           <c:if test="${ m != null }">
            <div class="col-sm-6"><button onclick="location.href='${contextPath}/insertDibs.fund?fundingNum=${ f.fundingNum }&id=${ login }&writerNo=${creatorNum}'" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#dibs-modal">
              <img src="${ contextPath }/resources/funding/찜X1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
            </c:if>
           </c:if>
           <c:if test="${ ok }">
            <div class="col-sm-6"><button onclick="location.href='${contextPath}/deleteDibs.fund?fundingNum=${ f.fundingNum }&id=${ login }&writerNo=${creatorNum}'" class="btn-funding-small">
              <img src="${ contextPath }/resources/funding/찜1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
           </c:if>
            <div class="col-sm-6"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#share-modal"><img src="resources/wanting/share.png"/>공유하기</button></div>
<!--             <div class="col-sm-4"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#report-modal">신고하기</button></div> -->
            <c:if test="${ !yn }">
            	<div><button class="btn-funding-edit" onclick="location.href='${contextPath}/fundingEdit.fund?fundingNum=${ f.fundingNum }'">펀딩 수정하기</button></div>
            </c:if>
          </div>
        </div>
        <hr>
        
        <div>
        	<div class="container creator-info" style="text-align:center;">
        		<div class="mb-2">
	        		<a>
		        		<img class="me-3" src="${ contextPath }/resources/myPageImage/뉴프로필.png" width="50" height="50">
		        		<span style="font-size: 20px;">닉네임</span>
	        		</a>
        		</div>
        		<div class="mb-2">
<!--         			<span>만족도</span> -->
        			<span class="ps-3"><i class="bi bi-person-fill fs-4"></i>&nbsp;&nbsp;팔로워 0명</span>
        		</div>
        		<div>
        			<button class="btn" onclick="location.href=${contextPath}/sendMassage.me"><i class="bi bi-chat-left-dots"></i>&nbsp;&nbsp;문의하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
        			<button class="btn"><i class="bi bi-plus"></i>&nbsp;&nbsp;팔로우</button>
        		</div>
        	</div>
      	</div>
      	
      </div>
    </div>
  </div>


<!-- 모달 -->
<!-- 공유하기 -->
	<div class="modal fade" id="share-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="modal-wanting-right">
				<a id="kakaotalk-sharing-btn" class="link-icon kakao" href="javascript:;">카카오톡</a>
				<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">페이스북</a>
		        <a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">트위터</a>
	        </div>
	      </div>
	      <div class="modal-footer modal-dibs-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='${contextPath}/fundingList.fund'">다른 펀딩 둘러보기</button>&nbsp;&nbsp;
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
		</div>
	  </div>
	</div>



  <!-- cursor -->
  <script type="module">
    import { fairyDustCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
    import { rainbowCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
  
    new fairyDustCursor();
    // new rainbowCursor();
  </script>

	<script>
		function noLogin(){
			alert('로그인 후 이용해주세요.');
		}
		
		changeMoney();
		function changeMoney() {
			const targetMoney = document.getElementsByClassName('toLocaleMoney');
    		for(const span of targetMoney) {
    			const before = parseInt(span.innerText);
    			span.innerText = " " + before.toLocaleString() + "원";
    		}
		}
		
		const progressBar = document.getElementById('progressBar');
		const progressBarPercent = document.getElementById('progressBarPercent');
		const percent = parseInt(progressBarPercent.value.substring(0, progressBarPercent.value.length-1));
		if(percent >= 100) {
			progressBar.style.width = "100%";
		} else {
			progressBar.style.width = percent + "%";
		}
		
		// 펀딩 공유하기 ========================================
	    function shareTwitter() {
	        var sendText = "If You WANT IT, You Can Get It!"; // 전달할 텍스트
	        let fundingNum = ${ f.fundingNum };
	        let writerNo = ${ creatorNum };
	        var sendUrl = "http://localhost:8080/wantit/selectFundingBoard.fund?bId=" + fundingNum + "&writerNo=" + writerNo; // 전달할 URL
	        window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	    }
	    function shareFacebook() {
	        var sendUrl = "http://localhost:8080/wantit/selectFundingBoard.fund?bId=" + fundingNum + "&writerNo=" + writerNo; // 전달할 URL
	        window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	    }
	    
	    // 원팅 공유하기 - 카카오톡 ========================================
		Kakao.Share.createDefaultButton({
	    container: '#kakaotalk-sharing-btn',
	    objectType: 'feed',
	    content: {
	      title: '${ f.fundingTitle }',
	      description: '함께 만들어나가는 원팅',
	      imageUrl:
			'${ contextPath }/resources/funding/${img.imageRename}',
	      link: {
	        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
	        webUrl: 'http://localhost:8080/wantit/selectFundingBoard.fund?bId=${f.fundingNum}&writerNo=${writerNum}',
	      },
	    },
	    buttons: [
	      {
	        title: '원잇 사이트로 이동',
	        link: {
	          webUrl: 'http://localhost:8080/wantit/home.do',
	        },
	      },
	    ],
	  	});
	</script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>