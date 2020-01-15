<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script type="text/javascript"
                src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

        <!-- bootpay -->	
        <script src="https://cdn.bootpay.co.kr/js/bootpay-3.1.0.min.js" type="application/javascript"></script>

        <!-- fullcalendar -->	
        <link href='/fullcalendar-4.3.1/packages/core/main.css' rel='stylesheet' />
        <link href='/fullcalendar-4.3.1/packages/daygrid/main.css' rel='stylesheet' />
        <link href='/fullcalendar-4.3.1/packages/timegrid/main.css' rel='stylesheet' />
        <link href='/fullcalendar-4.3.1/packages/list/main.css' rel='stylesheet' />
        <script src='/fullcalendar-4.3.1/packages/core/main.js'></script>
        <script src='/fullcalendar-4.3.1/packages/daygrid/main.js'></script>
        <script src='/fullcalendar-4.3.1/packages/moment/main.js'></script>
        <script src='/fullcalendar-4.3.1/packages/interaction/main.js'></script>
        <script src='/fullcalendar-4.3.1/packages/list/main.js'></script>
        <script src='/fullcalendar-4.3.1/packages/timegrid/main.js'></script>



        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script>

        document.addEventListener('DOMContentLoaded', function() {
        	
        	
        	// 저장되어있는 값을 가져온다 
            function getEvent(){
                $.ajax({
                    url: "${pageContext.request.contextPath}/getEvent",
                    type: "get",
                    dataType:"json",
                    
                    // 값을 성공적으로 받아온 경우 
                    success: function(data){
                    	
                    	// 출석체크를 한 이력이 없는 경우 
                    	if("${event}"==0){
                    	
                    	// 캘린더를 만든다 
                        var calendarEl = document.getElementById('calendar');
                        var calendar = new FullCalendar.Calendar(calendarEl, {
                            plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
                            header:{
                                left:'title',
                                center:'none',
                                right:'custom2'
                            },
                  
                            // 출석체크를 위한 버튼 생성 
                            customButtons:{
                                custom2: {
                                    text:'출석체크하기', 
                                    id:'check',
                                    // 출석체크 버튼 누르면 출석완료 처리
                                    click:function(){
                                        var date = $(".fc-today").attr("data-date");
                                        console.log(date);
                                        // ajax로 출석 정보를 저장한다 
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/test/selectEventList",
                                            type: "post",
                                            data : {nickname: "aaa", event_date:date},
                                            dataType: "json"
                                        }).done(function(data){
                                            // 버튼이 출석완료로 바뀐다 
                                            $(".fc-custom2-button").prop('disabled', true);
                                            $(".fc-custom2-button").html('출석완료');
                                            // 달력에 출석완료 이벤트가 표시된다 
                                           // $(".fc-today ").append($('<span>'+'출석완료'+'</span>'));
                                            alert('오늘의 출석이 완료되었습니다. 10포인트가 지급되었습니다!');
                                            calendar.addEvent({
                                              //  "title": '출석완료',
                                                "start": date,
                                                "color" : "#FF0000",
                                                "textColor" : "#FFFF00",
                                               imageurl : "/images/icon.png"
                                            })
                                        });
                                    }
                                }
                            }, 
                                eventRender:function(event, eventElement) {
                                	if(event.event.extendedProps.imageurl){
                                		  eventElement.find("td.fc-today").html("<img src="+event.event.extendedProps.imageurl+">");
                                }
                                }
                        });
                        
                        
                    	}else if("${event}"==1){
                    		// 캘린더를 만든다 
                            var calendarEl = document.getElementById('calendar');
                            var good = "events: [ { title: 'The Title',  start: '2020-01-20' }]";
                            var calendar = new FullCalendar.Calendar(calendarEl, {
                                plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
                                header:{
                                    left:'title',
                                    center:'none',
                                    right:'custom2'
                                },
                      
                                // 출석체크를 위한 버튼 생성 
                                customButtons:{
                                    custom2: {
                                        text:'출석완료'
                                    }
                                }, 
                                eventRender:function(event, eventElement) {
                                	if(event.event.extendedProps.imageurl){
                                		 event.el.find("td.fc-today").html("<img src="+event.event.extendedProps.imageurl+">");
                                }
                                }
                            
                            );
                    	};
                    	// 가져온 달력 정보를 캘린더에 뿌린다 
                        for(var i = 0;i < data.length;i++){
                            calendar.addEvent(data[i]);
                            console.log(data[i].imageurl);                        }
                   		// 캘린더 랜더링 
                        calendar.render();	
                    },
                    // 저장되어있는 값을가져오지 못한 경우 
                    error : function(data){
                        //alert('error')
                    }///////////////////
                }
                
                );    	
            }
            getEvent();
    
            });
        </script>
        <style>
        img{
        width:20px;
        height:20px;
        }
        </style>
    </head>
    <body>
        <h1>출석체크</h1>
        <div class="container calendar-container">
            <div id="calendar" style="max-width:900px; margin:40px auto;"></div>

        </div>
        <hr>

        <h1>사진 결제</h1>

        <c:choose>
            <%-- 로그인 안한 경우 --%>	
                <c:when test="${loginInfo==null}">
                    <button id=login data-toggle="modal" data-target="#Modal">무료 다운로드</button>

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
                                    <p>무료로 한번 사용해 보시겠어요? <br> (회원 가입 즉시  포인트 1000원 제공) </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">취조</button>
                                    <button type="button" class="btn btn-primary login">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        $(".login").on("click", function(){
                            location.href="${pageContext.request.contextPath}/login.do";
                        })
                    </script>
                </c:when>

                <%-- 로그인 한 경우  --%>
                    <c:otherwise>

                        <c:choose>
                            <%-- 사용자가 작가일 때  --%>
                                <c:when test="${loginInfo==dto.nickname}">
                                    <button id=buy data-toggle="modal" data-target="#Modal2">다운로드</button>

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
                                                    무료 프로모션 금액으로 본인의 이미지를 구매, <br> 
                                                    여러 계정을 생성하여 무료 프로모션 금액으로 본인의 이미지를 구매, <br>
                                                    무료 프로모션 금액을 이용하여 타인에게 <br>
                                                    본인의 이미지를 구매하게 유도하는 행위는 <br>
                                                    크라우드픽 이용약관 제11조(회원의 의무) 및 회사 내부규정에 위반되어 <br>
                                                    불이익을 받거나 탈퇴 처리될 수 있습니다.
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
                                                                    <button id=buy data-toggle="modal" data-target="#Modal3">구매</button>

                                                                    <div class="modal" tabindex="-1" role="dialog" id=Modal3>
                                                                        <div class="modal-dialog" role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title">사진 구매</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal"
                                                                                            aria-label="Close">
                                                                                        <span aria-hidden="true">&times;</span>
                                                                                    </button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    구매 시 500원이 차감됩니다. <br> 구매한 이미지는 회원 정보 사용 내역에서 확인 가능하며, 평생 다운로드 가능합니다. <br> 해당 사진을 구매 하시겠습니까? 
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-primary buy">구매하기</button>
                                                                                    <button type="button" class="btn btn-secondary" id="close_btn"
                                                                                            data-dismiss="modal">취소</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                    <script>

                                                                        $(".buy").on("click", function(){
                                                                            $.ajax({
                                                                                url : "buy.do",
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
                                                                                alert("다운로드에 실패했습니다. 다시 시도해주세요.");
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
                                                                        <button id=chargePoint data-toggle="modal" data-target="#Modal4">구매</button>

                                                                        <div class="modal" tabindex="-1" role="dialog" id=Modal4>
                                                                            <div class="modal-dialog" role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title">포인트 부족</h5>
                                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                                aria-label="Close">
                                                                                            <span aria-hidden="true">&times;</span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        포인트가 부족하여 구매가 불가능합니다. <br> 포인트 충전화면으로 이동하시겠습니까?
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-primary chargePoint">확인</button>
                                                                                        <button type="button" class="btn btn-secondary"
                                                                                                data-dismiss="modal">취소</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>


                                                                        <script>
                                                                            $(".chargePoint").on("click", function(){
                                                                                location.href="${pageContext.request.contextPath}/charge.do";
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

                                        <hr>
                                        <h1>구입 내역 확인하기</h1>
                                        <button id=buy_list_check>구입 내역 확인하기</button>
                                        <script>
                                            $("#buy_list_check").on("click", function(){
                                                location.href =  "${pageContext.request.contextPath}/buy_list_check.do";
                                            })

                                        </script>

                                        <hr>
                                        <h1>판매 내역 확인하기</h1>
                                        <button id=sell_list_check>판매 내역 확인하기</button>

                                        <script>
                                            $("#sell_list_check").on("click", function(){
                                                location.href = "${pageContext.request.contextPath}/sell_list_check.do";
                                            })
                                        </script>



                                        <hr>
                                        <h1>내 포인트 확인하기</h1>
                                        <button id="myPoint">내 포인트 확인하기</button>

                                        <script>
                                            $("#myPoint").on("click", function(){
                                                location.href = "${pageContext.request.contextPath}/myPoint.do";
                                            })

                                        </script>
                                        <hr>

                                        <p>
                                        <p>아임 서포트 결제 모듈 테스트 해보기</p>
                                        <button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>
                                        </p>




                                    <form action="/go">
                                        email : <input type=text name=email> pw : <input type=text
                                                                                         name=pw>
                                        <button>go</button>
                                    </form>

                                    <script>
                                        $("#check_module").click(function() {
                                            var IMP = window.IMP; // 생략가능
                                            IMP.init('imp25764375');
                                            // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
                                            // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
                                            IMP.request_pay({
                                                pg : 'nice', // version 1.1.0부터 지원.
                                                /*
				 'kakao':카카오페이,
				 html5_inicis':이니시스(웹표준결제)
				 'nice':나이스페이
				 'jtnet':제이티넷
				 'uplus':LG유플러스
				 'danal':다날
				 'payco':페이코
				 'syrup':시럽페이
				 'paypal':페이팔
				 */

                                                pay_method : 'card',
                                                /*
				 'samsung':삼성페이,
				 'card':신용카드,
				 'trans':실시간계좌이체,
				 'vbank':가상계좌,
				 'phone':휴대폰소액결제
				 */
                                                merchant_uid : 'merchant_' + new Date().getTime(),
                                                /*
				 merchant_uid에 경우
				 https://docs.iamport.kr/implementation/payment
				 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 참고하세요.
				 나중에 포스팅 해볼게요.
				 */
                                                name : '주문명:결제테스트',
                                                //결제창에서 보여질 이름
                                                amount : 1000,
                                                //가격
                                                buyer_email : 'iamport@siot.do',
                                                buyer_name : '구매자이름',
                                                buyer_tel : '010-1234-5678',
                                                buyer_addr : '서울특별시 강남구 삼성동',
                                                buyer_postcode : '123-456',
                                                m_redirect_url : 'https://www.yourdomain.com/payments/complete'
                                                /*
			 모바일 결제시,
			 결제가 끝나고 랜딩되는 URL을 지정
			 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			 */
                                            }, function(rsp) {
                                                console.log(rsp);
                                                if (rsp.success) {
                                                    var msg = '결제가 완료되었습니다.';
                                                    msg += '고유ID : ' + rsp.imp_uid;
                                                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                                                    msg += '결제 금액 : ' + rsp.paid_amount;
                                                    msg += '카드 승인번호 : ' + rsp.apply_num;
                                                } else {
                                                    var msg = '결제에 실패하였습니다.';
                                                    msg += '에러내용 : ' + rsp.error_msg;
                                                }
                                                alert(msg);
                                            });
                                        });
                                    </script>

                                    </body>
                                </html></html>