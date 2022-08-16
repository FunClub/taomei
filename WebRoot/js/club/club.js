var sendTalkContent;//发表新话题的内容DIV
var lastNewTalk;//上次点击的最新话题分页
var lastHotTalk;//上次点击的最热话题分页
var lastse;
var users_id;//我的ID
var searchResult;//搜索结果DIV
$(function(){
	initClub();
	addClubEvent();
});

//
function initClub(){
	sendTalkContent = $('#sendTalkContent');
	users_id = $('#users_id').val();
	lastNewTalk = $('#newTalkPage').children('.active');
	lastHotTalk = $('#hotTalkPage').children('.active');
	searchResult = $("#searchResult");
}
function addClubEvent(){
	$('#searchTagDiv .searchTag').click(function(){/*标签搜索*/
		$(this).toggleClass('searchTagActive');
	});
	$('#selectTag .searchTag').click(function(){/*标签搜索*/
		$(this).toggleClass('searchTagActive');
	});
	$('#allFace img').click(function(){//显示选择的表情
		sendTalkContent.append("<img class='sendTalkFace' src="+$(this).attr("src")+">");
		$('#allFace').toggle();
	});
	$('#upLoadImgInput').change(function(){//上传图片
		uploadImg();
	});
	$('#newTalkPage a').click(function(){
		getNewPointTalk($(this).text(),$('#newTalk .allTalk'));
		var li=$(this).parent();
		lastNewTalk.removeClass("active");
		li.addClass("active");
		lastNewTalk=li;
	});
	
	$('#hotTalkPage a').click(function(){
		getHotPointTalk($(this).text(),$('#hotTalk .allTalk'));
		var li=$(this).parent();
		lastHotTalk.removeClass("active");
		li.addClass("active");
		lastHotTalk=li;
	});
	searchResult.mouseleave(function(){
		$(this).hide(200);
	})
}

//搜索话题
function searchTalk(){
	searchResult.html("");
	var key = $('#searchInput').val();
	var tagArray = new Array();
	$('#searchTagDiv .searchTagActive').each(function(){
		tagArray.push($(this).text());
	});
	if(key!=""||tagArray.length>0){
		var tag = JSON.stringify(tagArray);
		var searchTalkObj={
				"key":key,
				"tag":tag
		}
		var searchTalk = JSON.stringify(searchTalkObj);
		
		SearchDWR.searchTalk(searchTalk,function(result){
			var talks = JSON.parse(result);
			
			var html;
			var talk;
			
			for(var i=0;i<talks.length;i++){
				talk = talks[i];
				html = "<a class=searchTalk href=showOneTalkAction.action?talk_id="+talk.talk_id+" target=_blank>"+talk.talkTitle+"</a>";
				searchResult.append(html);
				searchResult.show(200);
			}
		});
	}
}

//打开编写话题的便签页
function openSendTalk(){
	$('#clubTabs .active').removeClass('active');
	$('.tab-content .active').removeClass('active in');
	$("#clubTabs a:eq(3)").parent().addClass('active');
	$('#sendTalk').addClass("active in");
}

//获得指定页的话题
function getNewPointTalk(page,content){
	content.children(".talkDiv").remove();
	page=(parseInt(page)-1)*6;
	var pageObj=content.children('#newTalkPage');
	var html;
	SearchDWR.getPointNewTalk(page,function(result){
		var list=JSON.parse(result);
		var talk;
		var imgs;
		for(var i=0;i<list.length;i++){
			talk=list[i];
			imgs = JSON.parse(talk.talkImg);
			html="<div class='talkDiv'>"+
					"<div class='talkHeadDiv'>"+
						"<a href=showOneAction.action?users_id="+talk.users_id+"target='_blank'><img src="+talk.headPicture+" class='talkHead'></a>"+
					"</div>"+
					"<p class='talkTitle'><a class='talkA' href='showOneTalkAction.action?talk_id="+talk.talk_id+"' target='_blank'>"+talk.talkTitle+"</a></p>";
			if(talk.talkContent!=""){
				html+="<p class='talkSimpleContent'>"+talk.talkContent+"</p>";
			}
			if(imgs.length>0){
				var html1="<table class='talkImgTable'><tr>";
				var html2="";
				for(var c=0;c<imgs.length;c++){
					html2+="<td><img src="+imgs[c]+" class='talkImg'></td>"
					
				}						
				var html3="</tr></table>";
				html=html+html1+html2+html3;
				
			}
			html+="<span class='talkTime'>发布于"+talk.talkTime+" </span>"+
				  "<div class='talkInfo'>"+
					  "<span><img src=images/club/seeCount.png>&nbsp;"+talk.talkSeeCount+"</span>"+
					  "<span><img src=images/club/discussCount.png>&nbsp;"+talk.talkDiscussCount+"</span>"+
				  "</div>"+
              "</div>";
			
			pageObj.before(html);
		}
		
	});
	$(window).scrollTop(0);
}

//获得指定页的话题
function getHotPointTalk(page,content){
	content.children(".talkDiv").remove();
	page=(parseInt(page)-1)*6;
	var pageObj=content.children('#hotTalkPage');
	var html;
	SearchDWR.getPointHotTalk(page,function(result){
		var list=JSON.parse(result);
		var talk;
		var imgs;
		for(var i=0;i<list.length;i++){
			talk=list[i];
			imgs = JSON.parse(talk.talkImg);
			html="<div class='talkDiv'>"+
					"<div class='talkHeadDiv'>"+
						"<a href=showOneAction.action?users_id="+talk.users_id+"target='_blank'><img src="+talk.headPicture+" class='talkHead'></a>"+
					"</div>"+
					"<p class='talkTitle'><a class='talkA' href='showOneTalkAction.action?talk_id="+talk.talk_id+"' target='_blank'>"+talk.talkTitle+"</a></p>";
			if(talk.talkContent!=""){
				html+="<p class='talkSimpleContent'>"+talk.talkContent+"</p>";
			}
			if(imgs.length>0){
				var html1="<table class='talkImgTable'><tr>";
				var html2="";
				for(var c=0;c<imgs.length;c++){
					html2+="<td><img src="+imgs[c]+" class='talkImg'></td>"
					
				}						
				var html3="</tr></table>";
				html=html+html1+html2+html3;
				
			}
			html+="<span class='talkTime'>发布于"+talk.talkTime+" </span>"+
				  "<div class='talkInfo'>"+
					  "<span><img src=images/club/seeCount.png>&nbsp;"+talk.talkSeeCount+"</span>"+
					  "<span><img src=images/club/discussCount.png>&nbsp;"+talk.talkDiscussCount+"</span>"+
				  "</div>"+
              "</div>";
			
			pageObj.before(html);
		}
		
	});
	$(window).scrollTop(0);
}
//发表话题
function sureSendTalk(){
	var talkTitle = $('#sendTalkTitle').val();
	var talkContent=$('#sendTalkContent').html();
	if(talkTitle!=""||talkContent!=""){
		var talkTagArray = new Array();
		$('#selectTag .searchTagActive').each(function(){
			talkTagArray.push($(this).text());
		});
		var talkTag=JSON.stringify(talkTagArray);
		var talkImgArray = new Array();
		$('#preUpLoadTable .preUploadImg').each(function(){
			talkImgArray.push($(this).attr("src"));
		});
		var talkImg = JSON.stringify(talkImgArray);
		var talkContent=$('#sendTalkContent').html();
		var insertTalk={
			"users_id":users_id,
			"talkTitle":talkTitle,
			"talkTag":talkTag,
			"talkImg":talkImg,
			"talkContent":talkContent
		}
		UpdateDWR.insertTalk(JSON.stringify(insertTalk),function(result){
			if(result){
				alert("success");
			}else{
				alert("failed");
			}
		});
	}else{
		alert("标题、内容不能为空！");
	}
	
	
}
/*上传图片*/
function uploadImg(){
	if($('.preUploadImg').size()<5){
		var file = dwr.util.getValue("upLoadImgInput");
		var fileName = file.value;
		UpdateDWR.upLoadImg(file,fileName,function(result){
			var fristTd = $('#preUpLoadTable td:eq(0)');
			fristTd.before("<td><img class='preUploadImg' src="+result+"></td>");
			$('.preUploadImg').click(function(){
				var img = $(this);
				UpdateDWR.deleteImg(img.attr("src"),function(result1){
					if(result1){
						img.parent().remove();
					}
				});
			});
			$('#upLoadImgInput').change(function(){//上传图片
				uploadImg();
			});
		});
	}else{
		alert("最多只能上传5张");
	}
	
}
