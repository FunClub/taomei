var emailContentArray;
var myID;
var t_id;//他的ID
var email_id;
var writeBackArea;
var showCount=0;
$(function(){
	initReadEmail();
	addReadEmailEvent();
});

function addReadEmailEvent(){
	$('#sureWriteBack').click(function(){
		updateContEmails();
	});
	$('#writeModel').click(function(){
		appendModel();
	});
	$('#writeNo').click(function(){
		appendNo();
	});
}
//模板回复
function appendModel(){
	writeBackArea.val(writeBackArea.val()+"谢谢来信，可以介绍一些你的基本情况吗？如家庭、工作等等");
}
function appendNo(){
	writeBackArea.val(writeBackArea.val()+"非常感谢你的来信。很遗憾，我们的条件不太匹配，愿早日寻找到幸福！");
}
function updateContEmails(){
	var content = {
			"users_id":myID,
			"content":writeBackArea.val(),
			"time":""
	};
	emailContentArray.push(content);
	var contentStr = JSON.stringify(emailContentArray);
	var updateEmail={
			"users_id":t_id,
			"email_id":email_id,
			"content":contentStr,
			"contentSize":emailContentArray.length,
			"emailTime":""
	};
	var emailStr = JSON.stringify(updateEmail);
	UpdateDWR.updateContEmails(emailStr,function(result){
		if(result){
			adviceWriteBack();
			alert("发送成功，私信通过消息通知对方");
			window.location.reload();
			$(window).scrollTop(0);
		}
	});
}

//将我回复的私信通知对方
function adviceWriteBack(){
	
	var emailMessage={
			"from_id":myID,
			"to_id":t_id,
			"headPicture":$('#headPicture').val(),
			"email_id":email_id,
			"sex":$('#mySex').val(),
			"nickName":$('#myNickName').val(),
			"type":4
	}
	var meailStr = JSON.stringify(emailMessage);
	sendMessage(meailStr);
}
//初始化阅读私信
function initReadEmail(){
	myID= base.users_id;
	t_id = $('#t_id').val();
	email_id = $('#email_id').val()
	writeBackArea = $('#writeBackArea');
	
	emailContentArray = JSON.parse($('#oneEmailStr').text());
	showEmail();
}
//显示私信内容
function showEmail(){ 
	var emailLen = emailContentArray.length;
	var newContent = emailContentArray[emailLen-1];
	var ContentId = newContent.users_id;
	var nickName;
	var nameClass;
	
	if(ContentId==myID){
		nickName=base.nickName;
		sex=base.sex;
	}else{
		nickName=$('#nickName').text();
		sex=$('#t_sex').val()
	}
	if(sex=="女"){
		nameClass="emGNickName";
	}else{
		nameClass="emBNickName";
	}
	var newNickName = $('#newNickName');
	newNickName.text(nickName);
	newNickName.addClass(nameClass);
	$("#newEmailContent .emText").text(newContent.content);
	$("#newEmailContent .emTime").text(newContent.time.substring(5));
	if(emailLen>1){
		$("#newEmailContent").after("<p id='moreEmailPoint'>以往私信记录▲</p><div id='allMoreEmail'></div");
		$('#moreEmailPoint').click(function(){
			if(showCount%2==0){
				$('#allMoreEmail').slideUp(300);
				$('#moreEmailPoint').text("以往私信记录▼");
			}else{
				$('#allMoreEmail').slideDown(300);
				$('#moreEmailPoint').text("以往私信记录▲");
			}
			showCount++;
		});
	}
	var html;
	var allMoreEmail = $('#allMoreEmail');
	for(var i=emailLen-2;i>=0;i--){
		var newContent=emailContentArray[i];
		var ContentId = newContent.users_id;
		if(ContentId==myID){
			nickName=base.nickName;
			sex=base.sex;
		}else{
			nickName=$('#nickName').text();
			sex=$('#t_sex').val()
		}
		if(sex=="女"){
			nameClass="emGNickName";
		}else{
			nameClass="emBNickName";
		}
		if(i!=0){
			html="<div class='moreEmail moreEmailBorder'>"+
					"<span class='"+nameClass+"'>"+nickName+"</span><span class='emTime'>"+newContent.time.substring(5)+"</span>"+
					"<p class='emText'>"+newContent.content+"</p>"+
				"</div>";
		}else{
			html="<div class='moreEmail'>"+
			"<span class="+nameClass+">"+nickName+"</span><span class='emTime'>"+newContent.time.substring(5)+"</span>"+
			"<p class='emText'>"+newContent.content+"</p>"+
		"</div>";
		}
		allMoreEmail.append(html);
	}
}