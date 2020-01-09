<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
	strong {color: crimson;}
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	
	<div class="container-fluid px-0 py-3" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container p-0 m-auto">
			<h2 class="mx-3 pt-4 pb-3 px-4 text-center">회원가입</h2>
			<h6 class="mx-3 py-2 px-4 text-center">픽셀 홈페이지에 오신걸 환영합니다!</h6>
			<h6 class="mx-3 py-2 px-4 text-center">저희 사이트에 가입을 하시면,<br>더욱 다양한 혜택을 받으실 수 있습니다!</h6>
			<h6 class="mx-3 py-2 px-4 text-center">아래의 정보들을 입력하신 후,<br>＇가입하기＇를 누르시면 회원가입이 완료됩니다!</h6>
		</div>
		<div class="container p-0 mx-auto my-5">
			<div class="m-auto" style="max-width: 700px;">
				<form class="mx-3 my-5 px-5 py-2" style="border: 1px solid darkgray; border-radius: 10px;" action="signupProc.do" method="post" id="frm">
					<div class="row my-4">
	     				<label class="col-form-label col-4 col-lg-3 pt-0">아이디<strong> * </strong></label>
		      			<div class="col-8 col-lg-9">
		      				<input type="text" class="form-control" id="id" name="id" placeholder="4 ~ 12자 이내 영문(대소문자 구분), 숫자" style="font-size: 15px;" required>
		      				<div id="alert_id1" class="px-1 alert1 invalid-feedback">사용가능한 ID입니다.</div>
		      				<div id="alert_id2" class="px-1 alert1 invalid-feedback">이미사용중인 ID입니다.</div>
		      				<div id="alert_id3" class="px-1 alert1 invalid-feedback">잘못된 아이디 형식입니다.</div>
						</div>
					</div>
					<div class="row my-4">
	     				<label class="col-form-label col-4 col-lg-3 pt-0">비밀번호<strong> * </strong></label>
		      			<div class="col-8 col-lg-9">
		      				<input type="password" class="form-control" id="pw" name="pw" placeholder="8 ~ 20자 이내 영문, 숫자, 특수문자(!,@,#,$,%,^,&,*)" style="font-size: 15px;color:black;" required>
		      				<div id="alert_pw_form" class="alert2 invalid-feedback">잘못된 비밀번호 형식입니다.</div>
						</div>
					</div>
					<div class="row my-4">
	     				<label class="col-form-label col-4 col-lg-3 pt-0">비밀번호 확인<strong> * </strong></label>
		      			<div class="col-8 col-lg-9">
		      				<input type="password" class="form-control" id="pw_check" name="pw_check" placeholder="비밀번호를 한번 더 입력해 주세요." style="font-size: 15px;" required>
		      				<div id="alert_pw" class="alert3 invalid-feedback">비밀번호를 다시 확인해주시기 바랍니다.</div>
						</div>
					</div>
					<div class="row my-4">
	     				<label class="col-form-label col-4 col-lg-3 pt-0">이름<strong> * </strong></label>
		      			<div class="col-8 col-lg-9">
		      				<input type="text" class="form-control" id="name" name="name" placeholder="예) 홍길동 or (주)픽셀 (실명 or 회사명)" style="font-size: 15px;" required>
		      				<div id="alert_name_form" class="alert4 invalid-feedback">잘못된 이름 형식입니다.</div>
						</div>
					</div>
					<div class="row my-4">
	     				<label class="col-form-label col-4 col-lg-3 pt-0">닉네임<strong> * </strong></label>
		      			<div class="col-8 col-lg-9">
		      				<input type="text" class="form-control" id="nickname" name="nickname" placeholder="예) (주)픽셀 (픽셀에서 활동하실 닉네임)" style="font-size: 15px;" required>
		      				<div id="alert_nickname" class="alert5 invalid-feedback">닉네임을 확인해 주시기 바랍니다.</div>
						</div>
					</div>
					<div class="row my-4">
	     				<label class="col-form-label col-4 col-lg-3 pt-0">이메일<strong> * </strong></label>
		      			<div class="col-8 col-lg-9">
		      				<input type="text" class="form-control" id="email" name="email" placeholder="예) picsell@gmail.com" style="font-size: 15px;" required>
		      				<input type="button" data-toggle="modal" data-target="#Modal" id="mailc" value="메일인증" class="mt-2" style="width: 150px; border: 1px solid darkgray; background-color: #f4f2f5; border-radius: 10px;">
		      				<div id="emailcheck" class="alert6 invalid-feedback">잘못된 이메일 입니다.</div>
						</div>
					</div>
					 <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">메일인증</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <div class="form-group">

            <input type="text" class="form-control" id="emailval" style="width:300px;float:left" placeholder="이메일주소를 입력해주세요">
            <br><span id="mai"></span>
            <input type="button" id="mailsend" value="메일인증" style="float:right;margin-top:5px;">
            
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="mailvalue" style="width:300px;float:left" placeholder="인증번호를 입력해주세요">
            <br><span id="mailvaluecheck"></span>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="close" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="checkmail">확인</button>
      </div>
    </div>
  </div>
</div>
        <script>
                  $("#mailc").on("show.bs.modal", function(){
                	  var button = $(event.relatedTarget) // Button that triggered the modal
                	  var recipient = button.data('whatever') // Extract info from data-* attributes
                	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                	  var modal = $(this)
                	  modal.find('.modal-title').text("PicSell 이메일인증")
                	  modal.find('.modal-body input').val(recipient)
                     
                  })
               </script>
					
					<div class="row my-4">
						<label class="col-form-label col-4 col-lg-3 pt-0">이메일<br>수신동의</label>
						<div class="col-8 col-lg-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="email_receive" id="email_Y" value="Y">
							  	<label class="form-check-label" for="email_Y">수신동의</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="email_receive" id="email_N" value="N">
							  	<label class="form-check-label" for="email_N">수신거부</label>
							</div>
							<div style="font-size: 13px;">픽셀에서 제공하는 유익한 광고, 이벤트 소식을 이메일로 받으실 수 있습니다.</div>
						</div>
					</div>
					<div class="row my-4">
	     				<label class="col-form-label col-4 col-lg-3 pt-0">이용약관<strong> * </strong></label>
		      			<div class="col-8 col-lg-9">
		      				<div class="form-control" style="min-height: 150px; font-size: 13px; color: black; overflow: auto">
		      					<p>
		      						제 1조 (목적)<br><br>
		      						본 이용약관은 주식회사 픽셀(PicSell)이 제공하는 픽셀(PicSell) 웹사이트 서비스의 이용과 관련하여 회사와 회원간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br><br>
		      						제 2조 (정의)<br><br>
		      						1. 콘텐츠는 픽셀 내에 게재된 이미지를 말합니다.<br>
		      						2. 에디토리얼 전용 콘텐츠(편집 전용 콘텐츠)란 상업적 용도로 사용할 수 없는 비 상업적 용도의 이미지를 말합니다.<br>
		      						3. 회원이란 픽셀에 가입한 회원을 말하며, 본 약관 및 '픽셀 회원 약관'에 따라 회사가 제공하는 서비스를 이용하는 자를 말합니다.<br>
		      						4. 작가란 픽셀에 콘텐츠를 업로드하여 판매하기 위해 이용하는 회원을 말합니다.<br>
									5. 서비스란 회원이 회사 사이트 내에서 콘텐츠를 무료 또는 유료로 이용하는 행위를 말합니다.<br>
									6. 해지란 회사 또는 회원이 서비스 계약을 해지하는 것을 말합니다.<br>
									7. 포인트는 작가 회원의 콘텐츠 판매 시 제공되는 현금화 가능한 전자화폐를 의미합니다.<br><br>
									제3조 (약관의 명시 및 효력, 개정)<br><br>
									1. 이 약관은 회원이 쉽게 알 수 있도록, 서비스 초기화면에 게시합니다.<br>
									2. 회사는 약관의규제에관한법률, 정보통신망이용촉진및정보보호등에관한법 률(이하 정보통신망법) 등 관련법을 위배하지 않는 범위 내에서 이 약관을 개정할 수 있습니다.<br>
									3. 회사가 약관을 개정하는 경우 적용 일자 및 개정사항을 명시하여 적용일 7일 전에 서비스 공지사항 게시판 또는 이메일을 통해 공지합니다. 다만, 회원에게 불리한 약관 개정의 경우에는 공지 외에 일정 기간 서비스 내 전자우편, 로그인 시 동의 창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.<br>
									4. 회사가 제3조 3항에 따라 개정약관을 공지 또는 통지한 공지일로부터 7일 이내에 회원이 명시적으로 거부하지 않는 경우 개정약관에 동의한 것으로 봅니다.<br>
									5. 회원이 개정에 동의하지 않는다는 의사를 표시한 경우 회사는 개정된 약관을 적용할 수 없으며, 회원은 개정 약관의 효력 발생일부터 서비스를 이용할 수 없습니다.<br>
									6. 약관을 개정할 경우 그 개정약관은 그 적용 일자 이후에 체결되는 계약에만 적용됩니다. 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다.<br><br>
									제4조 (약관의 해석)<br><br>
									1. 이 약관에서 정하지 않은 사항이나 해석은 관련 법령 또는 상 관례에 따릅니다.<br>
									2. 서비스를 이용 중인 회원들의 분쟁 발생 시 약관을 우선으로 적용하고, 해석이 애매하거나 이 약관에서 정하지 않은 사항은 관련 법령 또는 상 관례에 따라 분쟁의 당사자가 해결해야 합니다.<br><br>
									제5조 (이용계약 체결)<br><br>
									1. 서비스 이용계약은 회원이 되고자 하는 자(이하 가입 신청자)가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 회사가 이를 수락함으로써 체결됩니다.<br>
									2. 제1항 신청에 있어 회사는 필요한 경우 본인확인 기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.<br>
									3. 가입 신청자는 가입신청 시 진실한 정보를 기재해야 하며, 허위의 정보를 기재함으로 인한 불이익 및 법적 책임은 가입 신청자에게 있습니다.<br>
									4. 회사는 다음 각호에 해당하는 신청에 대하여는 승낙을 하지 않습니다.<br>
									- 만 14세 미만의 경우<br>
									- 실명이 아니거나 타인의 명의를 이용한 경우<br>
									- 이용자의 귀책사유로 인하여 승인할 수 없거나 기타 규정한 제반 사항을 위반하며 신청하는 경우<br>
									5. 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, 회사는 원칙적으로 이를 가입 신청자에게 알리도록 합니다.<br>
									6. 회사는 회원에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
		      					</p>
		      				</div>
		      				<div class="form-check form-check-inline px-2 py-1">
								<input class="form-check-input" type="checkbox" id="agreement1" value="agree">
							  	<label class="form-check-label" for="agreement1">약관동의(필수)</label>
							</div>
						</div>
					</div>
					<div class="row my-4">
	     				<label class="col-form-label col-4 col-lg-3 pt-0">개인정보<strong> * </strong><br>처리방침</label>
		      			<div class="col-8 col-lg-9">
		      				<div class="form-control" style="min-height: 150px; font-size: 13px; color: black; overflow: auto">
		      					<p>
		      						제1조 (회원 정보의 변경)<br><br>
									1. 회원은 서비스 내 회원 메뉴를 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 단, 서비스 관리를 위해 필요한 아이디 및 이메일 주소 등은 수정할 수 없습니다.<br>
									2. 제1항의 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.<br><br>
									제2조 (개인정보의 보호 및 사용)<br><br>
									회사는 관계 법령에 따라 회원 등록정보를 포함한 이용자의 개인정보를 보호하기 위해 노력하며, 이용자 개인정보의 보호 및 사용에 대해서는 관련 법령 및 회사의 개인정보 취급방침이 적용됩니다. 그러나 이용 회원의 귀책사유로 인해 노출된 정보에 대해서는 일체의 책임을 지지 않습니다.<br><br>
									제3조 (회원의 아이디 및 비밀번호의 관리에 대한 의무)<br><br>
									1. 회원의 아이디와 비밀번호에 관한 관리책임은 회원에게 있으며, 이를 제삼자가 이용하도록 하여서는 안 됩니다.<br>
									2. 회사는 회원의 아이디가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 회사 및 회사의 운영자로 오인한 우려가 있는 경우, 해당 아이디의 이용을 제한할 수 있습니다.<br>
									3. 회원은 아이디 및 비밀번호가 도용되거나 제삼자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다.<br>
									4. 제3항의 상황에 해당 회원이 회사에 그 사실을 통지하지 않거나, 통지한 경우에도 회사의 안내에 따르지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.<br><br>
									제4조 (회원에 대한 통지)<br><br>
									회사가 회원에 대해 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 공지사항, 전자우편주소, 전자쪽지 등으로 할 수 있습니다.<br><br>
									제5조 (회사의 의무)<br><br>
									1. 회사는 관련 법령 또는 이 약관을 위반하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다합니다.<br>
									2. 회사는 개인정보 보호를 위해 보안시스템을 구축하며 개인정보 보호 정책을 공시하고 준수합니다.<br>
									3. 회사는 회원으로부터 제기되는 의견이나 불만이 정당하고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 합니다. 다만 즉시 처리가 곤란한 경우는 회원에게 그 사유와 처리 일정을 통보하여야 합니다.<br><br>
									제6조 (회원의 의무)<br><br>
									1. 회원은 가입 신청 또는 회원 정보 변경 시 모든 사항을 사실대로 작성하여야 합니다. 만일 허위의 사실이나 타인의 정보를 이용하여 등록한 경우에는 일체의 권리를 주장하거나 보호받을 수 없습니다.<br>
									2. 회원은 본 약관에서 규정하는 사항과 기타 회사가 정한 ‘픽셀 회원가입 약관’ 및 회사가 공지하는 사항을 준수하여야 합니다.<br>
									3. 회원은 서비스의 이용 권한, 계약상의 지위 등을 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.<br>
									4. 회원은 아래와 같은 행위를 하여서는 안 되며, 이러한 행위를 하는 경우에 회사는 회원 서비스 이용 제한 및 적법 조치를 포함한 제재를 가할 수 있습니다.<br>
									- 서비스를 통해 얻은 콘텐츠를 서비스 이용 외의 목적으로 사용하거나 복제하는 행위, 제삼자에게 제공하는 행위<br>
									- 제16조 (콘텐츠 이용제한)에 해당하는 행위<br>
									- 본 약관을 포함하여 기타 회사가 정한 제반 규정 또는 이용조건을 위반하는 행위<br>
									- 서비스에 위해를 가하거나 고의로 방해하는 행위<br>
									- 서비스 내 기능을 임의대로 조작하거나 고의적인 부정거래를 하는 행위<br>
									(예 : 무료로 받은 프로모션 포인트로 본인 혹은 특정인의 콘텐츠를 고의로 구매하는 행위 등)<br>
									(예 : 뷰, 좋아요 수를 고의로 클릭하여 늘리는 행위 등)<br>
									- 기타 관계 법령을 위반하는 행위<br><br>
									제7조 (회원의 계약해지)<br><br>
									1. 회원은 언제든지 서비스 내 회원 정보 메뉴를 통하여 서비스 이용계약 해지를 신청할 수 있으며 회사는 이를 즉시 처리합니다.<br>
									2. 회원이 계약을 해지(회원탈퇴)할 경우, 관련법 및 개인정보처리방침에 따라 회사가 회원 정보를 보유하는 경우를 제외하고는 해지 즉시 회원의 모든 데이터는 소멸합니다. 단, 작가회원의 경우 회원탈퇴 신청을 한 시점에서 14일 이후에 모든 데이터가 소멸합니다. 이것은 탈퇴하려는 작가회원의 콘텐츠를 기존에 구매한 회원의 재다운로드를 보장하기 위함입니다. 또한, 탈퇴신청을 한 순간부터 해당 작가의 콘텐츠는 검색에서 노출되지 않으며, 새로운 구매가 불가능합니다.<br>
									3. 따라서 회원탈퇴 신청 후 같은 이메일 주소로 재가입을 원하는 작가회원의 경우 14일 이후에 가능합니다.<br>
									4. 해지로 인하여 콘텐츠 이용 및 현금 전환 신청과 관련한 정보가 삭제됨에 따라 회원에게 발생하는 손해에 대해 회사는 책임지지 않습니다.<br><br>	
									제8조 (서비스의 제공)<br><br>
									1. 회사는 회원에게 아래와 같은 서비스를 제공합니다.<br>
									- 콘텐츠 제공: 작가 회원이 업로드 한 콘텐츠를 제공, 판매, 중개<br>
									- 콘텐츠 이용: 작가 회원 및 회사가 제공하는 콘텐츠를 이용, 구매, 중개<br>
									- 기타 회사가 추가 개발하여 회원에게 제공하는 일체의 서비스<br>
									2. 서비스는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.<br>
									3. 회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절, 천재지변 또는 운영상 타당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 다만 이 경우 그 사유 및 기간 등을 회원에게 사전 또는 사후에 공지합니다.<br>
									4. 회사는 서비스의 제공에 필요한 경우 정기점검을 할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.
		      					</p>
		      				</div>
		      				<div class="form-check form-check-inline px-2 py-1">
								<input class="form-check-input" type="checkbox" id="agreement2" value="agree">
							  	<label class="form-check-label" for="agreement2">정보동의(필수)</label>
							</div>
						</div>
					</div>
					<div class="row my-4">
	     				<label class="col-form-label col-4 col-lg-3 pt-0">마케팅/홍보<br>이용 동의</label>
		      			<div class="col-8 col-lg-9">
		      				<div class="form-control" style="min-height: 150px; font-size: 13px; color: black; overflow: auto">
		      					<p>
		      						제1조 (콘텐츠의 관리)<br><br>
									1. 회사에서 제공하는 콘텐츠는 회사의 독자적 판단에 따라 임의로 삭제 및 변경할 수 있습니다.<br>
									2. 저작권, 재산권, 초상권 문제 등을 포함한 이유로 콘텐츠에 문제가 발생했을 때 회사는 이를 공지함(사이트 내 공지사항 게재 또는 전자메일 통지)으로써 회원들에 대한 알릴 의무를 다하는 것으로 하며, 회원은 그 사용을 중지해야 합니다. 공지 후 해당 콘텐츠 사용으로 인한 모든 법적 책임은 회사에 있지 않고 사용한 회원에게 있습니다.<br><br>
									제2조 (콘텐츠 저작권)<br><br>
									1. 회사의 서비스에서 제공되는 콘텐츠의 저작권은 그 적법한 저작자 혹은 작가 회원 및 관련 권리자에게 있습니다. 회원은 회원 종류의 구분 및 지불한 금액에 따라 허용되는 목적의 범위 내에서만 사용 허락을 받는 것이며, 회사가 콘텐츠의 저작권 자체를 판매하는 것은 아닙니다.<br>
									2. 회사의 사이트에서 제공되는 콘텐츠의 무단복제, 무단사용 또는 회사와 사전협의 없이 사이트에 게시된 ‘픽셀 회원가입 약관’을 벗어나는 행위에 대해서는 저작권법 및 관련 법률에 의한 권리 침해로 간주합니다. 따라서 회원은 이 약관과 ‘픽셀 회원가입 약관’에서 명시적으로 허용하는 사항 이외의 이미지 사용으로 발생하는 모든 종류의 손해 또는 책임에 대해 회사와 제삼자에게 손해를 배상하여야 합니다. 또한, 제삼자의 청구에 대해서는 자신의 비용으로 회사를 면책시켜야 합니다.<br>
									3. 사이트에서 제공되는 콘텐츠의 피사체(인물, 건물, 장소 등)에 대한 초상권, 재산권, 저작권, 상표권, 특허권, 디자인권(이하 ‘저작권 등’)은 회사가 보유하지 않은 것이 있을 수 있습니다. (예: 군중 속 인물의 초상권, 배경 건물의 재산권 등). 따라서 콘텐츠의 일부 피사체는 사용 형태에 따라서는 회원이 사용 전에 직접 해당 권리를 취득해야 하는 경우가 있을 수 있으므로, 사용 시 저작권 등에 대한 권리의 존재가 의심되는 일부 피사체에 대하여는 사전에 회사에 문의하셔야 합니다. 만일 회사와 사전협의 없이 사용하여 제삼자와 이들 권리에 대한 분쟁이 발생할 경우 회사는 일체의 책임을 지지 않으며, 모든 책임은 회원에게 있습니다. 회원은 이러한 사용으로 인한 제삼자의 청구에 대해 회사를 면책시켜야 합니다.<br>
									4. 콘텐츠에 일부 포함될 수 있는 로고, 심벌, 캐릭터, 트레이드마크, 서비스마크 등에 대한 권리는 회사가 아닌 해당 권리자에게 있으므로 해당 권리의 침해가 되는 형태로 사용하려 할 경우 권리자로부터 사전에 승인을 받아야 합니다.<br>
									5. 전항의 경우 회원이 사용 중지 및 삭제조치 처리에 협조하지 않아 발생하는 저작권 분쟁이나 이로 인해 확대된 손해에 대한 책임은 회원에게 있으며, 회사는 해당 분쟁이나 확대된 손해에 대하여 책임지지 않습니다.<br>
									6. 위 각 항 중, 회사와 회원의 책임이 문제 되는 제삼자와의 분쟁이 있을 때, 회원은 회사의 동의 없이 그 제삼자에 대한 책임을 인정하거나 조정, 합의를 할 수 없으며, 만일 회원이 회사의 동의 없이 제삼자에 대한 책임인정, 조정, 기타 여하한 합의를 하더라도 이는 회사에 대해 효력을 미칠 수 없습니다.<br>
									7. 콘텐츠를 업로드하거나 구매, 사용함으로써 발생하는 모든 법적 분쟁에 대해 회사는 책임지지 않습니다. 해당 분쟁에 대해서는 당사자 간의 합의 및 분쟁을 통해 해결해야 합니다. 회사는 당사자들 간의 원만한 합의를 위해 사실관계를 당사자에게 통지할 수는 있습니다.<br><br>
									제3조 (콘텐츠 사용제한)<br><br>
									1. 모든 콘텐츠는 하위 라이선스를 발행하거나 재배포, 재분배, 재판매(배급, 양도, 대여, 임대, 임차)를 할 수 없습니다.<br>
									2. 모든 콘텐츠는 아래와 같은 용도로 사용할 수 없습니다.<br>
									- 음란물 및 성인 광고, 유흥업소, 고리대금업, 기타 매춘업, 비뇨기과, 성형외과 등 사회 미풍양속과 일반 정서에 반하는 용도<br>
									- 특정 제품을 모델이 보증하는 형식의 과대광고<br>
									   A. 예) 성형외과 비교 사진 (before & after)<br>
									   B. 모델에 대한 허위사실을 기재하여 사용한 경우<br>
									     예) 이미지의 모델이 특정 서비스를 이용하는 것처럼 사용된 경우<br>
									     예) 이미지의 모델에 가명, 허위 신상 등을 표시하여 사용된 경우<br>
									   C. 기타 과대광고 및 허위 광고 등<br>
									- 모델의 인격권을 훼손하는 용도<br>
									   A. 타인을 비방하거나 외설적으로 사용하는 등 명예를 훼손하는 용도<br>
									   B. 신체 및 얼굴 등과 제삼자의 이미지를 합성 혹은 재가공하는 행위<br>
									   C. 기타 모델의 인격권을 훼손하는 용도 등<br>
									     예) 소개팅, 금융, 병원 등 그 외 기타 서비스에서 모델의 인격권을 훼손할 수 있다고 판단되는 경우 인물 콘텐츠 사용이 불가합니다.><br>
									     해당 제한 사항과 관련하여 자세한 설명이 필요하시면 픽셀로 문의 바랍니다.<br>
									- 기타 불법적인 사용<br>
									- 콘텐츠를 전시회/공모전, 로고, 심벌, 트레이드마크, 서비스마크, 상표 등으로 사용할 수 없습니다<br>
									3. 콘텐츠 사용 시 이용제한에 위반될 수 있다고 우려되거나 판단이 어려운 경우 회사 혹은 콘텐츠의 저작권자(작가 회원)에게 미리 문의 후 사용해야 합니다. 특히 인물 콘텐츠 사용의 경우 콘텐츠 이용제한에 있어 좀 더 민감하게 적용될 수 있으므로 중요한 인물 콘텐츠의 사용에 있어 회사 혹은 콘텐츠의 저작권자(작가 회원)에게 미리 문의 후 사용해야 합니다.<br>
									4. 모든 콘텐츠는 비독점적 사용을 전제로 제공되는 것이며, 독점사용을 위하여는 별도협의가 필요합니다.<br>
									5. 구매한 콘텐츠를 원본 형태 그대로 웹하드, 블로그, 카페, SNS(페이스북, 인스타그램 등) 등에 재배포, 재분배 목적으로 업로드하거나 스크랩하는 것을 금합니다.<br>
									6. 다운로드 받은 콘텐츠 및 2차 저작물에 대하여 지적 재산권의 권리등록을 금합니다.<br>
									7. 2차 저작물을 만들어 판매 및 배포를 해야 하는 경우 회사에 미리 문의하시기 바랍니다.<br>
									(예 : 구매한 이미지로 제품패키지, 엽서 및 액자를 만들어 판매할 경우 일정수량(1,000부)이 넘는다면 따로 추가 계약이 필요할 수 있습니다.)<br>
									8. 저작물을 납품(제2차 사용자에게 제공) 시 납품된 저작물의 원본 소스는 동시에 납품할 수 없습니다. 만일 원본 저작물을 납품하여 클라이언트가 원본 콘텐츠를 이용하여 2차 제작물을 제작할 경우, 그로 인한 모든 책임은 납품한 회원에게 있습니다.<br><br>
									*이미지 사용제한에 위반되는 사용이 발견되었을 시 해당 이미지 사용 고객은 크라우드픽의 안내에 따라 신속하게 문제가 되는 이미지 사용을 중지해야 합니다.<br>
									또한, 사용제한에 위반되는 사용으로 인해 회사 및 이미지의 저작권자에게 손해 및 피해가 발생한 경우 해당 이미지 사용 고객은 그 손해와 피해를 보상해야 합니다.<br><br>
									제4조 (콘텐츠의 환불)<br><br>
									1. 디지털 콘텐츠의 특성상 구매한 콘텐츠에 대해서는 환불이 불가능합니다.<br>
									2. 단, 사용하지 않은 충전금액에 대해서는 부분환불이 가능합니다. 충전금액 결제 후 14일 이내 고객의 변심으로 인한 환불이 가능합니다.<br>
									3. 남은 금액의 부분환불에 있어 프로모션 및 추가지급 금액은 계산하지 않습니다.<br>
									4. 환불시에는 결제할 때 발생하였던 수수료를 제외한 금액이 환불됩니다.<br><br>
									제5조 (손해배상)<br><br>
									서비스에서 제공되는 콘텐츠의 무단 복제, 무단 사용 또는 본 약관에 규정된 내용을 벗어나는 행위(사용범위 초과 사용 또는 콘텐츠 이용 시 제한 사항의 위반 사용 등)는 저작권법 및 관련 법률에 의한 저작권 침해에 해당합니다. 이 경우 회사에 발생한 손해를 배상하여야 하며, 회사가 이를 초과하는 손해를 입은 경우 그 초과 손해도 배상해야 합니다. 회원의 위와 같은 행위로 인하여 제삼자가 회사에 대해 손해배상을 청구할 경우, 자신의 비용으로 회사를 면책시켜야 합니다.<br><br>
									제6조 (면책조항)<br><br>
									1. 회사는 천재지변, 전쟁 및 기타 이에 따르는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.<br>
									2. 회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.<br>
									3. 회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.<br>
									4. 회원들의 접속 폭주로 인한 서비스 속도의 지체나 일시적 오류 그리고 회사의 서비스개선을 위한 정비 등으로 인한 서비스의 일시 중단에 대하여는 환불 또는 배상하지 않습니다.<br><br>
									제7조 (서비스 관련 분쟁 해결)<br><br>
									1. 회사는 서비스 이용과 관련한 회원의 의견이나 불만 사항을 신속하게 처리합니다. 단, 신속한 처리가 곤란한 경우에는 그 사유와 처리 일정을 통보하여 드립니다.<br>
									2. 회사와 회원 간에 발생한 분쟁은 전자거래기본법에 의해 설치된 전자거래 분쟁 조정위원회의 조정절차에 의해 해결할 수 있습니다.<br><br>
									제8조 (서비스의 종료)<br><br>
									1. 회사는 서비스를 종료하고자 하는 날로부터 3개월 이전에 서비스 내 공지사항 및 전자우편 등의 방법으로 회원에게 알립니다.<br>
									2. 서비스 종료 통지일 현재 이미 적립된 포인트는 서비스 종료일까지 본 약관이 정하는 바에 따라 소진하셔야 하며, 서비스 종료일 이후로는 자동 소멸하여 회원은 포인트에 관한 권리를 주장할 수 없습니다.<br>
									3. 종료 통지일로부터 서비스 종료일까지 서비스 일부가 제한될 수 있습니다.<br><br>
									제9조 (준거법 및 합의관할)<br><br>
									1. 회사와 회원 간에 제기된 법적 분쟁은 대한민국 법을 준거법으로 합니다.<br>
									2. 서비스 이용으로 발생한 분쟁에 대하여 소송이 제기될 경우 회사의 소재지를 담당하는 법원을 관할 법원으로 합니다.
		      					</p>
		      				</div>
		      				<div class="form-check form-check-inline px-2 py-1">
								<input class="form-check-input" type="checkbox" id="terms_agreement3" value="agree">
							  	<label class="form-check-label" for="terms_agreement3">이용동의(선택)</label>
							</div>
						</div>
					</div>
					<div class="row mt-5 mb-3">
				  		<button id="signup_join" class="m-auto btn rounded-lg text-black" type="submit" style="width: 150px; border: 1px solid darkgray;">가입하기</button>
				  	</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		var idValid = 0;
	   	var nickValid = 0;
		var mailValid = 0;
		var pwcheckValid = 0;
		var pwc = 0;
		var namec = 0;
		var nicknamec = 0;
		var mailvalue = 0;
		var agree1 = 0;
		var agree2 = 0;
		
		// 아이디 정규식 검사
   		$("#id").on("blur",function(){
   			var regex = /^[a-zA-Z0-9]{4,12}$/;
   			var data = $("#id").val();
   			var result = regex.exec(data);
   			
   			if(result != null){
   				$("#alert_id_form").html("올바른 아이디 형식입니다.").css("color","blue");

   				$.ajax({
   	   				url:"${pageContext.request.contextPath}/member/idCheck.do",
   	   				type:"post",
   	   				data:{id:data}
   	   			}).done(function(res){
   	   				idValid=1;
   	   				if(res == "가능"){
   	   					$("#alert_id1").css("display","block");
   	   				$("#alert_id2").css("display","none");
   	   			$("#alert_id3").css("display","none");
   	   					idValid = 1;
   	   					$("#pw").focus();
   	   				}
   	   				else if(res == "중복"){
   	   				$("#alert_id2").css("display","block");
   	   			$("#alert_id3").css("display","none");
   	   					$("#id").val("");
   	   					$("#id").focus();
   	   					idValid = 0;
   	   				}
   	   			}).fail(function(res){
   	   				alert(res);
   	   			});
   				
   			}else{
   				$("#alert_id3").css("display","block");
   				idValid = 0;
   				$("#id").focus();
   			}			
   		})	  
   		
   		// 이름 정규식 검사
   		$("#name").on("blur",function(){
   			var regex = /^[가-힣]+$/;
   			var data = $("#name").val();
   			var result = regex.exec(data);
   			
   			if(result != null){
   				$("#alert_name_form").css("display", "none");
   				namec = 1;
   			}else{
   				$("#alert_name_form").css("display", "block");
   				namec = 0;
   				$("#name").val("");
   			}
   		})
   		


	   	
   		
   		//닉네임 중복검사
   		$("#nickname").on("blur",function(){
   			var nickname = $("#nickname").val();
   			if(nickname==""){
   				alert("별명을 입력해주세요");
   				nicknamec=0;
   			}else{
   			$.ajax({
   				url:"${pageContext.request.contextPath}/member/nickCheck.do",
   				type:"post",
   				data:{nickname:nickname}
   			}).done(function(res){
   				if(res == "사용가능한 별명입니다."){
   					$("#alert_nickname").css("display","none");
   					nicknamec = 1;
   				}
   				else if(res == "중복된 별명입니다."){
   					$("#alert_nickname").css("display","block");
   					$("#nickname").val("");
   				}

   			}).fail(function(res){
   				$("#alert_nickname_form").css("display", "none");
   			});
   			}
   		})
   		
 		$("#mailvalue").on("blur",function(){
 			var value = $("#mailvalue").val();
 			$.ajax({
 				url:"../mail/valuecheck.do",
 				type:"post",
 				data:{value:value}
 			}).done(function(res){
 				if(res=="ㅇㅋ"){
 					$("#mailvaluecheck").html("인증완료되었습니다").css("color","blue");
 					mailvalue = 1;
 				}else if(res=="ㄴㄴ"){
 					$("#mailvaluecheck").html("인증번호를 다시확인해주세요").css("color","red");
 					$("#mailvalue").val("");
 				}
 			}).fail(function(res){
 				alert("서버에러입니다 관리자에게 연락주세요");
 			})
 		})
 		
   		$("#emailval").on("blur",function(){
			var email = $("#emailval").val();
			var regex = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
			var data = $("#emailval").val();
			var result = regex.exec(data);
			if(result != null){
			$.ajax({
				url:"${pageContext.request.contextPath}/member/mailCheck.do",
				type:"post",
				data:{email:email}
			}).done(function(res){
				if(res == "사용 가능한 메일주소입니다."){
					$("#mai").html("사용 가능한 메일주소입니다.").css("color","blue");
					$("#mai").css("font-size","15px");
					mailValid = 1;
					
					   }
				
				else if(res == "중복된 메일주소입니다."){
					$("#mai").html("중복된 메일주소입니다.").css("color","red");
					$("#mai").css("font-size","15px");
					$("#emailval").val("");
					mailValid = 0;
				}
			}).fail(function(res){
				alert("서버문제입니다 관리자에게 문의하세요");
			});}else{
				$("#mai").html("이메일형식을 맞춰주세요").css("color","red");
				$("#mai").css("font-size","15px");
				$("#mai").val("");
			}
		})
		 $("#mailsend").on("click",function(){
			 var regex = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	   			var data = $("#emailval").val();
	   			var result = regex.exec(data);
	   			
	   			if(result != null){
	  				$.ajax({
	  					url:"../mail/signmail.do",
	  					type:"post",
	  					data:{email:data}
	  				}).done(function(res){
	  					alert("인증메일이 전송되었습니다");
	  					emailc = 1;
	  				}).fail(function(res){
	  					alert("서버에러입니다 관리자에게 문의하세요");
	  				});
	   			}else{
	   				emailc = 0;
	   			}
				   
				   
			   });
		$("#checkmail").on("click",function(){
			var email = $("#emailval").val();
			var value = $("#mailvalue").val();
			if(email==""){
				alert("이메일을먼저 입력해주세요");
			}else{
			$.ajax({
				url:"../mail/valuecheck.do",
				type:"post",
				data:{value:value}
			}).done(function(res){
				if(res=="ㅇㅋ"){
					$("#mailvaluecheck").html("인증완료되었습니다").css("color","blue");
					alert("인증완료되었습니다!");
					$("#close").trigger("click");
					$("#email").val(email);
					$("#emailval").val("");
					$("#mailvalue").val("");
					mailvalue = 1;
				}else if(res=="ㄴㄴ"){
					$("#mailvaluecheck").html("인증번호를 다시확인해주세요").css("color","red");
					$("#mailvaluecheck").css("font-size","15px");
					$("#mailvalue").val("");
				}
			}).fail(function(res){
				alert("서버에러입니다 관리자에게 연락주세요");
			});}
		})
   		
   		
   		// 비밀번호 정규식 검사
   		$("#pw").on("blur",function(){
   			var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{9,20}$/;
   			var data = $("#pw").val();
   			var result = regex.exec(data);
   			
   			if(result != null){
   				pwc = 1;
   				$("#alert_pw_form").css("display","none");
   			}else{   				
   				$("#alert_pw_form").css("display","block");
   				pwc = 0;
   				$("#pw").val("");
   			}
   		})
   		
   		// 비밀번호-비밀번호체크 일치 여부
	   	$("#pw_check").on("blur",function(){
	   		if($("#pw").val() == $("#pw_check").val()){
	   			pwcheckValid = 1;
	   		}else{
	   			$("#alert_pw").css("display","block");
	   			$("#pw_check").val("");
	   			pwcheckValid = 0;
	   		}
	   	})
   		

   		$("#agreement1").on("change",function(){
   			var agr1 = $("#agreement1").prop("checked");
   			if(agr1 == true){
   				agree1 = 1;
   			}else{
   				agree1 = 0;
   			}
   		})
   		
   			$("#agreement2").on("change",function(){

   			var agr2 = $("#agreement2").prop("checked");
   			if(agr2 == true){
   				agree2 = 1;
   			}else{
   				agree2 = 0;
   			}
   		})

	

   		// 각 칸이 비어있으면 alert 창 띄우고 return 시키기!
   		$("#signup_join").on("click",function(){
   		  var radiovalue = $(":input:radio[name=email_receive]:checked").val();

		if(radiovalue==""){
  	 		 radiovalue=="N";
		}
  		
		else if(idValid==0){
   	    	alert("아이디를 입력해주세요");
   	    	return;
   	    }else if(pwc==0){
   			alert("비밀번호를 입력해주세요");
   			return;
   	    }else if(pwcheckValid==0){
   			alert("비밀번호와 비밀번호확인은 같은값이어야합니다");
   		    return;
   	   	}else if(namec==0){
   			alert("이름을 입력해주세요");
   		   	return;
   	   	}else if(nicknamec==0){
   		   	alert("별명을 입력해주세요");
   		   	return;
   	   	}
		else if(mailvalue==0){
   		   	alert("메일인증을 완료해주세요");
   		   	return;
   	   	}else if(agree1==0){
			alert("이용약관에 동의하지 않으면 회원가입이 불가능합니다.");
			return;
		}else if(agree2==0){
			alert("개인정보처리방침에 동의하지 않으면 회원가입이 불가능합니다.");
			return;
		}
   	    $.ajax({
   	    	url:"signupProc.do",
   	    	type:"post",
   	    	data:{id:$("#id").val(),
   	    		pw:$("#pw").val(),
   	    		name:$("#name").val(),
   	    		nickname:$("#nickname").val(),
   	    		email:$("#email").val(),
   	    		email_receive:radiovalue}
   	    }).done(function(res){
   	    	if(res=="ㅇㅋ"){
   	    		alert("회원가입이 완료되었습니다. 환영합니다!");
   	    		location.href="${pageContext.request.contextPath}/home";
   	    	}else if(res=="ㄴㄴ"){
   	    		alert("회원가입에 실패했습니다")
   	    	}
   	    }).fail(function(res){
   	    	alert("서버에러입니다 관리자에게 문의바랍니다");
   	    });

   			
   		})
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>