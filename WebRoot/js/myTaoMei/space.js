var users_id;//用户ID
var emailTable;//私信表格
var lastPage;//上一页
var isDeleteAble=false;//是否勾选了删除私信的复选框
var spaceType;
var visitorObj;//访客列表对象
var attentionObj;//关注对象
var allAttentionDiv;//所有关注的DIV
$(function(){
	initSpace();
	addSpaceEvent();
})

//初始化space
function initSpace(){
	spaceType = $('#spaceType').val();
	visitorObj=JSON.parse($('#visitorList').text());
	attentionObj=JSON.parse($('#attentionList').text());
	allAttentionDiv = $('#allAttentionDiv');
	initSpaceTab();
	users_id=$('#users_id').val();
	emailTable=$('#emailTable');
	lastPage=$('#emailPagination .active');
	$('#deletePoint').dialog({  //初始化删除提示对话框 
	    title: '删除警告',    
	    width: 300,    
	    height: 150, 
	    top:$('#emailPagination').offset().top-200,
	    left:$('#emailPagination').offset().left-100,
	    closed: false,    
	    shadow:true, 
	    modal: true   
	});    
	$('#deletePoint').window('close');
}



//显示space的选项卡
function initSpaceTab(){
	if(spaceType=="email"){
		initAttention();
		initVisitor();
	}else if(spaceType=="visitor"){
		initVisitor();
		initAttention();
	}else if(spaceType=="attention"){
		initAttention();
		initVisitor();
	}
	showAnySpace(spaceType);
}
//初始化我的关注
function initAttention(){
	var html;
	var obj;
	for(var i=0;i<attentionObj.length;i++){
		obj= attentionObj[i];
		html="<div class='attentionDiv'>"+
				"<a  target='_blank' href='showOneAction.action?users_id="+obj.attention_id+"''><img src="+obj.headPicture+" class='atHead'></a>"+
				"<a  target='_blank' href='showOneAction.action?users_id="+obj.attention_id+"' style='color:rgb(237,79,163);'><p class='atNickName'>"+obj.nickName+"</p></a>"+
				"<span class='atInfo'>"+obj.city+"-"+obj.town+"&nbsp;&nbsp;"+obj.age+"岁&nbsp;&nbsp;"+obj.height+"cm</span>"+
				"<p class='btHeartInfo'>内心独白："+obj.introduction.substring(0,90)+"...</p>"+
				"<a target='_blank' href='writeEmailAction.action?users_id="+obj.attention_id+"'><img class='senMessage' src='images/space/sendMessage.png'></a>"+
				"<img class='cancelAttention' src='images/search/cancelAttention.png' onclick='cancelAttention("+obj.attention_id+",$(this).parent())'>"+
			"</div>";
		allAttentionDiv.append(html);
	}
}
//取消关注
function cancelAttention(attention_id,div){
	var attention = {
			"atusers_id":users_id,
			"attention_id":attention_id
	};
	
	var atStr = JSON.stringify(attention);
	UpdateDWR.cancelAttention(atStr,function(result){
		if(result){
			div.remove();
		}else{
			alert("取消关注失败!");
		}
	});
}
//初始化最近访客
function initVisitor(){
	
	var html;
	var visitor;
	var visitorTable=$('#visitorTable');
	var lastTr;
	for(var i=0;i<visitorObj.length;i++){
		visitor=visitorObj[i];
		if(i%5==0){
			html = "<tr>"+
						"<td>"+
							"<div class='visitorInfoDiv'>"+
								"<a target='_black' href='showOneAction.action?users_id="+visitor.visitor_id+"'><img class='visitorHead' src='"+visitor.headPicture+"'/></a>"+
								"<p class='visitorName'>"+visitor.nickName+"</p>"+
								"<p class='visitorTime'>"+visitor.visitorTime+"前</p>"+
							"</div>"+
						"</td>"+	
				   "</tr>";
			visitorTable.append(html);
			lastTr = $('#visitorTable tr:last');
		}else{
			html = "<td>"+
						"<div class='visitorInfoDiv'>"+
							"<a target='_black' href='showOneAction.action?users_id="+visitor.visitor_id+"'><img class='visitorHead' src='"+visitor.headPicture+"'/></a>"+
							"<p class='visitorName'>"+visitor.nickName+"</p>"+
							"<p class='visitorTime'>"+visitor.visitorTime+"前</p>"+
						"</div>"+
					"</td>";
			lastTr.append(html);
		}
	}
			   
}

//显示space对应的选项卡
function showAnySpace(spaceType){
	$("#palTabs a[href='#"+spaceType+"']").parents().addClass("active");
	$("#"+spaceType).addClass("active");
	$("#"+spaceType).addClass("in");	
}

//添加space事件
function addSpaceEvent(){
	$('#emailPagination .emailPage').click(function(){
		showPointEmailList($(this).text());
		lastPage.removeClass("active");
		$(this).parent().addClass("active");
		lastPage=$('#emailPagination .active');
	});
	$("#emailTable .deleteEmail").click(function(){
		$(this).prop("checked",$(this).prop('checked'));
		
	});
			
}

//全选所有私信
function allSelectEmail(){
	$('input[type=checkbox]').prop('checked', $("#allEmailSelect").prop('checked'));
	
}
//是否勾选删除私信的复选框
function isDelete(){	
	$("#emailTable .deleteEmail").each(function(){
		if($(this).prop("checked")){
			isDeleteAble=true;
			return false;
		}
	});
	if(isDeleteAble){
		$('#deletePoint').window('open');
	}
	isDeleteAble=false;
}

//删除选中私信
function deleteEmail(){
	$('#deletePoint').window('close');
	var array = new Array();
	$('#emailTable .deleteEmail').each(function(index){
		if($(this).prop('checked')){
			array.push($(this).next().val());
		}
	});	

	var json = JSON.stringify(array);
	UpdateDWR.deleteEmail(json,function(result){
		if(result){
			window.location.reload();
		}
	});
}
//显示指定页的私信列表
function showPointEmailList(page){
	page=(parseInt(page)-1)*10+1;
	if(page==1){
		page=0;
	}
	var html;
	var stateImg1;
	var stateImg2;
	var you;
	var email;
	
	SearchDWR.getPointListEmail(users_id,page,function(result){
		var emails = JSON.parse(result);
		emailTable.html("");
		for(var i=0;i<emails.length;i++){
			email=emails[i];
			if(email.state){
				stateImg1="<img src='images/myTaoMei/yidu.png' class='emailStateImg'>";
				stateImg2 = "<div class='yiduEmail'></div>"
			}else{
				stateImg1="<img src='images/myTaoMei/weidu.png' class='emailStateImg'>";
				stateImg2="<div class='viewEmail'><a style='color:white' href='readEmailAction.action?users_id="+email.tID+"&email_id="+email.email_id+"'>查看私信</a></div>";
			}
			if(email.you){
				you = "你发出的私信";
			}else{
				you = "给你发来的私信";
			}
			html="<tr>"+
						"<td width='30px'><input type='checkbox' class='deleteEmail'><input type='hidden' value="+email.email_id+"></td>"+
						"<td width='30px'>"+stateImg1+"</td>"+
						"<td width='40px'>" +
							"<div class='emailHeadDiv'>" +
								"<a href='readEmailAction.action?users_id="+email.tID+"&email_id="+email.email_id+"'>"+
									"<img class='emailHead' src="+email.headPicture+">"+
								"</a>"+
							"</div>"+
						"</td>"+
						"<td width='50px'>"+
							"<div class='emailInfoDiv'>"+
								"<p class='emBaseInfo'><a href='readEmailAction.action?users_id="+email.tID+"&email_id="+email.email_id+"'>"+"<span class='emNickName'>"+email.nickName+"</span><span>"+email.age+"岁</span><span>"+email.city+"</span></a></p>"+
								"<p class='emDetaInfo'><a href='readEmailAction.action?users_id="+email.tID+"&email_id="+email.email_id+"'>"+"<span class='emTime'>"+email.emailTime+"前</span><span>"+you+"</span><span>共有</span><span class='emCount'>"+email.contentSize+"</span><span>条消息</span></a></p>"+
							"</div>"+
						"</td>"+
						"<td width='50px'>"+stateImg2+"</td>"+
				"</tr>";
			emailTable.append(html);
		}	
	});
	
	$(window).scrollTop(0);
	
}
