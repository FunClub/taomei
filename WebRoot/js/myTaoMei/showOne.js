var infoObj;//整个信息对象
var photoIndex=0;//照片的索引
var photoArray;//照片数组
var users_id;//用户ID
var firstPhotoIndex;//底部第一章照片的索引;
var nowShowPhoto;//当前正在显示的图片
var lastClickImg;//上次点击的相片
$(function(){
	initShowOne();
	if($('#from_id').val()!=$('#to_id').val()){
		webSocket.onopen=function(){
			updateVistor();
		}
		
	}
	
});
function addFriend(){
	var addFriend={
		"users_chid1":$('#from_id').val(),
		"users_chid2":$('#to_id').val(),
	};
	var friendStr = JSON.stringify(addFriend);
	UpdateDWR.addFriend(friendStr,function(result){
		if(result){
			var adviceMessage={
					"from_id":$('#from_id').val(),
					"to_id":$('#to_id').val(),
					"headPicture":$('#headPicture').val(),
					"sex":$('#mySex').val(),
					"nickName":$('#myNickName').val(),
					"type":5
			}
			var adviceMessageStr = JSON.stringify(adviceMessage);
			sendMessage(adviceMessageStr);
			alert("添加成功！");
		}else{
			alert("对方已是你的好友！");
		}
	});
}

function initShowOne(){
	var infoStr=$("#allInfoStr").text();
	infoObj = JSON.parse(infoStr)[0];
	initOneInfo();
}

//初始化Java代码未完成的信息
function initOneInfo(){
	initIDValidate();
	initTag();
	if(infoObj.photo==""){
		photoArray= new Array();
	}else{
		photoArray=JSON.parse(infoObj.photo)[0].list;
	}
	initPhoto(photoArray);
	
	
	
}
//通知对方，我看过TA的资料
function adviceVisited(){
		var adviceMessage={
				"from_id":$('#from_id').val(),
				"to_id":$('#to_id').val(),
				"headPicture":$('#headPicture').val(),
				"sex":$('#mySex').val(),
				"nickName":$('#myNickName').val(),
				"type":1
		}
		var adviceMessageStr = JSON.stringify(adviceMessage);
		sendMessage(adviceMessageStr);
}

//更新对方的访客信息
function updateVistor(){
	var vistor = {
			"users_viid":$('#to_id').val(),
			"visitor_id":$('#from_id').val(),
			"visitorTime":""
	};
	var vistorStr = JSON.stringify(vistor);
	var flag=false;
	UpdateDWR.updateVisitor(vistorStr,function(result){
		if(result){
			adviceVisited();
		}
	});

}
//初始化照片
function initPhoto(photoArray){
	nowShowPhoto = $('.showPhotoDiv img');
	var photoTr=$('#photoTable tr');
	var html;
	for(var i=0;i<photoArray.length;i++){
		html="<td><img class='photo' src="+photoArray[i]+" title="+i+" onclick='showPhoto($(this))'></td>";
		photoTr.append(html);
	}
	
}

//显示照片浏览器
function showPhoto(img){	
	var imgIndex = parseInt(img.attr("title"));
	nowShowPhoto.attr("src",img.attr("src"));
	nowShowPhoto.attr("title",img.attr("title"));
	var photoSize = photoArray.length;
	var photoDiv=$('.alertPhotoDiv');
	var html;
		for(var i=0;i<photoSize;i++){
			if(i==imgIndex){
				html="<img onclick='photoChange($(this))' class='alertBottomPhoto alertPhotoBorder' src="+photoArray[i]+" title="+i+">";
			}else{
				html="<img onclick='photoChange($(this))' class='alertBottomPhoto' src="+photoArray[i]+" title="+i+">";
			}
			photoDiv.append(html);
		}
		lastClickImg=$(".alertPhotoDiv img:eq("+imgIndex+")");
		banWindowScroll();
	$('#photoValidateAlert').fadeIn(300);
}
//相片切换显示
function photoChange(img){
	lastClickImg.removeClass("alertPhotoBorder");
	img.addClass("alertPhotoBorder");
	nowShowPhoto.attr("src",img.attr("src"));
	nowShowPhoto.attr("title",img.attr("title"));
	lastClickImg = img;
}
function showPrePhoto(){
	var nowIndex = parseInt(nowShowPhoto.attr("title"));	
	if(nowIndex>0){
		var newIndex = nowIndex-1;
		var prePhoto=$(".alertPhotoDiv img:eq("+newIndex+")");
		prePhoto.addClass("alertPhotoBorder");
		nowShowPhoto.attr("src",prePhoto.attr("src"));
		var i=prePhoto.attr("title");
		nowShowPhoto.attr("title",i);
		lastClickImg.removeClass("alertPhotoBorder");
		lastClickImg=prePhoto;
	}
}
function showNextPhoto(){
	var nowIndex = parseInt(nowShowPhoto.attr("title"));	
	if(nowIndex<photoArray.length-1){
		var newIndex = nowIndex+1;
		var nextPhoto=$(".alertPhotoDiv img:eq("+newIndex+")");
		nextPhoto.addClass("alertPhotoBorder");
		nowShowPhoto.attr("src",nextPhoto.attr("src"));
		nowShowPhoto.attr("title",nextPhoto.attr("title"));
		lastClickImg.removeClass("alertPhotoBorder");
		lastClickImg=nextPhoto;
	}
}
//关闭相册浏览器
function closePhoto(){
	$('#photoValidateAlert').fadeOut(300);
	var photoDiv=$('.alertPhotoDiv');
	photoDiv.html("");
	$(window).unbind('scroll');
}
//禁止浏览器滚动条滚动
function banWindowScroll(){
	$(window).scrollTop (0);
	$ (window).scroll (function (){
		$ (this).scrollTop (0);
		$ (this).scrollLeft(0);
	});

}

//初始化标签信息
function initIDValidate(){
	var IDValidateUl= $('#IDValidateUl');
	if(parseInt((infoObj.infoPerfect)*100/39)>=80){
		IDValidateUl.append("<li><img src='images/base/fullInfo1.png' title='资料完整'></li>");
	}
	if(infoObj.headPicture!=""){
		IDValidateUl.append("<li><img src='images/base/hasHead1.png' title='有头像'></li>");
	}
	if(infoObj.photo!="[{\"list\":[]}]"||infoObj.photo!=""){
		IDValidateUl.append("<li><img src='images/base/hasImg1.png' title='生活照'></li>");
	}
	if(infoObj.ID!="未填写"){
		IDValidateUl.append("<li><img src='images/base/hasID1.png' title='身份证验证'></li>");
	}
	if(infoObj.email!=""){
		IDValidateUl.append("<li><img src='images/base/hasEmal1.png' title='邮箱验证'></li>");
	}
	if(infoObj.telphone!="未填写"){
		IDValidateUl.append("<li><img src='images/base/hasPhone1.png' title='手机验证'></li>");
	}
}
//初始化标签信息
function initTag(){
	var tag=JSON.parse(infoObj.tag);
	if(tag!=""){
		var text;
		var leng;
		var myTagDiv = $('#showTag');
		var selectTag;
		var dom;
		var classs;
		for(var i=0;i<tag.length;i++){
			text=tag[i];
			leng = text.length;
			dom=parseInt(Math.random()*3);
			if(leng==2){
				selectTag="<span class='baseTag1'>"+text+"</span>";
			}else if(leng==3){
				selectTag="<span class='baseTag2'>"+text+"</span>";
			}else{
				selectTag="<span class='baseTag3'>"+text+"</span>";
			}
			myTagDiv.append(selectTag);
			if(dom==0){
				classs="blueTagColor";
			}else if(dom==1){
				classs="redTagColor";
			}else{
				classs="xxxTagColor";
			}
			$('#showTag span:last').addClass(classs);
		}
	}
}

