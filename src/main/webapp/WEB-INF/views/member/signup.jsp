<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 <style>
    .terms {
    overflow-y: scroll;
    font-size:15px;
    width: 800px;
    height: 200px;
    margin: auto;
    border: 1px solid rgba(128, 128, 128, 0.42);
    padding: 10px;
    background-color: #dedede;
}
        .agreement_container{
    text-align: center;
    margin: 10px;
}
.signup_btn_container{
    text-align: center;
    margin: 15px;
    margin-top: 50px;
}

.signup_btn{
    width: 120px;
    height: 40px;
    background-color: #dedede;		
    box-shadow: none;
    border-radius: 5px;
    border: none;
    font-size: 16px;
    font-family: 'GoyangIlsan';
    letter-spacing: 0.5px;
    text-align: center;
    color: white;
}
        .main_insert{
            margin: auto;
            width: 500px;   
        }
        .basic_info{
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 30%;
    position: relative;
    left: 50px;
}
        .basic_info span{
    display: inline-block;
    text-align: right;
    width: 150px;
}
        #signup_header {
    text-align: center;
    background-color: #dedede;
    color: white;
    width: 1000px;
    height: 100px;
    line-height: 100px;
    margin: auto;
    border-radius: 15px;
}

.basic_info input[type=text],input[type=password]{
    width: 275px;
    height: 30px;
}

.basic_info input[type=radio]{
    margin-left: 20px;
    margin-right: 5px;
}

.basic_info p{
    display: inline-block;
}

.basic_info input[placeholder]{
    font-size:13px;
}
        .signup_title{
            
    margin: 10px;
    font-size: 16px;
    font-weight: bolder;
    text-align: center;
    display: inline-block;
}
    </style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<form action="signupProc.do" method="post" id="frm">
<div id="main_insert" >
  <div id="signup_header">
      <h3>회원가입</h3>
      <span style="font-size: 12px;">아래의 정보들을 입력해주세요.</span>
  </div>
  <div class="basic_info">
            <p id="alert_id_form" style="font-size: 11px; margin-bottom: 0px; position: relative; left: 160px; color: red"></p>
            <br><span>아이디</span>
            <input type="text" id="id" name="id" placeholder=" 4~12자 이내 영문(대소문자 구분), 숫자">
            <p class="alert1" id="alert_id"></p>
            <br>
        </div>
        <div class="basic_info">
            <span>비밀번호</span>
            <input type="password" id="pw" name="pw" placeholder=" 9~20자 이내 영문, 숫자, 특문(!,@,#,$,%,^,&,*)">
            <p class="alert2" id="alert_pw_form"></p>
        </div> 
        <div class="basic_info">
            <span>비밀번호 확인</span>
            <input type="password" id="pw_check" name="pw_check" placeholder=" 비밀번호 확인">
            <p class="alert1" id="alert_pw"></p>
        </div> 
         <div class="basic_info">
            <span>이름</span>
            <input type="text" id="name" name="name" placeholder ="한글이름 입력">
            <p class="alert2" id="alert_name_form"></p>
        </div>
         <div class="basic_info">
            <span>별명</span>
            <input type="text" id="nickname" name="nickname" placeholder="활동할 별명입력">
            <p class="alert2" id="alert_nickname"></p>
        </div>
        <div class="basic_info">
            <span>이메일</span>
            <input type="text" id="email" name="email" placeholder="메일인증버튼을 눌러주세요 " readonly>
            <button id=mailc data-toggle="modal" data-target="#Modal" type="button">메일인증</button>
             <p class="alert2" id="emailcheck"></p>
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

        
        <div class="basic_info">
            <span>이메일 수신여부</span>
            <label><input type="radio" name="email_receive" value="Y" checked>수신동의</label>
            <label><input type="radio" name="email_receive" value="N">수신거부</label>
            <p style="font-size: 11px; color: gray;">본 항목에 '수신거부' 체크시 결제한사진을 받을수 없습니다.</p>
        </div>
    <hr>
        <div class="signup_title" style="width:100%;text-align:center">이용약관동의</div>
         <div>
        <div tabindex="0" class="terms" style="font-size:12px;">	
        <h6> 제 1 조 (목적)</h6>
												<ol>
													<li>1. 본 약관은 기업마당 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 기업마당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</li>
												</ol>
												<h6>제 2 조 (약관의 효력과 변경)</h6>
												<ol>
													<li>1. 기업마당 사이트는 귀하가 본 약관 내용에 동의하는 경우 기업마당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.</li>
													<li>2. 기업마당 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 기업마당 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.<br>
														이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.</li>
												</ol>
												<h6>제 3 조 (약관 외 준칙)</h6>
												<ol>
													<li>1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.</li>
												</ol>
												<h6>제 4 조 (용어의 정의)</h6>
												<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
												<ol>
													<li>1. 이용자 : 본 약관에 따라 기업마당 사이트가 제공하는 서비스를 받는 자.</li>
													<li>2. 가입 : 기업마당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위.</li>
													<li>3. 회원 : 기업마당 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서 기업마당 사이트가  제공하는 서비스를 이용할 수 있는 자.</li>
													<li>4. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.</li>
													<li>5. 탈퇴 : 회원이 이용계약을 종료시키는 행위.</li>
												</ol>
												<h5>제 2 장 서비스 제공 및 이용</h5>
												<h6>제 5 조 (이용계약의 성립)</h6>
												<ol>
													<li>1. 이용계약은 신청자가 온라인으로 기업마당 사이트에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.</li>
													<li> 2. 기업마당 사이트는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
														<ol>
															<li>① 다른 사람의 명의를 사용하여 신청하였을 때</li>
															<li>② 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때</li>
															<li>③ 다른 사람의 기업마당 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때</li>
															<li>④ 기업마당 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우</li>
															<li>⑤ 기타 기업마당 사이트가 정한 이용신청요건이 미비 되었을 때</li>
														</ol>
													</li>
												</ol>
												<h6>제 6 조 (회원정보 사용에 대한 동의)</h6>
												<ol>
													<li>1. 회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다.</li>
													<li>2. 기업마당 사이트의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.
														<ol>
															<li> ① 개인정보의 사용 : 기업마당 사이트는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다.<br>
																	단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 기업마당 사이트에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.</li>
															<li>② 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다.</li>
						 									<li>③ 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다.<br>
																 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 안되며, 작업 종료 시에는 반드시 로그아웃 해 주시기 바랍니다.</li>
														</ol>
													</li>
													<li>3. 회원이 본 약관에 따라 이용신청을 하는 것은, 기업마당 사이트가 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.</li>
												</ol>
												<h6>제 7 조 (사용자의 정보 보안)</h6>
												<ol>
													<li>1. 가입 신청자가 기업마당 사이트 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.</li>
													<li>2. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용 되었다는 사실을 발견한 경우에는 즉시 기업마당 사이트에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 기업마당 사이트는 책임을 부담하지 아니합니다.</li>
												</ol>
												<h6>제 8 조 (서비스의 중지)</h6>
												<ol>
													<li>1. 기업마당 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다.</li>
												</ol>
												<h6>제 9 조 (서비스의 변경 및 해지)</h6>
												<ol>
													<li>1. 기업마당 사이트는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 의한 손해에 대하여 책임을 부담하지 아니합니다.</li>
												</ol>
												<h6> 제 10 조 (게시물의 저작권)</h6>
												<ol>
													<li>1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.</li>
													<li>2. 기업마당 사이트는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 게시판운영 원칙에 따라 사전 통지 없이 삭제할 수 있습니다.</li>
						 							<li>3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.</li>
												</ol>
												<h5>제 3 장 의무 및 책임</h5>
												<h6>제 11 조 (기업마당 사이트의 의무)</h6>
												<ol>
													<li>1. 기업마당 사이트는 회원의 개인 신상 정보를 본인의 승낙없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.</li>
												</ol>
												<h6>제 12 조 (회원의 의무)</h6>
												<ol>
													<li>1. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한  정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</li>
													<li>2. 회원은 기업마당 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.</li>
												</ol>
												<h5>제 4 장 기타</h5>
												<h6>제 13 조 (양도금지)</h6>
												<ol>
													<li>1. 회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.</li>
												</ol>
												<h6>제 14 조 (손해배상)</h6>
												<ol>
													<li>1. 기업마당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 기업마당 사이트가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.</li>
												</ol>
												<h6>제 15 조 (면책조항)</h6>
						 						<ol>
													<li>1. 기업마당 사이트는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 기업마당 사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다. 금전적 거래등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.</li>
												</ol>
												<h6>제 16 조 (재판관할)</h6>
						 						<ol>
													<li>1. 기업마당 사이트와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.</li>
												</ol>
						
											</div>
    </div>
    <div class="agreement_container">
        <label><input type="checkbox" id="agreement1" value="agree">
        <span>동의(필수)</span></label>
        
    </div>
    <br><br>
    <div class="signup_title_container">
       <div class="signup_title_img"></div>
        <div class="signup_title" style="width:100%;text-align:center">개인정보처리방침</div>
    </div>
    <div class="terms" style="font-size:12px;">
        <p>
						                        	기업마당은 「개인정보보호법」 제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항 제1호에 따라 <br>아래와 같이 개인정보의 수집. 이용에 관하여 귀하의 동의를 얻고자 합니다. <br><br>
						                            기업마당은 이용자의 사전 동의 없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다. <br>
						                            이용자가 제공한 모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 이를 알리고 동의를 구할 것입니다.
						                        </p>
    </div>
    <div class="agreement_container">
        <label><input type="checkbox" id="agreement2" value="agree">
        <span>동의(필수)</span></label>
        
    </div>
    <div class="signup_title" style="width:100%;text-align:center">마케팅/홍보의 수집의 이용 동의</div>
    <div tabindex="0" class="terms" style="font-size:12px;">
											
												<ol>
													<li>1. 개인정보의 수집 및 이용 목적
						                            	<ul>
						                                	<li>신규 서비스 개발 및 마케팅ㆍ광고에의 활용<br> - 신규 서비스 개발, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속 빈도 등 회원의 서비스 이용에 대한 통계</li>
						                                </ul>
						                            </li>
						                            <li>2. 수집하는 개인정보의 항목
						                            	<ul>
						                                	<li>필수항목 : 이름<br>
						                                	선택항목 : 이메일, 연락처(휴대전화번호, 유선전화번호 중 1개 선택)</li>
						                                </ul>
						                            </li>
						                            <li>3. 개인정보의 보유 및 이용기간
						                            	<ul>
						                                	<li>이용목적의 달성 후 지체없이 파기</li>
						                                </ul>
						                            </li>
						                            <li>4. 동의거부권 및 불이익
						                            	<ul>
						                                	<li>개인정보의 마케팅/홍보의 수집 및 이용 동의를 거부하시더라도 회원 가입 시 제한은 없습니다. 다만, 마케팅 활용 서비스 안내 및 참여에 제한이 있을 수 있습니다.</li>
						                                </ul>
						                            </li>
												</ol>
											</div>
											 <div class="agreement_container">
        <label><input type="checkbox" name="terms_agreement3" value="agree">
        <span>동의(선택)</span></label>
        
    </div>
    </div>
    <hr>
      <div class="signup_btn_container">
       <button type="button" class="signup_btn" id="signup_join">회원가입</button>
       <button type="button" class="signup_btn" id="signup_cancel">회원가입 취소</button>
       </div>
    
       </form>
       <script>
       var idValid = 0;
   	var nickValid = 0;
	var mailValid = 0;
	var pwcheckValid = 0;
	var pwc = 0;
	var namec = 0;
	var nicknamec = 0;
	var emailc = 0;
	var phonec = 0;
	var zipcodec = 0;
	var addr1c = 0;
	var addr2c = 0;
	var mailvalue = 0;
	var agree1 = 0;
	var agree2 = 0;

	//메일중복검사
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
					console.log(mailValid);
					   }
				
				else if(res == "중복된 메일주소입니다."){
					$("#mai").html("중복된 메일주소입니다.").css("color","red");
					$("#mai").css("font-size","15px");
					$("#emailval").val("");
					mailValid = 0;
					$("#emailval").focus();
				}
			}).fail(function(res){
				alert("서버문제입니다 관리자에게 문의하세요");
			});}else{
				$("#mai").html("이메일형식을 맞춰주세요").css("color","red");
				$("#mai").css("font-size","15px");
				$("#mai").val("");
				$("#mai").focus();
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
					$("#mailvalue").focus();
				}
			}).fail(function(res){
				alert("서버에러입니다 관리자에게 연락주세요");
			});}
		})

   	$("#nickname").on("blur",function(){
   		var nick = $("#nickname").val();
   		if(nick==""){
   			$("#alert_nickname").html("별명을 입력해주세요").css("color","red");
   			$("#nickname").focus();
   		}else{   			
   			nicknamec = 1;
   		}
   	})
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
   	   				if(res == "사용 가능한 ID입니다"){
   	   					$("#alert_id").html("사용 가능한 ID입니다.").css("color","blue");
   	   					$("#password").focus();
   	   					idValid = 1;
   	   					console.log(idValid);
   	   				}
   	   				else if(res == "중복된 ID입니다."){
   	   					$("#alert_id").html("중복된 ID입니다.").css("color","red");
   	   					$("#id").val("");
   	   					$("#id").focus();
   	   				}
   	   			}).fail(function(res){
   	   				alert(res);
   	   			});
   				
   			}else{
   				$("#alert_id_form").html("잘못된 아이디 형식입니다.").css("color","red");
   				idValid = 0;
   			}			
   		})
   		
   	// 아이디 중복검사
   		
   		//닉네임 중복검사
   		$("#nickname").on("blur",function(){
   			var nickname = $("#nickname").val();
   			$.ajax({
   				url:"${pageContext.request.contextPath}/member/nickCheck.do",
   				type:"post",
   				data:{nickname:nickname}
   			}).done(function(res){
   				if(res == "사용가능한 별명입니다."){
   					$("#alert_nickname").html("사용가능한 별명입니다").css("color","blue");
   					$("#email").focus();
   					nickValid = 1;
   					console.log(nickValid);
   				}
   				else if(res == "중복된 별명입니다."){
   					$("#alert_nickname").html("중복된 별명입니다").css("color","red");
   					$("#nickname").val("");
   					$("#nickname").focus();
   				}

   			}).fail(function(res){
   				$("#alert_nickname_form").html(res).css("color","red");
   			});
   		})
 	
   		
   		
   			// 이메일 정규식 검사
   		$("#email").on("blur",function(){
   			var regex = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
   			var data = $("#email").val();
   			var result = regex.exec(data);
   			
   			if(result != null){
   				emailc = 1;
   			}else{
   				emailc = 0;
   			}
   		})
   		
   	
 
   	// 비밀번호 정규식 검사
   		$("#pw").on("blur",function(){
   			var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{9,20}$/;
   			var data = $("#pw").val();
   			var result = regex.exec(data);
   			
   			if(result != null){
   				$("#alert_pw_form").html("올바른 비밀번호 형식입니다.").css("color","blue");
   				pwc = 1;
   			}else{
   				$("#alert_pw_form").html("잘못된 비밀번호 형식입니다.").css("color","red");
   				pwc = 0;
   			}
   		})
   		
   		// 비밀번호-비밀번호체크 일치 여부
   	$("#pw_check").on("input",function(){
   		if($("#pw").val() == $("#pw_check").val()){
   			$("#alert_pw").html("비밀번호가 일치합니다.").css("color","blue");
   			pwcheckValid = 1;
   		}else{
   			$("#alert_pw").html("비밀번호가 일치하지 않습니다.").css("color","red");
   			pwcheckValid = 0;
   		}
   	})
   		
   	// 이름 정규식 검사
   		$("#name").on("blur",function(){
   			var regex = /^[가-힣]+$/;
   			var data = $("#name").val();
   			var result = regex.exec(data);
   			
   			if(result != null){
   				$("#alert_name_form").html("올바른 이름 형식입니다.").css("color","blue");
   				namec = 1;
   				$("#name").focus();
   			}else{
   				$("#alert_name_form").html("잘못된 이름 형식입니다.").css("color","red");
   				$("#name").focus();
   				namec = 0;
   			}
   		})
   	// 전화번호 정규식 검사
   		$("#phone").on("blur",function(){
   			var regex = /^010[0-9]{3,4}[0-9]{4}$/;
   			var data = $("#phone").val();
   			var result = regex.exec(data);
   			
   			if(result != null){
   				$("#alert_phone_form").html("올바른 전화번호 형식입니다.").css("color","blue");
   				phonec = 1;
   			}else{
   				$("#alert_phone_form").html("잘못된 전화번호 형식입니다.").css("color","red");
   				phonec = 0;
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

   	   if(idValid==0||nickValid==0||mailValid==0){
   		   alert("중복검사를 해주세요");
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
   	   }else if(mailvalue==0){
   		   alert("메일인증을 완료해주세요");
   		   return;
   	   }
   	   else if(phonec==0){
   		   alert("휴대폰번호를 입력해주세요");
   		   return;
   	   }else if(emailc==0){
   		   alert("이메일을 입력해주세요");
   		   return;
   	   }else if(zipcodec==0||addr1c==0||addr2c==0){
   		   alert("주소를 입력해주세요");
   		   return;
   	   }
   	
   	   else if(agree1==0){
			alert("이용약관에 동의하지 않으면 회원가입이 불가능합니다.");
			return;
		}
		else if(agree2==0){
			alert("개인정보처리방침에 동의하지 않으면 회원가입이 불가능합니다.");
			return;
		}
   				$("#frm").submit();
   			
   		})
   	
       </script>
</body>
</html>