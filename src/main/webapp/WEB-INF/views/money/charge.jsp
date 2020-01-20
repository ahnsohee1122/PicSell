<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Charge | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.1.0.min.js" type="application/javascript"></script>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<jsp:include page="../key/profile.jsp" flush="false"/>
	
	<div class="container-fluid m-0 py-5" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container m-auto" style="max-width: 1500px;">
			<div class="row">
				<div id="floatMenu" class="col-5 col-md-3 col-xl-2 py-2 text-center p-0 d-none d-md-block" style="height: 410px; border: 1px solid gray; box-sizing: border-box; border-radius: 10px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 22px; text-decoration: none;">My Page</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/buy_list.do" style="color: black; font-size: 16px; text-decoration: none;">구매 내역 확인</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/myPoint.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 입출금 내역 확인</a></div>
						<div class="px-3 py-1 mb-3 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/charge.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 충전</a></div>
					</div>
					<hr class="py-1 m-auto" style="max-width: 220px;">
					<div class="row m-0 px-0 w-100 text-left">
						<div class="px-3 py-2 w-100"><a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; font-size: 22px; text-decoration: none;">Writer Page</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; font-size: 16px; text-decoration: none;">작가 정보 조회</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/profit_list.do" style="color: black; font-size: 16px; text-decoration: none;">수익 & 판매 내역 확인</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/moneyBack.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 환급</a></div>
						<div class="px-3 py-1 w-100 quickMenu"><a href="${pageContext.request.contextPath}/money/change.do" style="color: black; font-size: 16px; text-decoration: none;">포인트 전환</a></div>
					</div>
				</div>
				<div class="col-12 col-md-9 col-xl-10 px-0 px-md-3 text-center">
					<div class="m-auto w-100 h-100 py-5" style="border: 1px solid gray; border-radius: 10px;">
						<form class="mx-auto px-2 px-ml-0" style="max-width: 500px;">
							<h4>충전하기</h4>
						</form>
						<form class="mx-auto my-5" style="max-width: 100%;">
							<div class="row w-100 mx-auto">
								<div class="col-3 p-0" style="height: 200px;">
									<img src="${pageContext.request.contextPath}/img/5000.png" style="width: 100px; height: 100px;">
									<div class="custom-control custom-radio my-3 text-center">
									  	<input type="radio" id="customRadio1" name="money" value="200" class="custom-control-input money">
									  	<label class="custom-control-label" for="customRadio1">5000원</label>
									</div>
								</div>
								<div class="col-3 p-0">
									<img src="${pageContext.request.contextPath}/img/10000.png" style="width: 100px; height: 100px;">
									<div class="custom-control custom-radio my-3">
									  	<input type="radio" id="customRadio2" name="money" value="10000" class="custom-control-input money">
									  	<label class="custom-control-label" for="customRadio2">10000원</label>
									</div>
								</div>
								<div class="col-3 p-0">
									<img src="${pageContext.request.contextPath}/img/15000.png" style="width: 100px; height: 100px;">
									<div class="custom-control custom-radio my-3">
									  	<input type="radio" id="customRadio3" name="money" value="15000" class="custom-control-input money">
									  	<label class="custom-control-label" for="customRadio3">15000원</label>
									</div>
								</div>
								<div class="col-3 p-0">
									<img src="${pageContext.request.contextPath}/img/20000.png" style="width: 100px; height: 100px;">
									<div class="custom-control custom-radio my-3">
									  	<input type="radio" id="customRadio4" name="money" value="20000" class="custom-control-input money">
									  	<label class="custom-control-label" for="customRadio4">20000원</label>
									</div>
								</div>
							</div>
						</form>
						<div class="m-auto px-2 px-ml-0" style="max-width: 170px;">
							<button id="charge" class="m-auto btn rounded-lg text-black" type="button" style="width: 150px; border: 1px solid darkgray;">충전하기</button>
						  	<form action="${pageContext.request.contextPath}/money/chargeComplete.do" method="POST">
								<input type="hidden" val="" id="receipt_id" name="receipt_id">
								<input type="hidden" val="" id="price" name="price">
								<input type="hidden" val="" id="payment_name" name="payment_name">
								<input type="hidden" val="" id="requested_at" name="requested_at">
								<button style="display: none" id="btn"></button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>

	<script>
		//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
		$("#charge").on("click", function(){
			  var radioVal = $('input[name="money"]:checked').val();
			  
			  // 아무것도 선택을 하지 않고 충전버튼을 누른 경우 
			  if(radioVal == null){
				  alert("충전할 금액을 선택해주세요.");
			  }else if(radioVal != null){
			  
			BootPay.request({
				
				price: radioVal, //실제 결제되는 가격
				application_id: "5e05bf2a0627a80026682ac0",
				name: radioVal, //결제창에서 보여질 이름
				pg: '',
				method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
				order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
				account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra: {
				    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
			        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
			        quota: '0' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
				},
				dataType :"json"
			}).error(function (data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
			}).cancel(function (data) {
				//결제가 취소되면 수행됩니다.
				console.log(data);
			}).ready(function (data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
			}).confirm(function (data) {
				//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
				//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
				console.log(data);
				var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
				if (enable) {
					BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				} else {
					BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
				}
			}).close(function (data) {
			    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
			    console.log(data);
			}).done(function (data) {
				var data = data;
				var receipt_id = data.receipt_id;
				$("#receipt_id").val(receipt_id);
				var price = data.price;
				$("#price").val(price);
				var payment_name = data.payment_name;
				$("#payment_name").val(payment_name);
				var requested_at = data.requested_at;
				$("#requested_at").val(requested_at);
				$("#btn").trigger("click");
		
			});
		
			  }
		})

	</script>
</body>
</html>