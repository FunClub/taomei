var emailMessage;//消息通知对象
var insertEmail;//添加到数据库的对象
var content;//私信内容对象;
var from_id;//发件人ID
var to_id;//收件人ID
var headPicture;//我的头像
var nickName;//我的昵称
var emailArea;//写信的文本域
$(function(){
	initWriteEmail();
	addWriteEmailEvent();
});

//初始化写信
function initWriteEmail(){
	from_id = $('#from_id');
	to_id = $('#to_id');
	headPicture = $('#headPicture');
	nickName = $('#myNickName');
	emailArea = $('#writeArea');
}
//添加写信事件
function addWriteEmailEvent(){
	$('#vipSend').click(function(){
		insertNewEmail();//如果添加成功就通知对方	
		emailArea.val("");
	});
	$('#writeHelp .help').click(function(){
		emailArea.append($.trim($(this).text()));
	});
}

//将这封信存入数据库
function insertNewEmail(){
	content = {
			"users_id":from_id.val(),
			"content":emailArea.val(),
			"time":""
	};
	var contentArray = new Array();
	contentArray.push(content);
	var contentStr = JSON.stringify(contentArray);
	insertEmail = {
			"from_emid":from_id.val(),
			"to_emid":to_id.val(),
			"content":contentStr,
			"contentSize":1,
			"fromState":true,
			"toState":false,
			"emailTime":""
	};
	var emailStr = JSON.stringify(insertEmail);
	UpdateDWR.insertEmail(emailStr,function(result){
		if(result){
			preSendMessage();
			alert("私信发送成功，已通过消息通知对方");
		}
	
	});
	
}
//通知对方，我发了私信给TA
function preSendMessage(){
	emailMessage={
			"from_id":from_id.val(),
			"to_id":to_id.val(),
			"headPicture":headPicture.val(),
			"sex":$('#mySex').val(),
			"nickName":nickName.val(),
			"type":3
	}
	var meailStr = JSON.stringify(emailMessage);
	sendMessage(meailStr);
}
