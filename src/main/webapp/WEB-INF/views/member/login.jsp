<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="style.css">
</head>
<style>
    body {
    background: white;
}

form {
    width: 320px;
    padding: 60px 25px 80px;
    margin: 50px auto;
    background-color: yellow;
    opacity: 1;
    display: flex;
    flex-direction: column;
}

svg {
    width: 70%;
    border-radius: 50%;
    background: #fff;
    margin-bottom: 40px;
    align-self: center;
    transform-style: preserve-3d;
}

input {
    font-size: 16px;
    border: 0;
    border-radius: 5px;
    outline: 0;
    padding: 10px 15px;
    margin-top: 15px;
}

@keyframes lookaway-up {
    from {
        transform: rotate3d(.2, 0, -.01, 30deg);
    }

    to {
        transform: rotate3d(.2, -.05, -.01, 30deg);
    }
}
    

@keyframes lookaway-down {
    0% {
        transform: rotate3d(-.2, 0, -.01, 40deg);
    }

    100% {
        transform: rotate3d(-.2, -.05, .01, 40deg);
    }
}
    @keyframes yes {
    0% {
        transform: rotate3d(-.2, 0, -.01, 40deg);
    }

    100% {
        transform: rotate3d(.2, 0, .01, 40deg);
    }
}
    @-webkit-keyframes nono{
        0%{
            transform : rotate3d(-1, -0.648763, -0.324382, 0.31546rad) };
        
        100%{
             transform : rotate3d(-1, 0.870252, 0.435126, 0.31084rad);
        }
  
    }
    

.ears {
    transform-origin: 50% 50% 5px;
}

.eyes {
    transform-origin: 50% 50% -40px;
}

.muzzle {
    transform-origin: 50% 50% -44px;
}

.ears, .eyes, .muzzle {
    transition: transform .5s;
}

.focused {
    transition: transform .1s;
}
  
.look-away .ears,
.look-away .eyes,
.look-away .muzzle {
    transition-duration: .3s;
    animation: 3s infinite alternate;
}

.look-away.up .ears,
.look-away.up .eyes,
.look-away.up .muzzle {
    transform: rotate3d(.2, 0, 0, 20deg) !important;
}

.look-away.down .ears,
.look-away.down .eyes,
.look-away.down .muzzle {
    transform: rotate3d(-.2, 0, 0, 20deg) !important;    
}

.look-away.playing.up .ears,
.look-away.playing.up .eyes,
.look-away.playing.up .muzzle {
    animation-name: lookaway-up;
}

.look-away.playing.down .ears,
.look-away.playing.down .eyes,
.look-away.playing.down .muzzle {
    animation-name: lookaway-down;
}
 td{width:33%}
 a{text-decoration:none;
 color:black;}
    </style>
</head>
<body>
 <form 	oc.do" method="post" id="frm">
        <div id="info" style="position: absolute;left: 42%;top:350px;font-size: 20px;display: none">로그인에 실패했슴다</div>
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
                <line  x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" id="righteye" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        <input type="text" placeholder="email@domain.com" name="id" id="id">
        <input type="password" placeholder="Password" name="pw" id="pw">
        <input type="button" id="login" value="로그인">
        <br>
        <table><tr>
        <td><a href="signup.do">회원가입</a></td>
       <td> <a href="findid.do">아이디찾기</a></td>
        <td><a href="findpw.do">비밀번호찾기</a></td>
        </table>
    </form>

    <script>
    (function(){
    	$("#id").on("focus",function(){
    		 $(".ears").css("transform", "rotate3d(-1, -0.648763, -0.324382, 0.31546rad)");
 		    $(".eyes").css("transform", "rotate3d(-1, -0.648763, -0.324382, 0.31546rad)");
 		    $(".muzzle").css("transform", "rotate3d(-1, -0.648763, -0.324382, 0.31546rad)");
    	})
$("#login").on("click",function(){
	$.ajax({
		url:"loginProc.do",
		type:"post",
		data:{ id:$("#id").val(),
			pw:$("#pw").val()
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
		            $("#info").fadeIn();
			}
	}).fail(function(res){ 
		console.log(res);
		if(res == "서버에러입니다 관리자에게 문의하세요"){
		alert("서버에러입니다 관리자에게 문의하세요");}
	});
});
const ryan = document.querySelector('#ryan');
const face = document.querySelectorAll('.ears, .eyes, .muzzle');
const email = document.querySelector('input[type="password"]');
const password = document.querySelector('input[type="text"]');
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
    event.target.type === 'email' ? lookAway(event) : look(event);
}
        

function reset(event) {
    event.target.classList.remove('focused');
    ryan.classList.remove('playing');

    clearTimeout(timer);
    timer = setTimeout( () => {
        ryan.classList.remove('look-away', 'down', 'up');
        rotate3d(0,0,0,0);
    }, 1 );
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

    rotate3d(x/angle, y/angle, y/angle/2, angle);
}

function lookAway(event) {
    const el = event.target;
    const ryanRect = ryan.getBoundingClientRect();
    const inputRect = el.getBoundingClientRect();
    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top

    ryan.classList.add( 'look-away', distInput < 0 ? 'up' : 'down' );

    clearTimeout(timer);
    timer = setTimeout( () => {
        ryan.classList.add( 'playing' );
    }, 300);
}

fauxInput.appendChild(span);

email.addEventListener( 'focus', focus, false );
email.addEventListener( 'keyup', look, false );
email.addEventListener( 'click', look, false );
email.addEventListener( 'blur', reset, false );

password.addEventListener( 'focus', lookAway, false );
password.addEventListener( 'blur', reset, false );

})();
    </script>
</body>
</html>