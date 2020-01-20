<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Detail | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
	body {margin: 0; padding: 0;}
	.ico {border-radius: 50%; cursor: pointer; fill: #232323; transition: .4s;}
    .liked {transform: scale(1.05) rotate(360deg); background-color: #C62828; padding: .3rem; fill: white !important;}
    .ico2 {border-radius: 50%; cursor: pointer; fill: #232323; transition: .4s;}
    
/*    글씨체 css */
	@font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face {font-family: 'NanumBarunpen'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumBarunpen.woff') format('woff'); font-weight: normal; font-style: normal;}
	@font-face {font-family: 'Dovemayo-Medium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/Dovemayo-Medium.woff') format('woff'); font-weight: normal; font-style: normal;}

/*    로그인 */
	#LoginFrm {width: 320px; margin: auto; opacity: 1; display: flex; flex-direction: column; text-align: center;}
	#ryan {margin: auto; width: 70%; border-radius: 50%; border: 1px solid #E0A243; background: #fff; align-self: center; transform-style: preserve-3d;}
	#loginId {font-size: 16px; width: 300px; height: 30px; margin: 20px auto 0px auto; padding: 0 10px; color: black;}
	#loginPw {font-size: 16px; width: 300px; height: 30px; margin: 10px auto 0px auto; padding: 0 10px; color: black;}
	
	.save {margin: 10px auto 0px auto;}
	
	#memlogin {font-size: 18px; width: 300px; height: 30px; margin: 20px auto 0px auto; padding: 0 10px; color: black; border: 1px solid #E0A243; background-color: white; color: #E0A243; z-index:999;}

	@keyframes lookaway-up {
    	from {transform: rotate3d(.2, 0, -.01, 20deg);}
	    to {transform: rotate3d(.2, -.05, -.01, 20deg);}
	}

	@keyframes lookaway-down {
	    0% {transform: rotate3d(-.2, 0, -.01, 20deg);}
	    100% {transform: rotate3d(-.2, -.05, .01, 20deg);}
	}
	
	.ears {transform-origin: 50% 50% 5px;}
	.eyes {transform-origin: 50% 50% -40px;}
	.muzzle {transform-origin: 50% 50% -44px;}
	.ears, .eyes, .muzzle {transition: transform .5s;}
	.focused {transition: transform .1s;}
	.look-away .ears, .look-away .eyes,	.look-away .muzzle {transition-duration: .3s; animation: 3s infinite alternate;}
	.look-away.up .ears, .look-away.up .eyes, .look-away.up .muzzle {transform: rotate3d(.2, 0, 0, 20deg) !important;}
	.look-away.down .ears, .look-away.down .eyes, .look-away.down .muzzle {transform: rotate3d(-.2, 0, 0, 20deg) !important;}
	.look-away.playing.up .ears, .look-away.playing.up .eyes, .look-away.playing.up .muzzle {animation-name: lookaway-up;}
	.look-away.playing.down .ears, .look-away.playing.down .eyes, .look-away.playing.down .muzzle {animation-name: lookaway-down;}
	
	.td {width: 33%;}
	.td>a {color: gray; font-size: 13px;}
	
	.modal-dialog-slideout {min-height: 100%; margin: 0 0 0 auto; background: #fff;}
	.modal.fade .modal-dialog.modal-dialog-slideout {-webkit-transform: translate(100%, 0) scale(1); transform: translate(100%, 0) scale(1);}
	.modal.fade.show .modal-dialog.modal-dialog-slideout {-webkit-transform: translate(0, 0); transform: translate(0, 0); display: flex; align-items: stretch; -webkit-box-align: stretch; height: 100%;}
	.modal.fade.show .modal-dialog.modal-dialog-slideout .modal-body {overflow-y: auto; overflow-x: hidden;}
	.modal-dialog-slideout .modal-content {border: 0;}
	.modal-dialog-slideout .modal-header, .modal-dialog-slideout .modal-footer {height: 69px; display: block;}
	.modal-dialog-slideout .modal-header h5 {float: left;}
	.sideMenu:hover {background-color: #F3F3F3;}

</style>
</head>
<body>
	<div class="container-fulid m-0 p-0" style="width: 100%; height: 100%; min-width: 1300px; font-family: 'Cafe24Oneprettynight';">
		<div class="row m-auto text-center py-4 px-3" style="max-width: 1300px;">
			<div class="col-8">
				<div class="h-100" style="border: 1px solid darkgray; border-radius: 10px;">
					<div class="row m-auto w-100 text-right" style="height: 600px;">
						<div id="picture" class="align-self-center m-auto p-0 text-center">
			            	<img src="/watermarkfiles/${dto.sysname_watermark }" class="w-100 h-100" style="min-width: 500px; min-height: 300px; max-width: 750px; max-height: 550px;">
			        	</div>
					</div>
		            <div id="photo_like_box" class="text-right px-3">
		            <!-- ***************************************************** -->
		            	<c:choose>
			            	<c:when test="${likestatus == 1 }">
			                	<svg class="ico liked" width="24" height="24" viewBox="0 0 24 24">
					            	<path d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z"></path>
					            </svg>
			                </c:when>
			            	<c:otherwise>
			               		<svg class="ico" width="24" height="24" viewBox="0 0 24 24">
					            	<path d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z"></path>
					            </svg>
			                </c:otherwise>
		              	</c:choose>
		            <!-- ***************************************************** -->
			            <span class="mx-1">좋아요</span>
			        </div>
		        	<hr>
		            <div class="text-left px-3 mt-3">
		                <span class="mx-1">크리에이터</span>
		            	<a class="mx-1" href='/writer/writerpage?nickname=${dto.nickname }' style='text-decoration:none' onclick='window.open("about:blank").location.href=this.href; return false;'>@${dto.nickname }</a>
		                <span class="mx-1">                            
	                    <!-- ***************************************************** -->
		                	<c:choose>
		                    	<c:when test="${writerlikestatus == 1 }">
			                    	<svg class="ico2 liked" width="24" height="24" viewBox="0 0 24 24">
				                    	<path d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z"></path>
				                    </svg>
		                        </c:when>
		                        <c:otherwise>
			                       	<svg class="ico2" width="24" height="24" viewBox="0 0 24 24">
				                	    <path d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z"></path>
				                    </svg>
		                        </c:otherwise>
		                    </c:choose>
		                <!-- ***************************************************** -->         
		                </span>
		                <span class="mx-1">'</span>
		                <span id="total_writer_like">${likepoint }</span>
		                <span class="mx-1">'</span>
		                <span class="mx-1">명이 좋아하는 작가로 등록을 하였습니다.</span>
		        	</div>
                    <div id=tagbox class="py-3 px-3 text-left">
                    	<span class="mx-1">해시태그</span>
                    </div>
				</div>
			</div>
			<div class="col-4">
				<div class="h-100" style="border: 1px solid darkgray; border-radius: 10px;">
					<div class="row m-auto w-100" id="righttop">
						<div class="col-4" style="border-right: 1px solid darkgray; border-bottom: 1px solid darkgray;">
							<span class="mx-2"><img src="${pageContext.request.contextPath}/img/inquiry.png" style="width: 30px; height: 30px;" data-toggle="tooltip" data-placement="top" title="Views"></span>
							<span class="rightchild mx-2" style="line-height: 50px;">${dto.viewcount }</span>
						</div>
						<div class="col-4" style="border-right: 1px solid darkgray; border-bottom: 1px solid darkgray;">
							<span class="mx-2"><img src="${pageContext.request.contextPath}/img/download.png" style="width: 28px; height: 23px;" data-toggle="tooltip" data-placement="top" title="Downloads"></span>
							<span class="rightchild mx-2" style="line-height: 50px;">${dto.downcount }</span>
						</div>
						<div class="col-4" style="border-bottom: 1px solid darkgray;">
							<span class="mx-2"><img src="${pageContext.request.contextPath}/img/like.png" style="width: 22px; height: 22px;" data-toggle="tooltip" data-placement="top" title="Like"></span>
							<span class="rightchild mx-2" style="line-height: 50px;"><span id="total_photo_like">${dto.img_like }</span></span>
						</div>
					</div>
                    <div class="py-3 px-2">
                    	<table class="w-100 m-auto">
                        	<tr>
                            	<th class="text-left">해상도</th>
                                <td>${dto.xDimension }X${dto.yDimension }</td>
                            </tr>
                            <tr>
                            	<td colspan="2"><hr class="p-0 m-0">
                            </tr>
                            <tr>
                                <th class="text-left">용량</th>
                                <td id="size${dto.img_seq}"></td>
                            </tr>
                            <tr>
                            	<td colspan="2"><hr class="p-0 m-0">
                            </tr>
                            <tr>
                                <th class="text-left">파일 형식</th>
                                <td>${dto.file_extension }</td>
                            </tr>
                            <tr>
                            	<td colspan="2"><hr class="p-0 m-0">
                            </tr>
                            <tr>
                                <th class="text-left">업로드 날짜</th>
                                <td id="date"></td>
                            </tr>
                            <tr>
                            	<td colspan="2"><hr class="p-0 m-0">
                            </tr>
                            <tr>
                                <th class="text-left">제조사</th>
                                <td>${dto.make }</td>
                            </tr>
                            <tr>
                            	<td colspan="2"><hr class="p-0 m-0">
                            </tr>
                            <tr>
                                <th class="text-left">모델</th>
                                <td>${dto.model }</td>
                            </tr>
                            <tr>
                            	<td colspan="2"><hr class="p-0 m-0">
                            </tr>
                            <tr>
                                <th class="text-left">사용범위</td>
                                <td>
                                <script>
                                var size = ${dto.img_size};
                                var value = size/1048576;
                                var showvalue = value.toFixed(3);
                                $("#size${dto.img_seq}").html(showvalue+"MB")
                               </script> 
                               
                                    <c:choose>
                                        <c:when test="${dto.usage == '상업용' }">
                                            <span id=commercial style="color: dodgerblue;">상업적인 사용 가능</span>
                                            <span id=editorial>/ 에디토리얼 전용</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span id=commercial>상업적인 사용 가능 /</span>
                                            <span id=editorial style="color: dodgerblue;">에디토리얼 전용</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <hr class="m-0" style="background-color: darkgray;">
                    <div class="py-3 px-2">
                        <table class="w-100 m-auto">
                            <tr>
                                <th class="text-left" style="width: 60px;">사진</th>
                                <td class="text-center" style="width: 100px;">${dto.file_extension }</td>
                                <td class="text-center" style="width: 100px;">500원</td>
                                <td>
                                    <%-- 다운로드 버튼 제어  --%> 
                             		<c:choose>
										<%-- 로그인 안한 경우 --%>
										<c:when test="${loginInfo==null && adminInfo==null}">
										<button id=login data-toggle="modal" data-target="#Modal" style="border-radius: 5px;" class="btn btn-secondary px-2 py-1">무료 다운로드</button>
										<div class="modal" tabindex="-1" role="dialog" id=Modal>
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">무료 다운로드</h5>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<p>무료로 한번 사용해 보시겠어요?<br>(회원 가입 즉시 포인트 1000원 제공)</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">취소</button>
														<button type="button" class="btn btn-primary login">확인</button>
													</div>
												</div>
											</div>
										</div>

										<script>
					                        $(".login").on("click", function(){
					                            $("#Login").modal();
					                        })
					                    </script>
										</c:when>
										<%-- 로그인 한 경우  --%>
										<c:otherwise>
											<c:choose>
												<%-- 사용자가 관리자일 때  --%>
												<c:when test="${adminInfo!=null}">
													<button id=admin data-toggle="modal" data-target="#Modal2" style="border-radius: 5px;" class="btn btn-secondary px-2 py-1">다운로드</button>
													<div class="modal" tabindex="-1" role="dialog" id=Modal2>
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">관리자는 이미지 구매 불가</h5>
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	관리자는 이미지를 다운로드할 수 없습니다. 
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
																</div>
															</div>
														</div>
													</div>
												</c:when>
												<%-- 사용자가 작가일 때  --%>
												<c:when test="${loginInfo==dto.nickname}">
													<button id=writer_buy data-toggle="modal" data-target="#Modal2" style="border-radius: 5px;" class="btn btn-secondary px-2 py-1">다운로드</button>
													<div class="modal" tabindex="-1" role="dialog" id=Modal2>
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">본인의 이미지는 구매가 불가능합니다</h5>
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	무료 프로모션 금액으로 본인의 이미지를 구매, <br> 여러 계정을 생성하여 무료 프로모션
																	금액으로 본인의 이미지를 구매, <br> 무료 프로모션 금액을 이용하여 타인에게 <br>
																	본인의 이미지를 구매하게 유도하는 행위는 <br> 크라우드픽 이용약관 제11조(회원의 의무)
																	및 회사 내부규정에 위반되어 <br> 불이익을 받거나 탈퇴 처리될 수 있습니다.
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
																</div>
															</div>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<%-- 사용자가 일반 사용자일 때  --%>
													<c:choose>
														<%-- 이미 구매 한 경우 --%>
														<c:when test="${history==1}">
															<button id=historyYes>다운로드</button>
		
															<script>
		                                                        $("#historyYes").on("click", function(){
		                                                            alert("이미 사진을 구매 한 사용자입니다. 사진이 다운로드됩니다.");
																	location.href="${pageContext.request.contextPath}/writer/down?img_seq=${dto.img_seq}&sysname=${dto.sysname}&oriname=${dto.oriname}"
																	
		                                                        })
	                                                    	</script>
														</c:when>
														<%-- 구매 한 적이 없는 경우 --%>
														<c:otherwise>
															<c:choose>
																<%-- 포인트가 500원 이상인 경우  --%>
																<c:when test="${point>=500}">
																	<button id=buy data-toggle="modal" data-target="#Modal3" style="border-radius: 5px;" class="btn btn-secondary px-2 py-1">구매</button>
																	<div class="modal" tabindex="-1" role="dialog" id=Modal3>
																		<div class="modal-dialog" role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title">사진 구매</h5>
																					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																						<span aria-hidden="true">&times;</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					구매 시 500원이 차감됩니다. <br> 구매한 이미지는 회원 정보 사용 내역에서 확인
																					가능하며, 평생 다운로드 가능합니다. <br> 해당 사진을 구매 하시겠습니까?
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-primary buy">구매하기</button>
																					<button type="button" class="btn btn-secondary"
																						id="close_btn" data-dismiss="modal">취소</button>
																				</div>
																			</div>
																		</div>
																	</div>

																	<script>

                                                                    	$(".buy").on("click", function(){
                                                                            $.ajax({
                                                                                url : "money/buy.do",
                                                                                type : "post", 
                                                                                data : { 
                                                                                    writer_nickname : "${dto.nickname}",
                                                                                    deal_img_seq : "${dto.img_seq}" 
                                                                                }
                                                                            }).done(function(data){
                                                                                alert("구매에 성공했습니다.");
                                                                                $("#close_btn").trigger("click");
                                                                                // 구매 버튼을 다운로드 버튼으로 바꾼다 
                                                                                $("#buy").html('다운로드');
                                                                                //$("#buy").removeAttr('onclick',"").unbind('click');
                                                                                $("#buy").removeAttr('onclick');
                                                                                $("#buy").attr('id','historyYes');     
                                                                                $("#historyYes").attr("onclick", historyYes)

                                                                            }).fail(function(data){
                                                                                alert("구매에 실패했습니다. 다시 시도해주세요.");
                                                                            })

                                                                        })

                                                                        function historyYes(){ 
                                                                            $("#historyYes").on("click", function(){

                                                                                $('#Modal3').remove();
                                                                                $("#close_btn").trigger("click");

                                                                                alert("이미 사진을 구매 한 사용자입니다. 사진이 다운로드됩니다.");

                                                                                location.href="${pageContext.request.contextPath}/writer/down?img_seq=${dto.img_seq}&sysname=${dto.sysname}&oriname=${dto.oriname}"
                																	
                                                                            });			
                                                                        };
                                                                    </script>
																</c:when>
																<%-- 포인트가 500원 미만인 경우 --%>
																<c:otherwise>
																	<button id=chargePoint data-toggle="modal" data-target="#Modal4" style="border-radius: 5px;" class="btn btn-secondary px-2 py-1">구매</button>
																	<div class="modal" tabindex="-1" role="dialog" id=Modal4>
																		<div class="modal-dialog" role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title">포인트 부족</h5>
																					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																						<span aria-hidden="true">&times;</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					포인트가 부족하여 구매가 불가능합니다. <br> 포인트 충전화면으로 이동하시겠습니까?
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-primary chargePoint">확인</button>
																					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
																				</div>
																			</div>
																		</div>
																	</div>


																	<script>
                                                                    	$(".chargePoint").on("click", function(){
                                                                        	location.href="${pageContext.request.contextPath}/money/charge.do";
                                                                        })
                                                                    </script>
																</c:otherwise>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose> 
									<%-- --%>				
                            	</td>
                            </tr>
                        </table>
                    </div>
                    <hr class="m-0" style="background-color: darkgray;">
                	<div class="py-3 px-2 text-left">
                    	<h4 class="mt-2 mb-4 text-center">이미지 구매시 주의사항</h4>
		                <h6>이미지 구매전 꼭 구매자 가이드를 읽어보시기 바랍니다.</h6>
		                <h6>이용약관 및 구매자 가이드를 준수하지 않고 발생한 문제의 경우 당사가 책임지지 않습니다.</h6>
		                <h6>일부 콘텐츠는 초상권과 재산권의 추가 확보가 필요할 수 있으니 중요한 용도로 사용할 경우에는 반드시 구매전에 크라우드픽으로 문의하시기 바랍니다.</h6>
		                <h6>인물 콘텐츠 사용 시에는 이미지 사용제한 규정이 좀 더 민감하게 적용될 수 있으므로 구매자 가이드의 사진 사용제한 부분을 꼭 참고하시기 바랍니다.</h6>
		                <h6>이미지 구매시 이미지에 사용된 폰트는 디자인 샘플일 뿐, 함께 제공되는 것이 아닙니다. 정품 폰트를 구입하시거나 다른 폰트로 변경하여 사용하시길 바랍니다.</h6>
                    </div>
				</div>
            </div>
		</div>	
	</div>
	
	
	
	
	
	
	
	

	<script>

		$(function(){
			
			/*************************** 여기부터 로그인 모달창 *********************************/
			
    		$(function(){
    			$("#id").on("focus",function(){
    		    	$(".ears").css("transform", "rotate3d(-1, -0.648763, -0.324382, 0.31546rad)");
    		 	    $(".eyes").css("transform", "rotate3d(-1, -0.648763, -0.324382, 0.31546rad)");
    		 		$(".muzzle").css("transform", "rotate3d(-1, -0.648763, -0.324382, 0.31546rad)");
    		    })
	    		$("#logout").on("click",function(){
	        	var result = confirm("로그아웃 하시겠습니까?");
	        	if(result){
	        		location.href="/member/Logout.do";
	        		
	        	}else{
	        		alert("로그아웃이 취소되었습니다");
	        	}
        	});

    			$("#logout1").on("click",function(){
    				var result = confirm("로그아웃 하시겠습니까?");
    		    	if(result){
    		    		location.href="/member/Logout.do";
    		    		
    		    	}else{
    		    		alert("로그아웃이 취소되었습니다");
    		    	}
    			});
    			
    		    function cookieAsJSON(){
    	            var cookieJSON = {};
    	            var cookie = document.cookie;
    	           var trimedcookie = cookie.replace(/ /g,"");
    	           var entryArr = trimedcookie.split(";");
    	            for(var i = 0; i< entryArr.length;i++){
    	                var entry = entryArr[i].split("=")
    	                cookieJSON[entry[0]]=entry[1];
    	            }
    	            return cookieJSON;
    	        };
    	        $(function(){
    	            if(document.cookie != ""){
    	               var cookie = cookieAsJSON();
    	          $("#loginId").val(cookie.loginId);
    	            $("#saveId").prop("checked","true");
    	            }
    	            });
    		
    	        $("#saveId").on("change",function(){	        	
    	    	if($("#saveId").prop("checked")){
    				var exDate = new Date();
    				exDate.setDate(exDate.getDate()+30);
    				var loginId1 = $("#loginId").val();
    				document.cookie = "loginId="+loginId1+";expires="+exDate.toString();
    			}else{
    				var exDate = new Date();
    		           exDate.setDate(exDate.getDate()-1);
    		           document.cookie = "loginId=;expires="+exDate.toString();
    			}
    	        
    	        })
    	    
    		
    			$("#memlogin").on("click",function(){
    				loginProcess();
    			});
    	        
    	        $(".loginInput").on("keyup", function(e){
    	        	console.log("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
    	        	if(e.keyCode == 13){
    	        		loginProcess();
    	        	}	
    	        });
    	        
    	        function loginProcess(){
    				var login_id = $("#loginId").val();
            		var login_pw = $("#loginPw").val();
            		if(login_id==""){
            			alert("아이디 항목은 필수 입력값입니다.");
            			$("#loginId").focus();
            			return;
            		}
            		if(login_pw==""){
            			alert("비밀번호 항목은 필수 입력값입니다.");
            			$("#loginPw").focus();
            			return;
            		}
    				$.ajax({
    					url:"${pageContext.request.contextPath}/member/loginProc.do",
    					type:"post",
    					data:{ id:$("#loginId").val(),
    						pw:$("#loginPw").val()
    					}
    				}).done(function(res){
    					if(res == "로그인성공"){
    							alert("로그인에 성공했습니다!");
    							$("#memLogin").modal("hide");
    							location.reload();
    							opener.location.reload();
    							
    						}else if(res=="관리자로그인성공"){
    							
    							alert("관리자로 로그인했습니다");
    							$("#memLogin").modal("hide");
    							location.reload();
    							opener.location.reload();
    						}else if(res=="블랙1"){
    							
    							alert("로그인에 성공했습니다!\n블랙리스트 1회경고 회원입니다. 한번더 경고를받을시 블랙리스트에 등록됩니다.");
    							$("#memLogin").modal("hide");
    							location.reload();
    							opener.location.reload();
    						}else if(res=="블랙2"){
    							alert("블랙리스트 회원입니다 관리자에게 문의바랍니다.");
    				}else if(res == "로그인실패!"){
    							console.log(res);
    					 	$(".ears").css("transform", "rotate3d(1, -0.648763, -0.324382, 0.31546rad)");
    					    $(".eyes").css("transform", "rotate3d(1, -0.648763, -0.324382, 0.31546rad)");
    					    $(".muzzle").css("transform", "rotate3d(1, -0.648763, -0.324382, 0.31546rad)");
    					    $("#info").css("display", "block");
    						}
    				}).fail(function(res){ 
    					console.log(res);
    					if(res == "서버에러입니다 관리자에게 문의하세요"){
    					alert("서버에러입니다 관리자에게 문의하세요");}
    				});
    	        }
    	        
    		const ryan = document.querySelector('#ryan');
    		const face = document.querySelectorAll('.ears, .eyes, .muzzle');
    		const email = document.querySelector('input[type="text"]');
    		const password = document.querySelector('input[type="password"]');
    		const fauxInput = document.createElement('div');
    		const span = document.createElement('span');
    		let timer = null;
    			function rotate3d(x, y, z, rad) {
    		    const value = `rotate3d(${x}, ${y}, ${z}, ${rad}rad)`;
    		    for (let i=0; i < face.length; i++) {
    		        face[i].style.transform = value;
    		    }
    		}
    			function focus(event) {
    		    event.target.classList.add('focused');
    		    copyStyles(event.target);
    		    event.target.type === 'password' ? lookAway(event) : look(event);
    		}
    			function reset(event) {
    		    event.target.classList.remove('focused');
    		    ryan.classList.remove('playing');
    			    clearTimeout(timer);
    		    timer = setTimeout(() => { ryan.classList.remove('look-away', 'down', 'up'); rotate3d(0,0,0,0);}, 1);
    		}
    			function copyStyles(el) {
    		    const props = window.getComputedStyle(el, null);
    			    if ( fauxInput.parentNode === document.body ) {
    		        document.body.removeChild(fauxInput);
    		    }
    			fauxInput.style.visibility = 'hidden';
    		    fauxInput.style.position = 'absolute';
    		    fauxInput.style.top = Math.min(el.offsetHeight * -2, -999) + 'px';
    			    for(let i=0; i < props.length; i++) {
    		        if (['visibility','display','opacity','position','top','left','right','bottom'].indexOf(props[i]) !== -1) {
    		            continue;
    		        }
    		        fauxInput.style[props[i]] = props.getPropertyValue(props[i]);
    		    }
    			    document.body.appendChild(fauxInput);
    		}
    			
    		function look(event) {
    		    const el = event.target;
    		    const text = el.value.substr(0, el.selectionStart);
    			    span.innerText = text || '.';
    			    const ryanRect = ryan.getBoundingClientRect();
    		    const inputRect = el.getBoundingClientRect();
    		    const caretRect = span.getBoundingClientRect();
    		    const caretPos = caretRect.left + Math.min(caretRect.width, inputRect.width) * !!text;
    		    const distCaret = ryanRect.left + ryanRect.width/2 - inputRect.left - caretPos;
    		    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;
    		    const y = Math.atan2(-distCaret, Math.abs(distInput)*3);
    		    const x =  Math.atan2(distInput, Math.abs(distInput)*3 / Math.cos(y));
    		    const angle = Math.max(Math.abs(x), Math.abs(y));
    			    rotate3d('x/angle', 'y/angle', 'y/angle/2', angle);
    		}
    		
    		function lookAway(event) {
    		    const el = event.target;
    		    const ryanRect = ryan.getBoundingClientRect();
    		    const inputRect = el.getBoundingClientRect();
    		    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;

    		    ryan.classList.add( 'look-away', distInput < 0 ? 'up' : 'down' );
    				clearTimeout(timer);
    		    timer = setTimeout(() => {ryan.classList.add('playing')} , 300);
    		}
    		fauxInput.appendChild(span);
    		email.addEventListener( 'focus', focus, false );
    		email.addEventListener( 'keyup', look, false );
    		email.addEventListener( 'click', look, false );
    		email.addEventListener( 'blur', reset, false );
    		password.addEventListener( 'focus', lookAway, false );
    		password.addEventListener( 'blur', reset, false );
    		
    		});
            
            /*************************** 여기까지 로그인 모달창 *********************************/

			var tag = "${dto.tag}";
            tags = tag.replace(/##/gi,",").replace(/#/gi,"");
            var arr = tags.split(",");

            for(var i=0; i<arr.length-1; i++){
            	var span = "<a href='/Search.do?tag="+arr[i]+"' class='mx-1' style='text-decoration:none; padding: 5px;' onclick='opener.location.href=this.href; window.close();'>"+"#"+arr[i]+"</a>";/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */
                $("#tagbox").append(span);
            }

            var date = "${dto.img_sysdate}";
            $("#date").html(getFormatDate(date));     
            
            $('[data-toggle="tooltip"]').tooltip(); 

    		
            
		})
		
		
		
		
		
        function getFormatDate(date){
        	var newDate = new Date(date);
            var year = newDate.getFullYear();   
            var month = (1 + newDate.getMonth());          
            month = month >= 10 ? month : '0' + month;  
            var day = newDate.getDate();                   
            day = day >= 10 ? day : '0' + day;          
            return  year + '년 ' + month + '월 ' + day + '일';
		}

        var likeBtn = document.querySelector('.ico');
        
        likeBtn.addEventListener('click', function() {
        /*************************************************************/
        	var userSessionInfo = "${sessionScope.loginInfo}"; // 로그인 안하고 좋아요 누르면 로그인 페이지로
            var adminSessionInfo = "${sessionScope.adminInfo}";
            console.log("userInfo : " + userSessionInfo);
            console.log("adminInfo : " + adminSessionInfo);
            if(userSessionInfo == "" && adminSessionInfo == ""){
            	alert("로그인 후 이용하시기 바랍니다.");
            	/* window.close(); */
            	/* window.opener.$("#gotologin").click(); *//*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */
    
            	$("#Login").modal();
            	
                return;
        	}
		/*************************************************************/
			let count = 0;
            let total_count = ($("#total_photo_like").html())*1; // 총 좋아요 수 숫자로 변환

            likeBtn.classList.toggle('liked');
            var state = $(this).attr("class");
            
            if(state == "ico liked"){ // 좋아요 누르면
            	count = 1;	
            }else{ // 좋아요 취소하면
            	count = -1;
            }

            $.ajax({
            	url:"/PhotoLike.do",
                type:"post",
                data:{
                	img_seq : ${dto.img_seq},
                    count : count
                }
            }).done(function(res){
            	if(res == "ok"){
                	total_count += count;
                    $("#total_photo_like").html(total_count); // 총 좋아요 수 (화면상에서만) 수정
                }
            }).fail(function(){

        	});
   		});

                    
        var likeBtn2 = document.querySelector('.ico2');
        
        likeBtn2.addEventListener('click', function() {
        /*************************************************************/
        	var userSessionInfo = "${sessionScope.loginInfo}"; 
            var adminSessionInfo = "${sessionScope.adminInfo}";
            console.log("userInfo : " + userSessionInfo);
            console.log("adminInfo : " + adminSessionInfo);
                    	
            // 로그인 안하고 좋아요 누르면 로그인 페이지로
            if(userSessionInfo == "" && adminSessionInfo == ""){
            	alert("로그인 후 이용하시기 바랍니다.");
            	$("#Login").modal();
                return;
			}
                    	
            // 본인 작가 좋아요 못 누르게
            if(userSessionInfo == "${dto.nickname}" || adminSessionInfo == "${dto.nickname}"){
            	alert('자신의 작가 좋아요는 누를 수 없습니다.');
                return;
            }
		/*************************************************************/
	        let count = 0;
	        let total_count = ($("#total_writer_like").html())*1; // 총 좋아요 수 숫자로 변환
	
	        likeBtn2.classList.toggle('liked');
	        var state = $(this).attr("class");
	        if(state == "ico2 liked"){ // 좋아요 누르면
	        	count = 1;	
	        }else{ // 좋아요 취소하면
	        	count = -1;
	        }
	
	        $.ajax({
	        	url:"/WriterLike.do",
	            type:"post",
	            data:{
	            	nickname : "${dto.nickname}",
	            	count : count
	            }
			}).done(function(res){
				if(res == "ok"){
	            	total_count += count;
	                $("#total_writer_like").html(total_count); // 총 좋아요 수 (화면상에서만) 수정
	            }
	        }).fail(function(){
	
	        });
	    });
                    
	</script>
	
						<div class="modal fade" id="Login" role="dialog" aria-labelledby="Label" aria-hidden="true" style="top: 110px;">
							<div class="modal-dialog" role="document">
								<div class="modal-content" style="margin: auto; width: 430px;">
									<div class="modal-body text-center" style="font-family: 'Cafe24Oneprettynight';">
										<form action="loginProc.do" method="post" id="Loginfrm">
											<svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
		            							<path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
							            		<g class="ears">
									            	<path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
									                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
									            </g>
									            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
									            <g class="eyes">
									                <!-- left eye and eyebrow-->
									                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
									                <circle cx="44" cy="55" r="3" fill="#000" />
									                <!-- right eye and eyebrow -->
									                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" id="righteye" />
									                <circle cx="76" cy="55" r="3" fill="#000" />
									            </g>
									            <g class="muzzle">
									                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
			                						<path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
									                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
									            </g>
		            							<path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        									</svg>
											<input type="text" class="loginInput" placeholder="Input Your ID" name="loginId" id="loginId" style="font-family: 'Dovemayo-Medium';">
											<br>
											<input type="password" class="loginInput" placeholder="Input Your PW" name="loginPw" id="loginPw" style="font-family: 'Dovemayo-Medium';">
											<br>
											<div id="info" class="pt-2" style="font-size: 16px; display: none">잘못된 아이디 또는 잘못된 패스워드입니다.</div>
											<div class="form-group p-0 save" style="width: 300px;">
												<div class="form-check p-0 m-0" style="width: 130px;">
													<input class="form-check-input" type="checkbox" value="" id="saveId" style="cursor: pointer;" required>
													<label class="form-check-label" for="saveId" style="cursor: pointer;">아이디 저장</label>
												</div>
											</div>
											<input type="button" id="memlogin" value="로그인">
											<br>
										</form>
									</div>
									<div class="modal-footer">
										<table class="m-auto text-center" style="width: 100%; color: black;">
											<tr class="m-auto w-100">
												<td class="td"><a href="${pageContext.request.contextPath}/member/signup.do">회원가입</a>
												<td class="td"><a href="${pageContext.request.contextPath}/member/findid.do">아이디 찾기</a>
												<td class="td"><a href="${pageContext.request.contextPath}/member/findpw.do">비밀번호 찾기</a>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>

</body>
</html>