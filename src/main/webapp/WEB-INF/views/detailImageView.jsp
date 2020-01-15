<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html>
        <html>
            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>
                <style>
                    *{margin: auto; box-sizing: border-box;}
                    div{border-bottom: 1px solid black;}
                    #container{
                        width:1000px;
                        height:1000px;
                        border: 1px solid;
                    }

                    #orderleft{
                        float: left;
                        width: 70%;
                        height: 100%;
                        border: 1px solid;
                    }

                    #picture{
                        margin-left: 30px;
                        margin-top: 15px;
                        width: 100%;
                        height: 60%;
                        margin: 0;
                    }

                    #photo_like_box{
                        text-align: right;
                    }

                    #info{
                        width: 100%;
                    }

                    #orderright{
                        float: right;
                        width: 29%;
                        height: 100%;
                    }

                    #righttop{
                        width: 100%;
                        height: 100px;
                    }

                    .rightchild{
                        border: 1px solid;
                        width: 25%;
                        float: left;
                        margin-left: 10px;
                    }

                    .ico {
                        border-radius: 50%;
                        cursor: pointer;
                        fill: #232323;
                        transition: .4s;
                    }

                    .liked {
                        transform: scale(1.05) rotate(360deg);
                        background-color: #C62828;
                        padding: .3rem;
                        fill: white !important;
                    }
                    
                    .ico2 {
                        border-radius: 50%;
                        cursor: pointer;
                        fill: #232323;
                        transition: .4s;
                    }

                </style>
            </head>
            <body>
            
            	<jsp:include page="key/top.jsp" flush="false"/>

                <div id="container">
                    <div id="orderleft">
                        <div id="picture">
                            <img src="/watermarkfiles/${dto.sysname_watermark }" style="width:100%; height:auto%;">
                        </div>
                        <div id="photo_like_box">
                            <svg class="ico" width="24" height="24" viewBox="0 0 24 24">
                                <path d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z"></path>
                            </svg>
                            <span>좋아요</span>
                        </div>
                        <div id="info">
                            크리에이터
                            <a href='/writer/writerpage?nickname=${dto.nickname }' style='text-decoration:none' onclick='window.open("about:blank").location.href=this.href; return false;'>@${dto.nickname }</a>
                            <span>                            
	                            <svg class="ico2" width="24" height="24" viewBox="0 0 24 24">
	                                <path d="M12,21.35L10.55,20.03C5.4,15.36 2,12.27 2,8.5C2,5.41 4.42,3 7.5,3C9.24,3 10.91,3.81 12,5.08C13.09,3.81 14.76,3 16.5,3C19.58,3 22,5.41 22,8.5C22,12.27 18.6,15.36 13.45,20.03L12,21.35Z"></path>
	                            </svg>
                            </span>
                            <span>'</span>
                            <span id="total_writer_like">${likepoint }</span>
                            <span>'명이 좋아하는 작가로 등록을 하였습니다.</span>
                        </div>
                    </div>

                    <div id="orderright">
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
                                        <span><input type="button" value="다운로드" style="margin-left: 100px;"></span>
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
/*                     	
                    	var sessionInfo = "${sessionScope.loginInfo}"; // 로그인 안하고 좋아요 누르면 로그인 페이지로
                    	if(sessionInfo == ""){
                    		alert("로그인 후 이용하시기 바랍니다.");
                    		window.close();
                    		opener.window.location = "/GoToLogin.do";
                    	}
                    	 */
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
/*                     	
                    	var sessionInfo = "${sessionScope.loginInfo}"; // 로그인 안하고 좋아요 누르면 로그인 페이지로
                    	if(sessionInfo == ""){
                    		alert("로그인 후 이용하시기 바랍니다.");
                    		window.close();
                    		opener.window.location = "/GoToLogin.do";
                    	}
                    	 */
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