<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <!-- icons fonts -->

</head>
<body>
  <div class="funding-header text-center">
    <div class="background"></div>
    <p class="title-info">${ f.fundingCate }</p>
    <h2 class="title"><a href="#">${ f.fundingTitle }</a></h2>
  </div>
  <div class="container-fluid text-center funding-category">
    <div class="row">
      <div class="col-2 offset-2"><a class="tab-link" href="#" style="font-weight: 1000px; color:black;">정보 </a></div>
      <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingNotice.fund?bId=${f.fundingNum}">새소식 </a></div>
      <div class="col-2"><a class="tab-link" href="#">리뷰 </a></div>
      <div class="col-2"><a class="tab-link" href="#">서포터 <span class="count-total"></span></a></div>
    </div>
  </div>

  <div class="container funding-content">
    <div class="row g-2">
      <!-- 왼쪽 사이드바 -->
      <div class="col-md-9">
      
      		<!-- 정보 -->
	      <div class="left-content">
	        <!-- 대표 이미지-->
	        <img src="${ contextPath }/resources/funding/${image.imageRename}" alt="...">
	
	        <!-- 안내사항 -->
	        <div class="notification">
	          <p>
	            <strong>목표 금액</strong> <span>${ f.targetMoney }</span><br>
	            <strong>펀딩 기간</strong> <span>${ f.fundingStart } ~ ${ f.fundingEnd }</span><br>
	          </p>
	          <p>
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
      <div class="col-md-3 right-content">
        <div class="state-box">
          <p class="remaining-day"><strong>20일 남음</strong></p>
          <div class="rate-bar"><em></em></div>
          <p class="achievement-rate"><strong>0</strong>% 달성</p>
          <p class="total-amount"><strong>${ f.currentMoney }</strong>원 펀딩</p>
          <p class="total-supporter"><strong>0</strong>명의 서포터</p>
        </div>
        
        <div class="container goal-box">
          <div class="row g-0">
            <div class="col-3"><strong>목표금액</strong></div>
            <div class="col-9"><p class="goal-amount">${ f.targetMoney } 원</p></div>
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

        <div class="container funding-buttons g-0">
          <button class="btn-funding" data-bs-toggle="modal" data-bs-target="#funding-modal">펀딩하기</button>
          <div class="row g-1">
            <div class="col-sm-4"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#dibs-modal">
              <img src="resources/img/heart.png"/>
              <span class="dips-count">5</span></button>
            </div>
            <div class="col-sm-4"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#share-modal">공유하기</button></div>
            <div class="col-sm-4"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#report-modal">신고하기</button></div>
          </div>
        </div>
      </div>
    </div>
  </div>


<!-- 모달 -->
<!-- 펀딩하기 완료 -->
<div class="modal fade" id="funding-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container-fluid g-0">
          <div class="row g-0">
            <div class="col-md-5">
              <img class="thumbnail" src="https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=768,574"/>
            </div>
            <div class="col-md-7">
              <div class="modal-funding-right">
                <h5>펀딩이 완료되었습니다 !</h5>
                <p class="modal-funding-title">[서울시 용답동] 나정순 할매 쭈꾸미 택배 전국 배송</p>
                <p class="modal-funding-store">업체이름(가게이름)</p>
                <div class="modal-funding-status">
                  현재 <span class="modal-funding-goal">100</span>명 중 <span class="modal-funding-amount">45</span>명이 모였어요.
                  원팅 달성 시 알림이 갑니다.
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer modal-funding-footer">
        <div class="container">
          <div class="row g-2">
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn">다른 펀딩 둘러보기</button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn">내 펀딩 목록보기</button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn" data-bs-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- 찜하기 완료 -->
<div class="modal fade" id="dibs-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="modal-funding-right">
          <p class="dibs-message">
            찜하기가 완료되었습니다.<br>
            마이페이지 찜하기 모아보기에서 확인하실 수 있습니다.
          </p>
        </div>
      </div>
      <div class="modal-footer modal-dibs-footer">
        <div class="container">
          <div class="row g-2">
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn">다른 펀딩 둘러보기</button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn">내 찜 목록보기</button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn" data-bs-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- 공유하기 완료 -->
<div class="modal fade" id="share-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="modal-funding-right">
          <p class="dibs-message">
            공유하기는 버튼이 떠야하나<br>
            카카오 / 네이버 / 페이스북 이런거
          </p>
        </div>
      </div>
      <div class="modal-footer modal-dibs-footer">
        <div class="container">
          <div class="row g-2">
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn">다른 펀딩 둘러보기</button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn">내 찜 목록보기</button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn" data-bs-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- 신고하기 완료 -->
<div class="modal fade" id="report-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="modal-funding-right">
          <p class="dibs-message">
            신고가 완료되었습니다.<br>
            ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
          </p>
        </div>
      </div>
      <div class="modal-footer modal-dibs-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 공유하기 완료 -->
<div class="modal fade" id="share-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="modal-funding-right">
          <p class="dibs-message">
            공유하기는 나중에 할게요.<br>
            마이페이지 찜하기 모아보기에서 확인하실 수 있습니다.
          </p>
        </div>
      </div>
      <div class="modal-footer modal-dibs-footer">
        <div class="container">
          <div class="row g-2">
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn">다른 펀딩 둘러보기</button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn">내 찜 목록보기</button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn" data-bs-dismiss="modal">닫기</button>
            </div>
          </div>
     	</div>
      </div>
   </div>
 </div>
</div>

<!-- 신고하기 완료 -->
<div class="modal fade" id="report-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container-fluid g-0">
          <div class="row g-0">
            <div class="col-md-7">
              <div class="modal-funding-right">
                <p class="dibs-message">
                  신고가 완료되었습니다.<br>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer modal-dibs-footer">
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
		console.log(${bId});
	</script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>