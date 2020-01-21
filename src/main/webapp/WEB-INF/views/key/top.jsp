<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top | PicSell</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>     
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Play&display=swap" rel="stylesheet"><!-- 로고 글씨체 -->
<style>
/*    기본 글씨체 */
	@font-face {font-family: 'Cafe24Oneprettynight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff'); font-weight: normal; font-style: normal;}
	@font-face {font-family: 'NanumBarunpen'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumBarunpen.woff') format('woff'); font-weight: normal; font-style: normal;}
	@font-face {font-family: 'Dovemayo-Medium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/Dovemayo-Medium.woff') format('woff'); font-weight: normal; font-style: normal;}

/*    로그인 */
	#LoginFrm {width: 320px; margin: auto; opacity: 1; display: flex; flex-direction: column; text-align: center;}
	#ryan {margin: auto; width: 70%; border-radius: 50%; border: 1px solid #E0A243; background: #fff; align-self: center; transform-style: preserve-3d;}
	#loginId {font-size: 16px; width: 300px; height: 30px; margin: 20px auto 0px auto; padding: 0 10px; color: black;}
	#loginPw {font-size: 16px; width: 300px; height: 30px; margin: 10px auto 0px auto; padding: 0 10px; color: black;}
	
	.save {margin: 10px auto 0px auto;}
	
	#login {font-size: 18px; width: 300px; height: 30px; margin: 20px auto 0px auto; padding: 0 10px; color: black; border: 1px solid #E0A243; background-color: white; color: #E0A243;}

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
<script>
$(function(){
		(function(){
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
	    
		
    	
			$("#login").on("click",function(){
				
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
						pw:$("#loginPw").val(),
					}
				}).done(function(res){

					if(res == "로그인성공"){
							alert("로그인에 성공했습니다!");
							$("#Login").modal("hide");
							location.reload();
						}else if(res=="관리자로그인성공"){
							
							alert("관리자로 로그인했습니다");
							$("#Login").modal("hide");
							location.reload();
						}else if(res=="블랙1"){
							
							alert("로그인에 성공했습니다!\n블랙리스트 1회경고 회원입니다. 한번더 경고를받을시 블랙리스트에 등록됩니다.");
							$("#Login").modal("hide");
							location.reload();
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
			});
	        $(".loginInput").on("keyup", function(e){

	            if(e.keyCode == 13){
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
							console.log(res);
						
								alert("로그인에 성공했습니다!");
								location.href="/home.do";
							}else if(res=="관리자로그인성공"){
								
								alert("관리자로 로그인했습니다");
								location.href="/home.do";
							}else if(res=="블랙1"){
								
								alert("로그인에 성공했습니다!\n블랙리스트 1회경고 회원입니다. 한번더 경고를받을시 블랙리스트에 등록됩니다.");
								location.href="/home.do";
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
	        });
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
		
		})();
})
    </script>
</head>
<body>
	<div class="container-fluid p-0" style="height: 50px;">
		<div
			class="col-5 col-md-4 col-lg-3 py-0 px-3 px-md-4 h-100 float-left">
			<ul class="h-100 float-left m-0 p-0" style="list-style: none;">
				<a href="${pageContext.request.contextPath}/home" class="h-100">
					<li class="h-100 float-left" style="line-height: 3.0;">
						<img src="${pageContext.request.contextPath}/img/logo-img.png" style="width: 30px; height: 30px;">
					</li>
					<li class="h-100 float-left mx-2">
						<span style="font-size: 35px; font-family: 'Cafe24Oneprettynight'; color: #4C4C4C;">PIC	SELL</span></li>
				</a>
			</ul>
		</div>
		<c:choose>
			<c:when test="${loginInfo == null and adminInfo == null }">
				<div class="col-7 col-md-6 col-lg-5 col-xl-4 p-0 h-100 float-right text-right">
					<ul class="h-100 float-right mx-3 my-0" style="list-style: none;">
						<li class="h-100 float-left mx-2 mx-sm-3 mx-md-4" style="line-height: 3.0;">
							<a href="${pageContext.request.contextPath}/contest/contest.do" class="text-dark">공모전</a>
						</li>
						<li class="h-100 float-left mx-2 mx-sm-3 mx-md-4" style="line-height: 3.0;">
							<a href="${pageContext.request.contextPath}/writer/writer.do" class="text-dark">작가 홈</a>
						</li>
						<li class="h-100 float-left mx-2 mx-sm-3 mx-md-4" style="line-height: 3.0;">
							<a id="gotologin" href="#" class="text-dark explanation" data-toggle="modal" data-target="#Login">로그인</a>
						</li>
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
											<input type="text" class ="loginInput" placeholder="Input Your ID" name="loginId" id="loginId" style="font-family: 'Dovemayo-Medium';">
											<br>
											<input type="password" class ="loginInput" placeholder="Input Your PW" name="loginPw" id="loginPw" style="font-family: 'Dovemayo-Medium';">
											<br>
											<div id="info" class="pt-2" style="font-size: 16px; display: none">잘못된 아이디 또는 잘못된 패스워드입니다.</div>
											<div class="form-group p-0 save" style="width: 300px;">
												<div class="form-check p-0 m-0" style="width: 130px;">
													<input class="form-check-input" type="checkbox" value="" id="saveId" style="cursor: pointer;" required>
													<label class="form-check-label" for="saveId" style="cursor: pointer;">아이디 저장</label>
												</div>
											</div>
											<input type="button" id="login" value="로그인">
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
					</ul>
				</div>
			</c:when>
			<c:when test="${adminInfo != null }">
				<div class="col-7 col-md-6 col-lg-5 col-xl-4 p-0 h-100 float-right text-right">
					<ul class="h-100 float-right mx-3 my-0" style="list-style: none;">
						<li class="h-100 float-left mx-2 mx-sm-3 mx-md-4" style="line-height: 3.0;">
							<a href="${pageContext.request.contextPath}/contest/contest.do" class="text-dark">공모전</a>
						</li>
						<li class="h-100 float-left mx-2 mx-sm-3 mx-md-4" style="line-height: 3.0;">
							<a href="${pageContext.request.contextPath}/writer/writer.do" class="text-dark">작가 홈</a>
						</li>
						<li class="h-100 float-left mx-2 mx-sm-3 mx-md-4" style="line-height: 3.0;">
							<a href="#" class="text-dark explanation" data-toggle="modal" data-target="#AdminInfo">내 정보</a>
						</li>
						<div class="modal fade" id="AdminInfo" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-slideout" role="document" style="max-width: 350px; left: 17px;">
								<div class="modal-content px-2">
									<div class="modal-body m-0">
										<div class="w-100" style="height: 50px;">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="w-100 text-left" style="font-family: 'Cafe24Oneprettynight';">
											<h5 class="text-center" style="font-size: 22px;">${adminInfo }님<br>환영합니다
											</h5>
											<hr>
											<div class="row my-2" style="font-size: 20px;">
												<div class="col-12 mb-2">
													<a href="#" style="color: black; text-decoration: none;">관리자 페이지</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="#" style="color: black; font-size: 16px; text-decoration: none;">관리자 정보 조회</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="member/manage.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 조회</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/img_up/NoList" style="color: black; font-size: 16px; text-decoration: none;">이미지 심사/업로드 </a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/contest/check.do" style="color: black; font-size: 16px; text-decoration: none;">공모전 심사/업로드 </a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/money/admin_point.do" style="color: black; font-size: 16px; text-decoration: none;">회원 포인트 내역 </a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/money/admin_deal.do" style="color: black; font-size: 16px; text-decoration: none;">회원 거래 내역 </a>
												</div>
											</div>
											<hr>
											<div class="row my-2" style="font-size: 20px;">
												<div class="col-12 mb-2">
													<a href="#" style="color: black; text-decoration: none;">커뮤니티</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="#" style="color: black; font-size: 16px; text-decoration: none;">공지사항</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="#" style="color: black; font-size: 16px; text-decoration: none;">편집의뢰게시판</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="#" style="color: black; font-size: 16px; text-decoration: none;">작품의뢰게시판</a>
												</div>
											</div>
											<hr>
											<div class="row my-2" style="font-size: 20px;">
												<div class="col-12">
													<a href="${pageContext.request.contextPath}/honor/inserthonor.do" style="color: black; text-decoration: none;">명예의전당 등록</a>
												</div>
												<hr>
											</div>
											<hr>
											<div class="row my-4 text-center" style="font-size: 20px;">
												<div class="col-12">
													<a id="logout" href="#" class="btn" style="width: 150px; border: 1px solid darkgray; border-radius: 10px; background-color: white;">로그아웃</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-7 col-md-6 col-lg-5 col-xl-4 p-0 h-100 float-right text-right">
					<ul class="h-100 float-right mx-3 my-0" style="list-style: none;">
						<li class="h-100 float-left mx-2 mx-sm-3 mx-md-4" style="line-height: 3.0;">
							<a href="${pageContext.request.contextPath}/contest/contest.do" class="text-dark">공모전</a>
						</li>
						<li class="h-100 float-left mx-2 mx-sm-3 mx-md-4" style="line-height: 3.0;">
							<a href="${pageContext.request.contextPath}/writer/writer.do" class="text-dark">작가 홈</a>
						</li>
						
						<%-- 내 정보 modal창 --%>
						<li class="h-100 float-left mx-2 mx-sm-3 mx-md-4" style="line-height: 3.0;">
							<a href="#" class="text-dark explanation" data-toggle="modal" data-target="#MyInfo" id="top_money">내 정보</a>
						</li>
				
						<div class="modal fade" id="MyInfo" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-slideout" role="document" style="max-width: 350px; left: 17px;">
								<div class="modal-content px-2">
									<div class="modal-body m-0">
										<div class="w-100" style="height: 45px;">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="w-100 text-left" style="font-family: 'Cafe24Oneprettynight';">
											<h5 class="text-center" style="font-size: 22px;">${loginInfo }님<br>환영합니다 </h5>
											<hr>
											<div class="row my-2" style="font-size: 18px;">
												<div class="col-4">내 포인트</div>
												<div class="col-5 text-right" id="top_point"></div>
											</div>
											<div class="row my-2" style="font-size: 18px;">
												<div class="col-4">작가 수익금</div>
												<div class="col-5 text-right" id="top_profit"></div>
											</div>
											<div class="row my-3 text-center" style="font-size: 20px;">
												<div class="col-12">
													<a href="${pageContext.request.contextPath}/money/charge.do" class="btn py-0" style="width: 150px; border: 1px solid darkgray; border-radius: 10px; background-color: white;">포인트 충전하기</a>
												</div>
											</div>
											<hr>
											<div class="row my-2" style="font-size: 20px;">
												<div class="col-12 mb-2">
													<a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; text-decoration: none;">마이 페이지</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/myInfo/myInfo.do" style="color: black; font-size: 16px; text-decoration: none;">회원 정보 조회</a>
												</div>
											</div>
											<hr>
											<div class="row my-2" style="font-size: 20px;">
												<div class="col-12 mb-2">
													<a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; text-decoration: none;">작가 페이지</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/writer/writerpage?nickname=${sessionScope.loginInfo}" style="color: black; font-size: 16px; text-decoration: none;">작가 정보 조회</a>
												</div>
											</div>
											<hr>
											<div class="row my-2" style="font-size: 20px;">
												<div class="col-12 mb-2">
													<a href="${pageContext.request.contextPath}/img_up/acceptpage.do" style="color: black; text-decoration: none;">심사/승인 내역</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/img_up/acceptpage.do" style="color: black; font-size: 16px; text-decoration: none;">이미지 심사/승인 내역</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/contest/contestchecking.do" style="color: black; font-size: 16px; text-decoration: none;">공모전 심사/승인 내역</a>
												</div>
											</div>
											<hr>
											<div class="row my-2" style="font-size: 20px;">
												<div class="col-12 mb-2">
													<a href="${pageContext.request.contextPath}/notice/notice.do" style="color: black; text-decoration: none;">커뮤니티</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/notice/notice.do" style="color: black; font-size: 16px; text-decoration: none;">공지사항</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/editNotice/notice.do" style="color: black; font-size: 16px; text-decoration: none;">편집의뢰게시판</a>
												</div>
												<div class="col-12 sideMenu">
													<a href="${pageContext.request.contextPath}/pieceNotice/notice.do" style="color: black; font-size: 16px; text-decoration: none;">작품의뢰게시판</a>
												</div>
											</div>
											<hr>
											<div class="row my-2" style="font-size: 20px;">
												<div class="col-12">
													<a href="${pageContext.request.contextPath}/event/attendance_check.do" style="color: black; text-decoration: none;">출석체크</a>
												</div>
											</div>
											<hr>											
											<div class="row my-4 text-center" style="font-size: 20px;">
												<div class="col-12">
													<a href="#" class="btn" id="logout1" style="width: 150px; border: 1px solid darkgray; border-radius: 10px; background-color: white;">로그아웃</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
								<script>
						$("#top_money").on("click", function(){
							$.ajax({
								url : "${pageContext.request.contextPath}/money/top_money.do",
								type : "post",
								dataType : "json",
							}).done(function(data){
								var my_point = data.my_point;
								var my_profit = data.my_profit;							
								$("#top_point").html(my_point+"원");
								$("#top_profit").html(my_profit+"원");
							}).fail(function(data){
								alert("데이터를 받아오는데 실패했습니다.");
							})
						})
						</script>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	

</body>
</html>