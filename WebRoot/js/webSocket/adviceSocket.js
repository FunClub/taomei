var webSocket;
var browseTimer;//标题闪动计时器
var browseTitleText;//html文档原始title内容
var browseTitle
$(function(){
	initWebsocket();
	openWebSocket();
    
});

//打开webSocket通道
function openWebSocket(){
	var target = "ws://localhost:8080/taomei/advice/"+$('#from_id').val();
	if ('WebSocket' in window) {
		webSocket = new WebSocket(target);
    } else if ('MozWebSocket' in window) {
    	webSocket = new MozWebSocket(target);
    } else {
        alert('WebSocket is not supported by this browser.');
        return;
    }
	webSocket.onmessage = function(event){showAlertMessage(event);}
}

//初始化websocket
function initWebsocket(){
	browseTitle = $('title');
	browseTitleText = browseTitle.text();
	
}
function showAlertMessage(event){
	var messageObj = JSON.parse(event.data);
	$('#message_head').attr('src',messageObj.headPicture);
	$('#messageNickName').text(messageObj.nickName);
	stopBrowserFlash();
	var sex;
	if(messageObj.sex=="女"){
		sex="她";
	}else{
		sex="他";
	}
	if(messageObj.type=="1"){//查看资料
		$('#messageText').text('查看了你的资料!');
		$('#messageOpre1').text("给"+sex+"写信");
		$('#messageOpre1').attr("href","writeEmailAction.action?users_id="+messageObj.from_id);
		browserFlash(messageObj.nickName+"查看了你的资料!")
	}else if(messageObj.type=="2"){//关注
		$('#messageText').text('关注了你!');
		$('#messageOpre1').text("关注"+sex);
		browserFlash(messageObj.nickName+"关注了你!");
		$('#messageOpre1').attr("href","emailListAction.action?users_id="+messageObj.from_id+"&spaceType=email");
	}else if(messageObj.type=="3"){//给你发了私信
		$('#messageText').text('给你发了一封信!');
		$('#messageOpre1').text("查看信箱");
		browserFlash(messageObj.nickName+"给你发了一封信!");
		$('#messageOpre1').attr("href","emailListAction.action?users_id="+messageObj.from_id+"&spaceType=email");
	}else if(messageObj.type=="4"){//回复了你的私信
		$('#messageText').text('回复了你的私信!');
		$('#messageOpre1').text("查看本条私信");
		browserFlash(messageObj.nickName+"回复了你的私信!");
		$('#messageOpre1').attr("href","readEmailAction.action?users_id="+messageObj.from_id+"&email_id="+messageObj.email_id);
	}else if(messageObj.type=="5"){
		$('#messageText').text('已经添加你为好友!');
		$('#messageOpre1').text("进入畅聊");
		browserFlash(messageObj.nickName+"添加你为好友!");
		$('#messageOpre1').attr("href","chatAction.action");
	}
	$('#messageOpre2').text("查看资料");
	$('#messageOpre2').attr("href","showOneAction.action?users_id="+messageObj.from_id);
	$('#messageAlert').show(600);	
}

//发送消息
function sendMessage(message){
	if(webSocket!=null){
		webSocket.send(message);
	}
}
//浏览器标题闪动
function browserFlash(text){
	var i=0;
	browseTimer=setInterval(function(){
		if(i%2==0){
			browseTitle.text(text);
		}else{
			browseTitle.text(browseTitleText);
		}
		i++;
	},1000);
}
function stopBrowserFlash(){
	clearInterval(browseTimer);
	browseTitle.text(browseTitleText);
	$('#messageAlert').hide(600);
}