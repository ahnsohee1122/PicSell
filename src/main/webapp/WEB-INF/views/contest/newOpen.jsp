<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Contest Open | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	strong {color: crimson;}
li{text-decoration:none; list-style-type : none }
 table{table-layout:fixed;width:100%;border-collapse:collapse;border-spacing:0}
            caption{overflow:hidden;width:0;height:0;font-size:0;line-height:0;text-indent:-999em}
            img,fieldset{border:0}
            legend{height:0;visibility:hidden}
            em,address{font-style:normal}
            img{border:0 none;vertical-align:middle}
            a{color:#555;text-decoration:none}
            input,select{margin:0;padding:0;vertical-align:middle}
            button{margin:0;padding:0;font-family:inherit;border:0 none;background:transparent;cursor:pointer}
            button::-moz-focus-inner{border:0;padding:0}
            header,footer,aside,nav,section,article{display:block}

            .clearfix{*zoom:1}
            .clearfix:after{content:"";display:block;clear:both;overflow:hidden}

            /* Search */
            .searchBox{border:none}
            .searchBox tbody th{padding:20px 10px 20px 35px;font-size:14px;font-weight:bold;text-align:left;vertical-align:top;border:none;background:#e6e6e6 }
            .searchBox tbody td{padding:12px 10px 12px 25px;border:none;background-color:#dedede}
        
            .searchDate{overflow:hidden;margin-bottom:10px;*zoom:1}
            .searchDate:after{display:block;clear:both;content:''}
        
            .demi{display:inline-block;margin:0 1px;vertical-align:middle}
            .inpType{padding-left:6px;height:24px;line-height:24px;border:1px solid #dbdbdb}
            .btncalendar{display:inline-block;width:22px;height:22px;background:url(images/btn_calendar.gif) center center no-repeat;text-indent:-999em}

/*    기본 글씨체 */
    @font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal; }
/*    공모전 개최 글씨체 */
    @font-face { font-family: 'NanumBarunpen'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumBarunpen.woff') format('woff'); font-weight: normal; font-style: normal; }
</style>
</head>
<body>
	<jsp:include page="../key/top.jsp" flush="false"/>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	 <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	 <script>                

        $(document).ready(function() {

            //datepicker 한국어로 사용하기 위한 언어설정
            $.datepicker.setDefaults($.datepicker.regional['ko']);     
        
            // Datepicker            
            $(".datepicker").datepicker({
                showButtonPanel: true,
                dateFormat: "yy-mm-dd",
                onClose : function ( selectedDate ) {
                
                    var eleId = $(this).attr("id");
                    var optionName = "";

                    if(eleId.indexOf("StartDate") > 0) {
                        eleId = eleId.replace("StartDate", "EndDate");
                        optionName = "minDate";
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate";
                    }

                    $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                    $(".searchDate").find(".chkbox2").removeClass("on"); 
                }
            }); 

            //시작일.
            /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
                // 시작일 datepicker가 닫힐때
                // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

            //종료일.
            /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
                // 종료일 datepicker가 닫힐때
                // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

            $(".dateclick").dateclick();    // DateClick
            $(".searchDate").schDate();        // searchDate
            
        });

        // Search Date
        jQuery.fn.schDate = function(){
            var $obj = $(this);
            var $chk = $obj.find("input[type=radio]");
            $chk.click(function(){                
                $('input:not(:checked)').parent(".chkbox2").removeClass("on");
                $('input:checked').parent(".chkbox2").addClass("on");                    
            });
        };

        // DateClick
        jQuery.fn.dateclick = function(){
            var $obj = $(this);
            $obj.click(function(){
                $(this).parent().find("input").focus();
            });
        }    

        
        function setSearchDate(start){

            var num = start.substring(0,1);
            var str = start.substring(1,2);

            var today = new Date();

            //var year = today.getFullYear();
            //var month = today.getMonth() + 1;
            //var day = today.getDate();
            
            var endDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchEndDate').val(endDate);
            
            if(str == 'd'){
                today.setDate(today.getDate() - num);
            }else if (str == 'w'){
                today.setDate(today.getDate() - (num*7));
            }else if (str == 'm'){
                today.setMonth(today.getMonth() - num);
                today.setDate(today.getDate() + 1);
            }

            var startDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchStartDate').val(startDate);
                    
            // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
            $("#searchEndDate").datepicker( "option", "minDate", startDate );
            
            // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
            $("#searchStartDate").datepicker( "option", "maxDate", endDate );

        }

            
        </script>
	 
	<div class="container-fluid px-0 py-3" style="background-color: #f4f2f5; font-family: 'Cafe24Oneprettynight';">
		<div class="container p-0">
			<h2 class="mx-3 pt-4 pb-3 px-4 text-center">공모전 신청하기</h2>
			<h6 class="mx-3 py-2 px-4">어떤 공모전을 열고 싶으세요?</h6>
			<h6 class="mx-3 py-2 px-4">픽셀 ＇공모전＇을 통해<br>특정 주제의 이미지를 빠르고 효율적으로 공모할 수 있습니다.</h6>
			<h6 class="mx-3 py-2 px-4">아래의 신청 양식을 작성해주시면,<br>확인 후 회원님의 전화번호 또는 메일로 연락 드리겠습니다!</h6>
			<form class="mx-3 my-5 px-4 py-3" style="font-size: 15px; font-family: 'NanumBarunpen'; border: 1px solid darkgray; border-radius: 10px;">
				<fieldset class="form-group">
					<div class="row my-4">
				    	<label class="col-form-label col-3 col-md-2 pt-0">주최이유<strong> * </strong></label>
				      	<div class="col-9 col-md-10">
					        <div class="form-check my-1">
					          	<input class="form-check-input" type="radio" name="reason" id="gridRadios1" value="option1">
					          	<label class="form-check-label" for="gridRadios1">기업 사진 대회 공모전</label>
					        </div>
					        <div class="form-check my-1">
					        	<input class="form-check-input" type="radio" name="reason" id="gridRadios2" value="option2">
					          	<label class="form-check-label" for="gridRadios2">공공기관 사진 대회 공모전</label>
					        </div>
					        <div class="form-check my-1">
					        	<input class="form-check-input" type="radio" name="reason" id="gridRadios3" value="option3">
					          	<label class="form-check-label" for="gridRadios3">AI 이미지 데이터 수집 공모전</label>
					        </div>
					        <div class="form-check my-1">
					        	<input class="form-check-input" type="radio" name="reason" id="gridRadios4" value="option4">
					          	<label class="form-check-label" for="gridRadios4">원하는 특정 이미지를 직접 공모 or 요청</label>
					        </div>
					        <div class="form-check my-1">
					        	<input class="form-check-input" type="radio" name="reason" id="gridRadios5" value="option5">
					          	<label class="form-check-label" for="gridRadios5">기타 :<input type="text" id="others" class="mx-2" style="width: 200px; height: 15px; background: 0; border: 0; border-bottom: 1px solid darkgray;"></label>
					        </div>
				    	</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">타이틀<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<input type="text" class="form-control" name="title" id="validation01" placeholder="예) 일본어로 제작된 수학책/수학문제 수집 공모전" style="font-size: 15px;" required>
	      					<div class="invalid-feedback">주최하실 공모전의 제목을 작성해주세요!</div>
						</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">상세설명<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<textarea class="form-control invalid" name="detail" id="validationTextarea01" placeholder="예)&#13;&#10;본 공모전은 인공지능 학습용 데이터 구축을 위한 데이터 수집 공모전입니다.&#13;&#10;수집된 데이터는 내부 연구용으로만 사용될 예정이며, 외부 공개되지 않습니다.&#13;&#10;&#13;&#10;기존에 촬영한 사진 혹은, 새로 촬영한 사진을 올려주시면 감사하겠습니다." style="min-height: 140px; font-size: 15px;" required></textarea>
	      					<div class="invalid-feedback">주최하실 공모전에 대한 설명을 자세히 작성해주세요!</div>
						</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">조건사항<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<textarea class="form-control invalid px-2 py-1" name="terms" id="validationTextarea02" placeholder="예)&#13;&#10;1. 이런 사진을 촬영하여 올려주세요&#13;&#10;- 본 공모전은 일본어로 제작된 수학책/수학문제 수집 공모전입니다.&#13;&#10;- 사진속에는 일본어 지문과 수학공식이 있어야 합니다.&#13;&#10;- 촬영 장소는 실내/실외 상관없이 밝은 조명의 사진을 촬영하셔야 합니다.&#13;&#10;- 같은 페이지에서 다른 각도로 촬영하시면 안되며, 사진이 흔들리거나 배경이 흐리면 안됩니다.&#13;&#10;&#13;&#10;2. 저작권 관련 설명&#13;&#10;- 본 공모전의 요강에 맞는 사진은 실시간으로 수집됩니다.&#13;&#10;- 저작권(2차적 저작권 포함)이 판매/양도되는 공모전입니다.&#13;&#10;- 작가님들은 데이터 제출과 동시에 저작권이 양도되는 것을 인지하시고, 판매가 완료된 사진의 원본(본인이 가지고 있는 사진)을 삭제해 주시길 바랍니다." style="min-height: 270px; font-size: 15px;" required></textarea>
	      					<div class="invalid-feedback">이미지 업로드에 참고할 조건사항을 작성해주세요!</div>
						</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">파일첨부<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<input type="file" class="form-control p-1" id="validationFile" required>
						    <div class="invalid-feedback">주최하실 공모전의 예시 사진을 첨부해주세요! (이미지 업로드에 도움이 됩니다.)</div>
						</div>
				    </div>
  					<hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">기간<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<table class="searchBox">
            <caption>조회</caption>
            <colgroup>
                <col width="123px">
                <col width="*">
            </colgroup>
            <tbody>
                <tr>
                    <th>조회기간</th>
                    <td>
                        
                        
                        <div class="clearfix">
                            <!-- 시작일 -->
                            <span class="dset">시작일 : 
                                <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" readonly >
                                
                            </span>
                            <span class="demi">~ 종료일 : </span>
                            <!-- 종료일 -->
                            <span class="dset">
                                <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" readonly >
                               
                            </span>
                        </div>    
                    </td>
                </tr>

            <tbody>
        </table>
						</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">상금<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<input type="text" class="form-control" name="price" id="validation02" placeholder="예) 1,000,000원" style="font-size: 15px;" required>
	      					<div class="invalid-feedback">주최하실 공모전의 상금을 걸어주세요! (장난으로 작성하실 경우 심사에서 거절 처리 됩니다.)</div>
						</div>
				    </div>
				    <hr>
				    <div class="row my-4 was-validated">
     					<label class="col-form-label col-3 col-md-2 pt-0">주최기관<strong> * </strong></label>
	      				<div class="col-9 col-md-10">
	      					<input type="text" name="hosttype" class="form-control" id="validation01" placeholder="예) 기업 : (주)픽셀 / 개인 : 안소희" style="font-size: 15px;" required>
	      					<div class="invalid-feedback">주최하시는 기관을 작성해주세요!(기업일 경우 기업명을, 개인일 경우 성함을 작성해주세요.)</div>
						</div>
				    </div>
				    <hr>
				    <div class="form-group was-validated">
					    <div class="form-check">
					      <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
					      <label class="form-check-label" for="invalidCheck">공모전을 신청합니다.<br><span style="font-size: 13px; color: black;">(신청 후 최대 7일 이내에 모든 심사가 완료됩니다.)</span></label>
					    </div>
				  	</div>
				  	<div class="row mt-5 mb-3">
				  		<button class="m-auto btn border border-danger rounded-lg text-black" type="submit" style="width: 150px;">신청하기</button>
				  	</div>
				</fieldset>
			</form>
		</div>
	</div>
	
	<script>
		// 주최이유 기타 내용 적는 부분 클릭하면 라디오버튼이 기타에 찍힘
		$("#others").on("click", function() {
			$("input[id=gridRadios5]").prop("checked", true);
		})
		
		
	</script>
	
	<jsp:include page="../key/bottom.jsp" flush="false"/>
</body>
</html>