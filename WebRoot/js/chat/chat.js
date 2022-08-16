var lastShowContent;//上次显示的搜索内容;
var lastClickTab;//上次点击的选项卡;
var lastClickFriend;//上次点击的好友DIV
var chatID;//当前正在交谈的用户ID
var messageContent;//聊天面板
var fristChatContent;//最近消息面板
var writeMessage;//写消息的DIV
var allFace;//所有表情DIV
var users_id;//我的ID
var myhead;//我的头像
var nickName;//我的昵称
var findChatCount=0;//寻找话题的计数器
var chatSocket;
var browseTimer;//标题闪动计时器
var browseTitleText;//html文档原始title内容
var browseTitle;//

$(function() {
	initChat();
	initChatsocket();
	openChatSocket();
	addChatEvent();
});
// 初始化Chat
function initChat() {
	lastClickTab=$('.chatTab:eq(0)');
	lastShowContent = $('#fristChatContent');
	fristChatContent  = $('#fristChatContent');
	writeMessage = $('#writeMessage');
	allFace = $('#allFace');
	users_id=$('#users_id').val();
	messageContent=$('#messageContent');
	myhead = $('#myhead').attr("src");
	nickName = $('#myName').text();
}

// 添加事件
function addChatEvent() {	
	scrollChange();//列表滚动条变化
	tabChange();//选项卡切换	
	friendBGChange();//列表背景切换
	faceEvent();//表情发送图片相关事件
	
}

//表情相关事件
function faceEvent(){
	$('#selectFace').click(function(){
		if(allFace.css("display")=="block"){
			allFace.hide();
		}else{
			allFace.show(300);
		}
	});
	writeMessage.click(function(){
		if(allFace.css("display")=="block"){
			allFace.hide();
		}
	});
	allFace.focusout(function(){
		allFace.hide();
		
	});
	$('#allFace img').click(function(){
		writeMessage.append("<img style='margin-left:2px;margin-right:2px' src="+$(this).attr("src")+">");
	});
	$("#upLoadImgInput").change(function(){
		sendImgMessage();
	});
}
//发送图片
function sendImgMessage(){
	var file = dwr.util.getValue("upLoadImgInput");
	var fileName = file.value;
	UpdateDWR.sendImg(file,fileName,function(result){
		writeMessage.append("<img class='sendImg' src="+result+">");
	});
	$('#upLoadImgInput').change(function(){
		sendImgMessage();
	});
}
//发送普通消息包含表情,图片
function sendCommMessage(){
	allFace.hide();
	var str=$('#writeMessage').html();
	var message={
			"from_id":users_id,
			"to_id":chatID,
			"message":str,
			"nickName":nickName,
			"headPicture":myhead,
			"time":"",
			"type":"1"
	};
	var messageStr = JSON.stringify(message);
	var html = "<div class='rightMessage'>"+
					"<div class='meHeaddDiv'>"+
						"<img  class='meHead' src="+myhead+">"+
					"</div>"+
					"<div class='rightTriangle'></div>"+
					"<div class='rightMessageText'>"+str+"</div>"+
				"</div>";
	messageContent.append(html);
	$('#writeMessage').html("");
	sendMessage(messageStr);
	var saveMessage = {
			"from_id":message.from_id,
			"to_id":message.to_id,
			"chatText":message.message,
			"messageType":message.type,
			"state":"未读"
	}
	var messageStr = JSON.stringify(saveMessage);
	UpdateDWR.updateMessage(messageStr,function(result){
		
	});
	messageContent.scrollTop(100000);
}
//更新聊天内容
function showChatMessage(event){
	var message = JSON.parse(event.data);
	updateNearMessage(message);
	var state;
	if(chatID==message.from_id){
		updateChatContent(message);
		updateMessageState();
		
	}	
}

//更新我和某个好友的消息状态
function updateMessageState(){
	var messageState = {
			"users_chid1":users_id,
			"users_chid2":chatID,
			"target_id":users_id
	};
	var messages = JSON.stringify(messageState);
	UpdateDWR.updateMessageState(messages,function(result){
		
	});
	
}
//寻找话题
function findChat(){
	if(findChatCount%3==0){
		writeMessage.html("萨瓦迪卡,我看你挺投缘的,能给我你的微信吗？<img src='images/face/[坏笑].gif' class='sendMessage'>");
	}else if(findChatCount%3==1){
		writeMessage.html("hello,我们做个朋友吧？约一个!<img src='images/face/[色].gif' class='sendMessage'>");
	}else if(findChatCount%3==2){
		writeMessage.html("你好,能聊聊吗?我想和你做朋友！<img src='images/face/[龇牙].gif' class='sendMessage'>");
	}
	findChatCount++;
}
//更新最近消息面板的内容
function updateNearMessage(message){
	var hasFriendDiv=false;
	var friendDiv;
	var fristNear = $('#fristChatContent .friendDiv:eq(0)');
	var html;
	if(message.type="1"){
		$('#fristChatContent .friendDiv').each(function(){
			if($(this).attr("users_id")==message.from_id){
				hasFriendDiv=true;
				friendDiv=$(this);
				return false;
			}
		});
		if(hasFriendDiv){
			friendDiv.children(".nearMessage").html(message.message);
			friendDiv.children(".messageTime").text(message.time);
			fristNear.before(friendDiv);
			
			if(chatID!=message.from_id){
				var messageCount=fristNear.children(".messgaeCount");
				var count = messageCount.text().substring(0,1); 
				if(count==""){
					count=0;
				}
				messageCount.text(parseInt(count)+1+"条未读");
			}
		}else{
			if(chatID==message.from_id){
				html="<div class='friendDiv' users_id="+message.from_id+">"+
								"<div class='frienHeaddDiv'>"+
									"<img class='friendHead' src="+message.headPicture+">"+
								"</div>"+
								"<span class='friendName'>"+message.nickName+"</span><span class='messgaeCount label label-warning'></span><br>"+
								"<span  class='nearMessage'>"+message.message+"</span><span class='messageTime'>"+message.time+"</span>"+
						"</div>";
			}else{
				html="<div class='friendDiv' users_id="+message.from_id+" headPicture="+message.headPicture+" nickName="+message.nickName+">"+
							"<div class='frienHeaddDiv'>"+
								"<img class='friendHead' src="+message.headPicture+">"+
							"</div>"+
							"<span class='friendName'>"+message.nickName+"</span><span class='messgaeCount label label-warning'>1条未读</span><br>"+
							"<span  class='nearMessage'>"+message.message+"</span><span class='messageTime'>"+message.time+"</span>"+
					  "</div>";
			}
			if(fristNear.length>0){
				fristNear.before(html);
			}else{
				fristChatContent.append(html);
			}
			messageContent.scrollTop(100000);
			friendBGChange();
		}
	}
}
//更新当前聊天面板的内容(对方发的)
function updateChatContent(message){
	var html = "<div class='leftMessage'>"+
					"<div class='meHeaddDiv'>"+
						"<img  class='meHead' src="+$('#fiHead').attr("src")+">"+
					"</div>"+
					"<div class='leftTriangle'></div>"+
					"<div class='leftMessageText'>"+message.message+"</div>"+
			   "</div>";
	messageContent.append(html);
	messageContent.scrollTop(100000);
}
//点击用户后显示聊天内容
function showChatContent(headPicture,nickName){
	$('#fiHead').attr("src",headPicture);
	$('#fiNickName').text(nickName);
	SearchDWR.getHeart(chatID,function(result){
		$('#heartInfo').text(result.substring(0,40)+"......");
	});
}

//列表背景切换
function friendBGChange(){
	$('.friendDiv').click(function(element){
		$('#unSelectChat').hide();
		$('#allRight').show();
		if(lastClickFriend!=undefined){
			lastClickFriend.css({
				"background":"rgb(250,250,250)",
			});
		}
		$(this).css({
			"background":"rgb(230,230,230)"
		});
		
		lastClickFriend=$(this);
		chatID=$(this).attr("users_id");
		$('#friendInfo a').attr("href","showOneAction.action?users_id="+chatID+"");
		showChatContent($(this).attr("headPicture"),$(this).attr("nickName"));
		messageContent.html("");
		if($(this).children(".messgaeCount").text()!=""){
			updateMessageState();
			$(this).children(".messgaeCount").text("");
		}
		SearchDWR.getMessage(chatID,users_id,function(result){
			showDBMessage(result);
			
		});
	});
}
//显示聊天记录(从数据库中)
function showDBMessage(messages){
	
	var message = JSON.parse(messages);
	var messageObj;
	var html;
	for(var i=0;i<message.length;i++){
		messageObj=message[i];
		if(messageObj.from_id==users_id){
			html= "<div class='rightMessage'>"+
						"<div class='meHeaddDiv'>"+
							"<img  class='meHead' src="+myhead+">"+
						"</div>"+
						"<div class='rightTriangle'></div>"+
						"<div class='rightMessageText'>"+messageObj.chatText+"</div>"+
				"</div>";
		}else{
			html = "<div class='leftMessage'>"+
						"<div class='meHeaddDiv'>"+
							"<img  class='meHead' src="+$('#fiHead').attr("src")+">"+
						"</div>"+
						"<div class='leftTriangle'></div>"+
						"<div class='leftMessageText'>"+messageObj.chatText+"</div>"+
					"</div>";
		}
		messageContent.append(html);
	}
	messageContent.scrollTop(100000);
}
//选项卡切换
function tabChange(){
	var nowShowContent;
	$('.chatTab').each(function(index){
		$(this).click(function(){
			$(this).addClass("chatTabActive");
			lastClickTab.removeClass("chatTabActive");
			lastShowContent.slideUp(1);
			lastClickTab = $(this);
			nowShowContent=$("#chatContent .chatContent:eq("+index+")");
			nowShowContent.slideDown(1);
			lastShowContent=nowShowContent;
		});
	});
}
//列表滚动条
function scrollChange(){
	$('.scrollContent').mouseenter(function() {
		$(this).css({
			"overflowY" : "auto"
		});
		
	});
	$('.scrollContent').mouseleave(function() {
		$(this).css({
			"overflowY" : "hidden"
		});
			
	});
}

//打开chatSocket通道
function openChatSocket(){
	var target = "ws://localhost:8080/taomei/chat/"+$('#users_id').val();
	if ('WebSocket' in window) {
		chatSocket = new WebSocket(target);
    } else if ('MozWebSocket' in window) {
    	chatSocket = new MozWebSocket(target);
    } else {
        alert('WebSocket is not supported by this browser.');
        return;
    }
	chatSocket.onmessage = function(event){showChatMessage(event);}
}

//初始化chatsocket
function initChatsocket(){
	browseTitle = $('title');
	browseTitleText = browseTitle.text();
	
}


//发送消息
function sendMessage(message){
	if(chatSocket!=null){
		chatSocket.send(message);
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
	
}