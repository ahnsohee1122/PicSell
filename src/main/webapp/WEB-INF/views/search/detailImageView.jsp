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
	body {margin: 0;}
</style>
</head>
<body>
	<div class="container-fulid" style="height: 100%; background-color: #f4f2f5; min-width: 1360px;">
		<div class="row m-auto p-4 text-center" style="max-width: 1360px;">
			<div class="col-7 mx-3" style="border: 1px solid darkgray; border-radius: 10px;">
				<div id="picture">
	            	<img src="/watermarkfiles/${dto.sysname_watermark }">
	        	</div>
	            	<div id="photo_like_box">
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
	                    <span>좋아요</span>
	                </div>
	                        <div id="info">
	                            크리에이터
	                            <a href='/writer/writerpage?nickname=${dto.nickname }' style='text-decoration:none' onclick='window.open("about:blank").location.href=this.href; return false;'>@${dto.nickname }</a>
	                            <span>                            
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
	                            <span>'</span>
	                            <span id="total_writer_like">${likepoint }</span>
	                            <span>'명이 좋아하는 작가로 등록을 하였습니다.</span>
	                        </div>
			</div>
			<div class="col-4 mx-3 ml-auto" style="border: 1px solid darkgray; border-radius: 10px;">
		<div id="righttop">
                            <div class="rightchild">${dto.viewcount }</div>
                            <div class="rightchild">${dto.downcount }</div>
                            <div class="rightchild">
                                <span id="total_photo_like">${dto.img_like }</span>
                            </div>
                        </div>
                        <div>
                            <table>
                                <tr>
                                    <td>해상도:</td>
                                    <td>${dto.xDimension }X${dto.yDimension }</td>
                                </tr>
                                <tr>
                                    <td>용량:</td>
                                    <td>${dto.img_size }MB</td>
                                </tr>
                                <tr>
                                    <td>파일 형식:</td>
                                    <td>${dto.file_extension }</td>
                                </tr>
                                <tr>
                                    <td>업로드 날짜:</td>
                                    <td id="date"></td>
                                </tr>
                                <tr>
                                    <td>제조사:</td>
                                    <td>${dto.make }</td>
                                </tr>
                                <tr>
                                    <td>모델:</td>
                                    <td>${dto.model }</td>
                                </tr>
                                <tr>
                                    <td>사용범위:</td>
                                    <td>
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
                                <tr>
                                    <td>사진</td>
                                    <td>
                                        <span>${dto.file_extension }</span>
                                        <span style="margin-left: 100px;">500원</span>
                                      
                                      
                             <%-- 다운로드 버튼 제어  --%> 
                             
							 <c:choose>
								<%-- 로그인 안한 경우 --%>
								<c:when test="${loginInfo==null && adminInfo==null}">
									<span><button id=login data-toggle="modal"
											data-target="#Modal" style="margin-left: 100px;">무료
											다운로드</button></span>
									<div class="modal" tabindex="-1" role="dialog" id=Modal>
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">무료 다운로드</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<p>
														무료로 한번 사용해 보시겠어요? <br> (회원 가입 즉시 포인트 1000원 제공)
													</p>
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
                            location.href="${pageContext.request.contextPath}/member/login.do";
                        })
                    </script>
								</c:when>

								<%-- 로그인 한 경우  --%>
								<c:otherwise>

									<c:choose>
										<%-- 사용자가 관리자일 때  --%>
										<c:when test="${adminInfo!=null}">
											<span><button id=admin data-toggle="modal"
													data-target="#Modal2" style="margin-left: 100px;">다운로드</button></span>

											<div class="modal" tabindex="-1" role="dialog" id=Modal2>
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title">관리자는 이미지 구매 불가</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
														관리자는 이미지를 다운로드할 수 없습니다. 
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">확인</button>
														</div>
													</div>
												</div>
											</div>
										</c:when>
										
										<%-- 사용자가 작가일 때  --%>
										<c:when test="${loginInfo==dto.nickname}">

											<span><button id=writer_buy data-toggle="modal"
													data-target="#Modal2" style="margin-left: 100px;">다운로드</button></span>

											<div class="modal" tabindex="-1" role="dialog" id=Modal2>
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title">본인의 이미지는 구매가 불가능합니다</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
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
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">확인</button>
														</div>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<%-- 사용자가 작가가 아닐 때  --%>

											<c:choose>

												<%-- 이미 구매 한 경우 --%>
												<c:when test="${history==1}">
													<button id=historyYes>다운로드</button>

													<script>
                                                        $("#historyYes").on("click", function(){
                                                            alert("이미 사진을 구매 한 사용자입니다. 사진이 다운로드됩니다.");

                                                            $.ajax({
                                                                url : "${pageContext.request.contextPath}/down.do",
                                                                type : "post",
                                                                data : { img_seq : dto.img_seq}
                                                            }).done(function(){
                                                                alert("다운로드가 성공했습니다.");
                                                            }).fail(function(){
                                                                alert("다운로드에 실패했습니다.");
                                                            })
                                                        })
                                                    </script>
												</c:when>

												<%-- 구매 한 적이 없는 경우 --%>
												<c:otherwise>
													<c:choose>


														<%-- 포인트가 500원 이상인 경우  --%>
														<c:when test="${point>=500}">
															<script>
                                                                    </script>

															<span><button id=buy data-toggle="modal"
																	data-target="#Modal3" style="margin-left: 100px;">구매</button></span>

															<div class="modal" tabindex="-1" role="dialog" id=Modal3>
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">사진 구매</h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
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

                                                                                $.ajax({
                                                                                    url : "${pageContext.request.contextPath}/down.do",
                                                                                    type : "post",
                                                                                    data : { img_seq : "${dto.img_seq}"
                                                                                           }
                                                                                }).done(function(){
                                                                                    alert("다운로드가 성공했습니다.");
                                                                                }).fail(function(){
                                                                                    alert("다운로드에 실패했습니다.");
                                                                                })
                                                                            })			
                                                                        }
                                                                    </script>
														</c:when>

														<%-- 포인트가 500원 미만인 경우 --%>
														<c:otherwise>

															<span><button id=chargePoint data-toggle="modal"
																	data-target="#Modal4" style="margin-left: 100px;">구매</button></span>

															<div class="modal" tabindex="-1" role="dialog" id=Modal4>
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">포인트 부족</h5>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			포인트가 부족하여 구매가 불가능합니다. <br> 포인트 충전화면으로 이동하시겠습니까?
																		</div>
																		<div class="modal-footer">
																			<button type="button"
																				class="btn btn-primary chargePoint">확인</button>
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">취소</button>
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
                        <div>
                            <h4>이미지 구매시 주의사항</h4>
                            이미지 구매전 꼭 구매자 가이드를 읽어보시기 바랍니다.
                            이용약관 및 구매자 가이드를 준수하지 않고 발생한 문제의 경우 당사가 책임지지 않습니다.<br>
                            일부 콘텐츠는 초상권과 재산권의 추가 확보가 필요할 수 있으니 중요한 용도로 사용할 경우에는 반드시 구매전에 크라우드픽으로 문의하시기 바랍니다.<br>
                            인물 콘텐츠 사용 시에는 이미지 사용제한 규정이 좀 더 민감하게 적용될 수 있으므로 구매자 가이드의 사진 사용제한 부분을 꼭 참고하시기 바랍니다.<br>
                            이미지 구매시 이미지에 사용된 폰트는 디자인 샘플일 뿐, 함께 제공되는 것이 아닙니다. 정품 폰트를 구입하시거나 다른 폰트로 변경하여 사용하시길 바랍니다.
                        </div>
                        <div id=tagbox style="border-bottom:none;">
                        </div>
                    </div>
		</div>	
	</div>

                <script>

                    $(function(){
                        var tag = "${dto.tag}";
                        tags = tag.replace(/{/gi,"").replace(/}/gi,",");
                        var arr = tags.split(",");
                        console.log(arr);
                        console.log(arr.length-1);

                        for(var i=0; i<arr.length-1; i++){
                            var span = "<a href='/Search.do?tag="+arr[i]+"' style='text-decoration:none;'><span style='border-radius:3px; border:1px solid black; margin:3px; padding:2px;'>"+arr[i]+"</span></a>";
                            $("#tagbox").append(span);
                        }

                        var date = "${dto.img_sysdate}";
                        $("#date").html(getFormatDate(date));                    
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
                    		window.close();
                    		opener.window.location = "/GoToLogin.do";
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
                    		window.close();
                    		opener.window.location = "/GoToLogin.do";
                    		return;
                    	}
                    	
                    	// 본인 작가 좋아요 못 누르게
                    	if(userSessionInfo == "${dto.nickname}" || adminSessionInfo == "${dto.nickname}"){
                    		alert('사용자 본인은 작가 좋아요를 누를 수 없습니다.');
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
</body>
</html>