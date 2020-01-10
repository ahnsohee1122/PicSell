<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Writer | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
/*    작가페이지 Main */
	.writer {width: 100%; min-height: 250px; background-image: url('${pageContext.request.contextPath}/img/write_banner.png'); background-repeat: no-repeat;}
	.explanation {margin-top: 5px; padding: 0px; background: none; border: 0; color: white; border-bottom: 1px solid white;}
	
	.modal-open {padding: 0;}
    .modal {padding: 0;}
	
/*    기본 글씨체 */
    @font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal; }
/*    Modal 글씨체 */
    @font-face {font-family: '777Balsamtint'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/777Balsamtint.woff') format('woff'); font-weight: normal; font-style: normal; }
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>

<!--  공모전 Main -->
    <div class="container-fluid m-0 p-0">
        <div class="writer row m-0 p-0">
        <div class="m-auto" style="text-align: center;">
            <div class="text-white" style="font-size: 32px; font-family: 'Cafe24Oneprettynight';">작가 홈</div>
            <div class="text-white" style="font-size: 30px; font-family: 'Cafe24Oneprettynight';">￣</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">작가가 되어 나의 작품을 알리고</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">새로운 수익을 만들어보세요!</div>
            <div class="text-white" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">누구나 작가가 될 수 있는 기회입니다!</div>
            <button type="button" class="explanation" data-toggle="modal" data-target="#Modal" style="font-size: 16px; font-family: 'Cafe24Oneprettynight';">작가 홈이란?</button>
			<div class="modal fade" id="Modal" role="dialog" aria-labelledby="Label" aria-hidden="true" style="top: 110px;">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content" style="margin: auto; width: 450px;">
			      <div class="modal-body text-left" style="font-family: '777Balsamtint';">
			          	<h5 class="py-3">나도 작가가 될 수 있을까?</h5>
			          	<h5 class="py-2">픽셀 회원이시라면!!<br>누구나 이미지를 업로드를 통해 작가가 되실 수 있습니다!</h5>
			          	<h5 class="py-2">여러분만의 창의력을 담은 사진과 일러스트를 자유롭게 올려보아요~<br>일단 이미지를 업로드하면 판매될 때마다 수익을 얻을 수 있고,<br>한 장의 이미지도 여러 번 판매할 수 있어요!<br>꾸준한 업로드를 통해 수익을 늘려나가 보세요!</h5>
			          	<h5 class="py-2">작가가 되어 나의 작품을 알리고<br>나의 작품에 대해 자부심을 느낄 수 있는 기회입니다!</h5>
			          	<h5 class="py-2">판매 수익금은 작가님의 포인트로 100% 지급되며<br>쌓인 포인트는 출금 신청을 통해 본인의 계좌로 환급받을 수 있습니다.</h5>
			          	<h5 class="py-2">* 이미지를 업로드 하고 싶다면,<br>아래 ＇이미지 업로드 하기＇를 통해 등록 신청을 하실 수 있습니다.</h5>
			          	<h5 class="py-2">* 상세한 가이드를 원하시면<br>하단 ＇작가 가이드＇를  참고해주시기 바랍니다.</h5>
			      </div>
			      <div class="modal-footer"><button type="button" class="btn btn-secondary m-auto" style="width: 150px; font-family: '777Balsamtint';" data-dismiss="modal">확인</button></div>
			    </div>
			  </div>
			</div>
        </div>
        </div>
    </div>
    
    <div class="container-fluid p-0" style="font-family: 'Cafe24Oneprettynight'; background-color: #f4f2f5;">
    	<div class="container px-0 pt-5" style="width: 100%; height: 350px;">
    		<div class="my-auto mx-4 h-100 text-center" style="border: 1px solid gray; border-radius: 30px;">
    			<h4 class="mt-5 mb-4">이미지 업로드 하기</h4>
    			<h6>업로드 해 주신 이미지는 내부 심사를 거쳐 픽셀 사이트에 노출되며,</h6>
    			<h6>최대 7일 이내에 모든 심사가 완료됩니다.</h6>
    			<a href="/writer/doupload" class="p-0 my-5 btn text-secondary border border-secondary" style="width: 50px; height: 50px; font-size: 35px;">+</a>
    		</div>
    	</div>
    	<div class="container py-5 px-2">
    		<div class="pb-3">
	    		<h3>작가 가이드</h3>
	    		<hr>
	    		<div class="d-none d-lg-block">
	    			<h5>작가 회원이 지켜야 할 점</h5>
		    		<h6>- 픽셀 회원님이시라면 누구나 이미지 업로드를 통해 작가가 되실 수 있습니다!</h6>
		    		<h6>- 가능하다면 이미지는 재산권 및 초상권 동의서를 받는 것이 좋습니다.</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;* 추후 일어날 수 있는 법적 분쟁에 대비할 수 있으며 안정적으로 본인의 이미지를 판매할 수 있습니다.</h6>
		    		<h6>- 자신이 업로드한 이미지가 재산권 및 초상권 침해로 인한 법적 분쟁으로 이어질 경우 픽셀 측에서는 책임지지 않습니다.</h6>
		    		<h5 class="mt-4">작가 회원의 판매 수익금</h5>
		    		<h6>- 작가님이 업로드한 이미지는 한 장당 500원에 판매되며, 이미지가 판매될 때마다 작가 회원은 판매 포인트를 받습니다.</h6>
		    		<h6>- 판매 포인트는 금액 대비 회사가 정한 적정 비율로 지급되며, 수익금 포인트는 향후 변동될 수 있습니다.</h6>
		    		<h6>- 활동에 따른 포인트 지급 비율에 대한 변동사항은 추후 공지사항 또는 가이드에 업데이트 하겠습니다.</h6>
		    		<h6>- 쌓인 포인트는 출금 신청을 통해 본인의 계좌로 환급받을 수 있습니다.</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;* 최소 출금 가능 금액 = 5,000포인트(원)</h6>
		    		<h5 class="mt-4">업로드 승인 절차</h5>
		    		<h6>- 픽셀에 업로드 해 주신 이미지는 내부 심사를 거쳐 픽셀 사이트에 노출되는데요, 최대 7일 이내에 모든 심사가 완료됩니다.</h6>
		    		<h6>- 내가 업로드한 이미지의 심사 상태(심사중, 승인, 거절)가 궁금하시다면 ＇마이페이지＇의 ＇심사/승인 내역＇에서 확인하실 수 있습니다.</h6>
		    		<h6>- 거절된 이유가 궁금하시다면 ＇심사/승인 내역＇에서 거절 사유를 확인하실 수 있습니다. 남겨드린 거절 사유 대로 수정하셔서 재 업로드 해주시면 됩니다.</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;* 거절 사유에 대해 자세한 설명이 필요하시면 따로 문의 주시길 바랍니다.</h6>
	    		</div>
	    		<div class="d-block d-lg-none">
	    			<h6>상세한 가이드 확인은 화면을 늘려주세요!</h6>
	    		</div>
    		</div>
    		<div class="pt-5 pb-3">
    			<h3>이미지 가이드</h3>
	    		<hr>
	    		<div class="d-none d-lg-block">
		    		<h5>이미지의 저작권</h5>
		    		<h6>- 이미지의 저작권은 원칙적으로 이미지의 창작자인 작가 회원에게 있습니다.</h6>
		    		<h6>- 구매자에게는 이미지를 사용할 수 있는 권리(이용권)만을 판매합니다.</h6>
		    		<h6>- 따라서 작가는 한 장의 이미지를 여러 번 판매할 수 있으며, 구매자는 이미지를 재분배, 재배포, 재판매할 수 없습니다.</h6>
		    		<h5 class="mt-4">이미지 업로드 기본사항</h5>
		    		<h6>- 업사이징 사진(해상도를 일부러 키운 사진)은 판매가 불가능하며 승인이 거절될 수 있습니다.</h6>
		    		<h6>- 지나치게 압축된 사진은 확대 시 픽셀이 깨지므로 판매가 불가능합니다.</h6>
		    		<h6>- 여러장의 이미지를 업로드 시, 같거나 비슷한 이미지의 경우 승인이 거절될 수 있습니다.</h6>
		    		<h5 class="mt-4">상업적으로 사용 가능한 이미지?</h5>
		    		<h6>- 상업적으로 사용 가능한 이미지란 수익을 창출하는 제품이나 서비스를 홍보, 광고하는 이미지를 말합니다.</h6>
		    		<h6>- 상업적으로 사용 가능한 이미지는 제품 광고에 사용될 수 있으며, 제품 및 서비스를 홍보하는 웹 사이트 및 소셜 미디어 포스팅에 사용될 수 있습니다.</h6>
		    		<br>
		    		<h6>- 업로드한 작가 회원의 이미지는 아래와 같은 상업적 용도로 사용될 수 있습니다.</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;1. 웹디자인(홈페이지, 웹 배너, 팝업, 뉴스레터, 쇼핑몰, 블로그, SNS 등)</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;2. 모바일 디자인(모바일 홈페이지, 어플리케이션 등)</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;3. 인쇄 디자인(브로셔, 명함, 비판매출판, 실사 출력, 사보, 카탈로그 등)</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;4. 광고 디자인(옥외광고, 신문광고, 홍보용 포스터, 현수막, 전단 등)</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;5. 영상 디자인</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;6. 출판물(서적, e-book, 교과서, 학습지, 단행본 등)</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;7. 기타 상업적 용도의 모든 콘텐츠</h6>
		    		<br>
		    		<h6>- 그러나 다음 용도로는 사용되지 않습니다.</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;1. 성인광고, 고리대금업 등</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;2. 과대광고 ex) 성형외과 비교 사진(before & after)</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;3. 인격권을 훼손하는 용도(비방, 모욕)</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;4. 기타 불법적인 사용</h6>
		    		<h5 class="mt-4">재산권 및 초상권 코멘트</h5>
		    		<h6>- 이미지에 사람, 동물, 창작물, 건물이 노출되었다면 재산권 및 초상권에 대한 코멘트를 자세히 적어주시기 바랍니다.</h6>
		    		<h6>- 남겨주신 코멘트를 바탕으로 심사를 하여 승인처리를 해 드립니다.</h6>
		    		<h6>- 만약 아무 코멘트를 남겨주지 않았을 시 업로드 해 주신 이미지에 대한 판단 기준이 없어 승인이 거절될 수 있습니다.</h6>
		    		<h6>- 장소, 위치, 이름을 정확하게 적어서 업로드 해주시기 바랍니다.</h6>
		    		<h6>- 단순 자연물 이미지의 경우 ＇해당 없음＇으로 적어주시기 바랍니다.</h6>
		    		<br>
		    		<h6>[올바른 예시]</h6>
		    		<h6>1. 사진에 나온 인물은 친한 친구이며 상업적인 사용의 초상권 동의를 얻었습니다.</h6>
		    		<h6>2. 사진에 나온 반려동물은 본인이 직접 키우는 동물이며 재산권에 문제가 없습니다.</h6>
		    		<h6>3. 사진에 나온 카페는 자주 가는 가게이며 해당 주인에게 상업적인 사용의 재산권 동의를 얻었습니다.</h6>
		    		<br>
		    		<h6>[잘못된 예시]</h6>
		    		<h6>1. 가족입니다. (가족이거나 친한 지인이어도 상업적인 사용의 초상권 동의를 얻었는지 정확히 명시해 주어야 합니다.)</h6>
		    		<h6>2. 동의 얻음. (코멘트가 자세하지 않아 정확한 심사가 불가능합니다.)</h6>
		    		<h6>3. 촬영 동의를 얻었습니다. (단순 촬영 동의로는 상업적인 사용이 불가능합니다.)</h6>
		    		<h5 class="mt-4">비 상업적 용도의 이미지 (에디토리얼 전용 이미지)</h5>
		    		<h6>- 에디토리얼 전용 이미지 뉴스 기사를 포함한 보도 전용 또는 기타 뉴스 가치가 있는 용도로만 사용할 수 있습니다.</h6>
		    		<h6>- 비 상업적 용도의 이미지는 광고, 프로모션 및 상업적인 목적의 광고기사 등 그 어떤 상업적인 목적으로는 쓰일 수 없습니다.</h6>
		    		<h6>- 재산권 및 초상권이 해결되지 못한 이미지는 상업적인 목적으로 업로드하고 판매할 수 없습니다.</h6>
		    		<h6>&nbsp;&nbsp;&nbsp;그러나 이러한 이미지는 ＇에디토리얼 전용＇으로 업로드하여 판매할 수 있습니다.</h6>
	    		</div>
	    		<div class="d-block d-lg-none">
	    			<h6>상세한 가이드 확인은 화면을 늘려주세요!</h6>
	    		</div>
    		</div>
    	</div>
    </div>
      
    <div class="container-fluid py-4 py-lg-5 m-0" style="font-family: 'Cafe24Oneprettynight';">
        <div class="container px-0 pb-2">
    		<div class="m-auto text-center">
    			<h3 style="font-size: 25px;">픽셀에 이미지 업로드 할 준비 되셨나요?</h3>
    			<div class="mt-4">
    				<button type="button" onclick="$('html, body').stop().animate({scrollTop:0}, 2000);" class="border border-danger rounded-lg text-danger" style="width: 150px; height: 35px; background-color: white;">시작하기</button>
    			</div>
    		</div>
    	</div>
    </div>
    
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>