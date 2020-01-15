<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.1.0.min.js" type="application/javascript"></script>
</head>
<body>
<h1>충전하기</h1>
<input type="radio" name="money" value="200" class=money>5000원<br><br>
<input type="radio" name="money" value="10000" class=money>10000원<br><br>
<input type="radio" name="money" value="15000" class=money>15000원<br><br>
<input type="radio" name="money" value="20000" class=money>20000원<br><br>

<button id=charge>충전하기</button>
<form action="${pageContext.request.contextPath}/chargeComplete.do" method="POST">
<input type="text" val="" id="receipt_id" name="receipt_id">
<input type="text" val="" id="price" name="price">
<input type="text" val="" id="payment_name" name="payment_name">
<input type="text" val="" id="requested_at" name="requested_at">
<button id="btn"></button>
</form>

<script>
//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
$("#charge").on("click", function(){
	  var radioVal = $('input[name="money"]:checked').val();
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
})

</script>
</body>
</html>