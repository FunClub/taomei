var nowPlace;// 现居地对象
var myTagDiv;//存放我选择的个性标签Div
var base;
var deta;
var qual;
var othe;
var lastTr;//图片表格的最后一行
var upPhotoTd;
var upPhotoTr;
var photoIndex=0;//照片的索引
var photoArray;//照片数组
var users_id;//用户ID
var firstPhotoIndex;//底部第一章照片的索引;
var nowShowPhoto;//当前正在显示的图片
var lastClickImg;//上次点击的相片
$(function(){
	initInfo();
	addInfoEvent();
});

//初始化一些变量
function initInfo(){
	users_id = $("#users_id").val();
	var unionStr = $('#unionStr').text();
	var unionObj = JSON.parse(unionStr)[0];
	base = unionObj.baseInfoUser;
	deta = unionObj.detailedInfoUser;
	qual = unionObj.qualificationInfoUser;
	othe = unionObj.otherInfoUser;
	var infoType = $('#infoType').val();
	nowShowPhoto = $('.showPhotoDiv img');
	if(othe.photo==""){
		photoArray= new Array();
	}else{
		photoArray=JSON.parse(othe.photo)[0].list;
	}
	initPhotoInfo(photoArray);
	initBaseInfo();
	initDetaInfo();
	initQualInfo();
	initIDValidate();
	if(infoType=="all"){
		showAnyInfo("baseInfo")
	}else if(infoType=="photo"){
		
		showAnyInfo("photo");				
	}else if(infoType=="qual"){
		showAnyInfo("qualification");
	}else if(infoType=="heart"){
		showAnyInfo("heartInfo");
	}else{
		
		showAnyInfo("IDValidate");
	}
	
	nowPlace=[
			   {"重庆":new Array('巴南','江北','南岸','双桥','万州')},
			   {"北京":new Array('东城','西城','崇文','宣武','丰台')},
			   {"上海":new Array('黄埔','南区','卢湾','徐汇','长宁')},
			   {"广东":new Array('广州','深圳','珠海','汕头','佛山')},
			   {"湖南":new Array('长沙','株洲','衡阳','邵阳','岳阳')}
			 ];
	myTagDiv = $("#myTagDiv");
}
//显示个人资料的各种信息
function showAnyInfo(infoType){
	$("#infoTabs a[href='#"+infoType+"']").parents().addClass("active");
	$("#"+infoType).addClass("active");
	$("#"+infoType).addClass("in");
	
}

//初始化基本信息
function initBaseInfo(){
	$("#ageSelect option[value="+base.age+"]").attr("selected","selected");	//年龄
	$("#heightSelect option[value="+base.height+"]").attr("selected","selected");//身高
	$("#weightSelect option[value="+base.weights+"]").attr("selected","selected");//体重
	$("#educationalSelect option[value="+base.educational+"]").attr("selected","selected");//体重
	$("#bPlace option[value="+base.city+"]").attr("selected","selected");//城市
	$("#sPlace option[value="+base.town+"]").attr("selected","selected");//乡镇
	$("#bloodSelect option[value="+base.blood+"]").attr("selected","selected");//血型
	$("#professionSelect option[value="+base.profession+"]").attr("selected","selected");//血型
	$("#professionSelect option[value="+base.marriage+"]").attr("selected","selected");//婚姻状况
	$("#hasHouseSelect option[value="+base.hasHouseAble+"]").attr("selected","selected");//是否有房子
	$("#incomeSelect option[value="+base.income+"]").attr("selected","selected");//月薪
}
//初始化详细资料
function initDetaInfo(){
	$("#selectWantChildAble option[value="+deta.wantChildAble+"]").attr("selected","selected");//是否想要小孩
	$("#loverTypeSelect option[value="+deta.loverType+"]").attr("selected","selected");//喜欢异性类型
	$("#liveWithParentsAbleSelect option[value="+deta.liveWithParentsAble+"]").attr("selected","selected");//是否愿意和父母同住
	$("#distanceLoveAbleSelect option[value="+deta.distanceLoveAble+"]").attr("selected","selected");//是否接受异地恋
	$("#sexAbleSelect option[value="+deta.sexAble+"]").attr("selected","selected");//是否接受婚前性行为
	$("#prettyPartsSelect option[value="+deta.prettyParts+"]").attr("selected","selected");//最有魅力的部位
	if(deta.tag!=""){
		var tag = JSON.parse(deta.tag);
		var text;
		var leng;
		var myTagDiv = $('#myTagDiv');
		var selectTag;
		for(var i=0;i<tag.length;i++){
			text=tag[i];
			leng = text.length;
			if(leng==2){
				selectTag="<span class='selectTag1' onclick='$(this).remove()'>"+
				  text+"<img class='closeTag' src='images/register/removeTag.png' '/>"
		       "</span>";
			}else if(leng==3){
				selectTag="<span class='selectTag2' onclick='$(this).remove()'>"+
				  text+"<img class='closeTag' src='images/register/removeTag.png'/>"
		     "</span>";
			}else{
				
				selectTag="<span class='selectTag3' onclick='$(this).remove()'>"+
				  text+"<img class='closeTag' src='images/register/removeTag.png'/>"
		     "</span>";
			}
			myTagDiv.append(selectTag);
		}
	}
	
	$("#heartArea").val(deta.introduction);//内心独白
}

//初始化择偶标准
function initQualInfo(){
	$("#wantLivePlace option[value="+qual.wantLivePlace+"]").attr("selected","selected");//希望对方居住地
	$("#wantIncomeSelect option[value="+qual.wantIncome+"]").attr("selected","selected");//希望对方收入wantHighestAge
	$("#wantLowestAgeSelect option[value="+qual.wantLowestAge+"]").attr("selected","selected");//希望对方最小年龄
	$("#wantHighestAgeSelect option[value="+qual.wantHighestAge+"]").attr("selected","selected");//希望对方最大年龄
	$("#wantEducationalSelect option[value="+qual.wantEducational+"]").attr("selected","selected");//希望对方教育程度
	$("#wantWeightSelect option[value="+qual.wantWeight+"]").attr("selected","selected");//希望对方体重
	$("#wantHighestHeightSelect option[value="+qual.wantHighestHeight+"]").attr("selected","selected");//希望对方最大身高
	$("#wantLowestHeightSelect option[value="+qual.wantLowestHeight+"]").attr("selected","selected");//希望对方最小身高
	
}

//初始化相册信息
function initPhotoInfo(photos){
	if(othe.photo!=""){	
		var photoTable = $('#photoTable');
		var html;
		for(var i=0;i<photos.length;i++){
			if(i%5!=0){			
				addImgToTr(lastTr,photos[i])
			}else{
				addImgToTable(photos[i])
				lastTr = $('#photoTable tr:last');
			}
		}
		if(photos.length%5==0){
			upPhotoTr = "<tr>"+
						"<td id='upLoadPhotoTd'>"+
							"<div class='allPhotoDiv'>"+
								"<div class='photoDiv'>"+
									"<img src='images/myTaoMei/nonePhoto.jpg' class='photo'>"+
								 "</div>"+
								 "<div class='p-upload' id='upLoadPhoto'>"+
									"<input type='file' onchange='upLoadPhoto()' id='upLoadPhotoInput'>"+
									"上传相片"+
								"</div>"+
							"</div>"+
						"</td>"+
					"</tr>";
			photoTable.append(upPhotoTr);
		}else{
			upPhotoTd = "<td id='upLoadPhotoTd'>"+
						"<div class='allPhotoDiv'>"+
							"<div class='photoDiv'>"+
								"<img src='images/myTaoMei/nonePhoto.jpg' class='photo'>"+
							 "</div>"+
							 "<div class='p-upload' id='upLoadPhoto'>"+
									"<input name='photoInput' type='file' onchange='upLoadPhoto()' id='upLoadPhotoInput'>"+
									"上传相片"+
							"</div>"+
						"</div>"+
					"</td>";
			lastTr.append(upPhotoTd);
		}
	}else{
		upPhotoTr = "<tr>"+
		"<td id='upLoadPhotoTd'>"+
			"<div class='allPhotoDiv'>"+
				"<div class='photoDiv'>"+
					"<img src='images/myTaoMei/nonePhoto.jpg' class='photo'>"+
				 "</div>"+
				 "<div class='p-upload' id='upLoadPhoto'>"+
						"<input name='photoInput' type='file' onchange='upLoadPhoto()' id='upLoadPhotoInput'>"+
					"上传相片"+
				"</div>"+
			"</div>"+
		"</td>"+
	"</tr>";
		var photoTable = $('#photoTable');
		photoTable.append(upPhotoTr);
	}
	
}

//在一行中添加图片
function addImgToTr(tr,img){
	var html = "<td>"+
					"<div class='allPhotoDiv'>"+
						"<div class='photoDiv'>"+
							"<img src="+img+" class='photo' title="+photoIndex+" onclick='showPhotoAlert($(this))'>"+
						"</div>"+
						"<div class='photoOperate'>"+
							"<div class='deletePhoto' onclick='deletePhoto($(this).parent().parent().parent())'>删除</div>"+
							"<div class='viewPhoto' onclick="+"showPhotoAlert($(this).parent().parent().children('.photoDiv').children('img'))"+">预览</div>"+
						"</div>"+
					"</div>"+
				"</td>";
	tr.append(html);
	photoIndex++;
}
//显示照片浏览器
function showPhotoAlert(img){
	banWindowScroll();
	nowPhoto =img;
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
//新起一行添加图片
function addImgToTable(img){
	var html = "<tr>"+
				"<td>"+
					"<div class='allPhotoDiv'>"+
						"<div class='photoDiv'>"+
							"<img src="+img+" class='photo' title="+photoIndex+" onclick='showPhotoAlert($(this))'>"+
						 "</div>"+
						"<div class='photoOperate'>"+
							"<div class='deletePhoto' onclick='deletePhoto($(this).parent().parent().parent())'>删除</div>"+
							"<div class='viewPhoto' onclick="+"showPhotoAlert($(this).parent().parent().children('.photoDiv').children('img'))"+">预览</div>"+
						"</div>"+
					"</div>"+
				"</td>"+
			"</tr>";
	var photoTable = $('#photoTable');
	photoTable.append(html);
	photoIndex++;
}
//初始化身份验证
function initIDValidate(){
	perfectVal();//资料完整度验证
	if(othe.headPicture!=""){//头像验证
		$('#ID_head img').attr("src","images/base/hasHead1.png");
	}
	
	if(photoArray.length>=3){//相册验证
		$('#ID_photo img').attr("src","images/base/hasImg1.png");
	}
	if(base.ID!="未填写"){
		$('#ID_IDCard img').attr("src","images/base/hasID1.png");
		$('#ID_IDCard .saveInfo').text("已验证");
	}
	$('#ID_email img').attr("src","images/base/hasEmal1.png");//邮箱验证
	
	if(base.telphone!="未填写"){//手机验证
		$('#ID_telphone img').attr("src","images/base/hasPhone1.png");
		$('#ID_telphone .saveInfo').text("已验证");
	}
	//手机雅正
}
function perfectVal(){
	var perfectInfo = $('.progress-bar').text();
	if(perfectInfo.trim().length<=3){
		var subs = perfectInfo.substring(0,2);
		if(parseInt(subs)>=80){
			$('#ID_infoPerfect img').attr("src","images/base/fullInfo1.png");
		}
	}else{
		
		$('#ID_infoPerfect img').attr("src","images/base/fullInfo1.png")
	}
}
//添加事件
function addInfoEvent(){
	$('#bPlace').change(function(){//现居地下拉选择的变化
		showPlace($(this).val(), $(this).prop('selectedIndex'));
	});
	/*$('#closeTagPointImg').click(function(){
		$('.tagPoint').hide(200);
	});*/
	$('#selectTag span').click(function(){//显示我选择的标签
		showSelectTag($(this).text());
	});
	$("#wantLowestAgeSelect").change(function(){//显示最高年龄的最低值
		HeightVal(1,$(this),$(this).prop('selectedIndex'))
	});
	$("#wantLowestHeightSelect").change(function(){//显示最高身高的最低值
		HeightVal(2,$(this),$(this).prop('selectedIndex'))
	});
	$('#upLoadHead').change(function(){//上传头像
		upLoadHead();
	});
	$('#updateBaseInfo').click(function(){//更新基本资料
		updateBaseInfo();
	});
	$('#updateDetaInfo').click(function(){//更新详细资料
		updateDetaInfo();
	});
	$('#updateIntroduction').click(function(){//更新内心独白
		updateIntroduction();
	});
	$('#updateQualInfo').click(function(){//更新择偶标准
		updateQualInfo();
	});
	
	$('#ID_IDCard').click(function(){//弹出填写身份证的弹出层
		$('#IDValidateAlert').fadeIn(350);
		banWindowScroll();
	});
	
	$('.closeValidateAlert').click(function(){//关闭弹出层
		$(this).parent().parent().parent().fadeOut(350);
		$ (window).unbind('scroll');
	});
	$('#ID_telphone').click(function(){//弹出填写手机的弹出层
		$('#telValidateAlert').fadeIn(350);
		banWindowScroll();
	});
	$('#ID_infoPerfect div').click(function(){
		closeIDVal();
		showBaseInfo();
	});
	$('#ID_head div').click(function(){
		closeIDVal();
		showLoadHeadInfo();
	});
	$('#ID_photo div').click(function(){
		closeIDVal();
		showPhotoInfo();
	});
}

function closeBaseInfo(){
	$("#infoTabs a[href='#baseInfo']").parents().removeClass("active");
	$('#baseInfo').removeClass("active");
	$('#baseInfo').removeClass("in");
}
function closePhotoVal(){
	$("#infoTabs a[href='#photo']").parents().removeClass("active");
	$('#photo').removeClass("active");
	$('#photo').removeClass("in");
}
function showPhotoInfo(){
	$("#infoTabs a[href='#photo']").parents().addClass("active");
	$('#photo').addClass("active");
	$('#photo').addClass("in");
}
function showLoadHeadInfo(){
	$("#infoTabs a[href='#upHead']").parents().addClass("active");
	$('#upHead').addClass("active");
	$('#upHead').addClass("in");
}
function closeIDVal(){
	$("#infoTabs a[href='#IDValidate']").parents().removeClass("active");
	$('#IDValidate').removeClass("active");
	$('#IDValidate').removeClass("in");
}
//身份证验证
function IDValidate(){
	var ID=$('#IDInput').val();
	UpdateDWR.updateID(users_id,ID,function(result){
		if(result>0){
			updateInfoPrefect(result);
			$('#ID').text(ID);
			$('#ID_IDCard img').attr("src","images/base/hasID1.png");
			$('#IDValidateAlert').fadeOut(350);
			$ (window).unbind('scroll');
		}else{
			$('#IDVilidateResult').show();
		}
		
	});
}
//手机验证
function telValidate(){
	var telphone=$('#telInput').val();
	UpdateDWR.updateTelphone(users_id,telphone,function(result){
		if(result>0){
			updateInfoPrefect(result);
			$('#telphone').text(telphone);
			$('#ID_telphone img').attr("src","images/base/hasPhone1.png");
			$('#telValidateAlert').fadeOut(350);
			$ (window).unbind('scroll');
		}else{
			$('#telVilidateResult').show();
		}
		
	});
}
//禁止浏览器滚动条滚动
function banWindowScroll(){
	$(window).scrollTop (0);
	$ (window).scroll (function (){
		$ (this).scrollTop (0);
		$ (this).scrollLeft(0);
	});

}
//上传相片
function upLoadPhoto(){
	if(photoArray.length<8){
			var file = dwr.util.getValue("upLoadPhotoInput");
			var fileName = file.value;
			UpdateDWR.updatePhoto(file,fileName,users_id,function(result){
				result=JSON.parse(result)[0];
				showUpPhoto(result.path);
				updateInfoPrefect(result.count);
				photoArray.push(result.path);
				if(photoArray.length>3){//相册验证
					$('#ID_photo img').attr("src","images/base/hasImg1.png");
				}
				$('#upLoadPhotoInput').change(function(){
					upLoadPhoto();
				});
			});
	}else{
		alert("为减轻服务器压力,最多只能上传8张相片");
	}
	
}

//删除相片
function deletePhoto(photoTd){
	//photoTd.remove();
	var img = photoTd.children("div").children("div").children("img");
	var path  = img.attr("src");
	var index = img.attr("title");
	
	UpdateDWR.deletePhoto(users_id,path,function(result){
		updateInfoPrefect(result);
	});
	var newArray = new Array();
	for(var i=0;i<photoArray.length;i++){
		if(i!=index){
			newArray.push(photoArray[i]);
		}
	}
	photoArray=newArray;
	$('#photoTable').html("");
	photoIndex=0;
	initPhotoInfo(photoArray);
}
//显示上传的图片
function showUpPhoto(img){
	
	lastTr = $('#photoTable tr:last');
	if(lastTr.children("td").length==5){
		$('#upLoadPhotoTd').remove();
		addImgToTr(lastTr,img);
		$('#photoTable').append("<tr>"+
				"<td id='upLoadPhotoTd'>"+
				"<div class='allPhotoDiv'>"+
					"<div class='photoDiv'>"+
						"<img src='images/myTaoMei/nonePhoto.jpg' class='photo'>"+
					 "</div>"+
					 "<div class='p-upload' id='upLoadPhoto'>"+
						"<input type='file' id='upLoadPhotoInput'>"+
						"上传相片"+
					"</div>"+
				"</div>"+
			"</td>"+
		"</tr>");
	}else{
		$('#upLoadPhotoTd').remove();
		addImgToTr(lastTr,img);
		lastTr.append("<td id='upLoadPhotoTd'>"+
				"<div class='allPhotoDiv'>"+
				"<div class='photoDiv'>"+
					"<img src='images/myTaoMei/nonePhoto.jpg' class='photo'>"+
				 "</div>"+
				 "<div class='p-upload' id='upLoadPhoto'>"+
					"<input type='file' id='upLoadPhotoInput'>"+
					"上传相片"+
				"</div>"+
			"</div>"+
		"</td>");
	}
}

//更新择偶标准
function updateQualInfo(){
	var wantLivePlace =$('#wantLivePlace option:checked').val();//希望对方居住地
	var wantIncome = $('#wantIncomeSelect option:checked').val();//希望对方收入
	var wantLowestAge = $('#wantLowestAgeSelect option:checked').val();//希望对方最低年龄
	var wantHighestAge = $('#wantHighestAgeSelect option:checked').val();//希望对方最高年龄
	var wantEducational = $('#wantEducationalSelect option:checked').val();//希望对方学历
	var wantWeight = $('#wantWeightSelect option:checked').val();//希望对方体重
	var wantLowestHeight = $('#wantLowestHeightSelect option:checked').val();//希望对方最低身高
	var wantHighestHeight = $('#wantHighestHeightSelect option:checked').val();//希望对方最低身高
	var qualObj = {
			"wantLivePlace":wantLivePlace,
			"wantIncome":wantIncome,
			"wantLowestAge":wantLowestAge,
			"wantHighestAge":wantHighestAge,
			"wantEducational":wantEducational,
			"wantWeight":wantWeight,
			"wantLowestHeight":wantLowestHeight,
			"wantHighestHeight":wantHighestHeight,
			"sex":base.sex,
			"users_id":users_id
	};
	var qualStr = JSON.stringify(qualObj);
	UpdateDWR.updateInfo("qual",qualStr,function(result){
		if(result>0){
			alert("资料修改成功!");
			updateInfoPrefect(result);
			
		}else{
			alert("资料修改失败!");
		}
	});
	
}

//更新内心独白
function updateIntroduction(){
	var heartArea=$('#heartArea').val();
	
	if(heartArea.length==0){
		heartArea=null;
	}
	UpdateDWR.updateIntroduction(users_id,heartArea,function(result){
		if(result>0){
			alert("资料修改成功!");
			updateInfoPrefect(result);
		}else{
			alert("资料修改失败!");
		}
	});
	
}

//更新基本资料
function updateBaseInfo(){
	var nickName = $('#nickName').val();
	var age = $('#ageSelect option:checked').val();
	var height = $('#heightSelect option:checked').val();
	var weights = $('#weightSelect option:checked').val();bPlace
	var educational = $('#educationalSelect option:checked').val();
	var city = $('#bPlace option:checked').val();
	var town =$('#sPlace option:checked').val();
	var QQ = $('#QQ').val();
	var blood =$('#bloodSelect option:checked').val();
	var profession =$('#professionSelect option:checked').val();
	var marriage =$('#marriageSelect option:checked').val();
	var hasHouseAble =$('#hasHouseSelect option:checked').val();
	var income =$('#incomeSelect option:checked').val();
	var account = $('#account').text();
	var ID = $('#ID').text();
	var telphone = $('#telphone').text();
	var users_id = $("#users_id").val();
	var sex = $("#sex").text();	
	var baseObj = {
			"nickName":nickName,
			"age":age,
			"height":height,
			"weights":weights,
			"educational":educational,
			"city":city,
			"town":town,
			"QQ":QQ,
			"blood":blood,
			"profession":profession,
			"marriage":marriage,
			"hasHouseAble":hasHouseAble,
			"income":income,
			"account":account,
			"ID":ID,
			"telphone":telphone,
			"users_id":users_id,
			"sex":sex
	}
	var baseStr=JSON.stringify(baseObj);
	UpdateDWR.updateInfo("base",baseStr,function(result){
		if(result>0){
			alert("资料修改成功!");
			updateInfoPrefect(result);
		}else{
			alert("资料修改失败!");
		}
	});
}
//更新详细资料
function updateDetaInfo(){
	var wantChildAble = $('#selectWantChildAble option:checked').val();
	var loverType = $('#loverTypeSelect option:checked').val();
	var distanceLoveAble = $('#distanceLoveAbleSelect option:checked').val();
	var liveWithParentsAble = $('#liveWithParentsAbleSelect option:checked').val();
	var sexAble =$('#sexAbleSelect option:checked').val();
	var prettyParts = $('#prettyPartsSelect option:checked').val();
	var users_id = $("#users_id").val();
	var tagArray = new Array();
	var introduction = $('#heartArea').val();
	$('#myTagDiv span:gt(0)').each(function(){
		tagArray.push($(this).text());
	});
	var tag = JSON.stringify(tagArray);
	if(tag=="[]"){
		tag=null;
	}
	var detaObj = {
			"wantChildAble":wantChildAble,
			"loverType":loverType,
			"distanceLoveAble":distanceLoveAble,
			"liveWithParentsAble":liveWithParentsAble,
			"sexAble":sexAble,
			"prettyParts":prettyParts,
			"users_id":users_id,
			"introduction":introduction,
			"tag":tag
	}
	var detaStr = JSON.stringify(detaObj);
	UpdateDWR.updateInfo("deta",detaStr,function(result){
		if(result>0){
			alert("资料修改成功!");
			updateInfoPrefect(result);
		}else{
			alert("资料修改失败!");
		}
	});
}
//更新信息完整度
function updateInfoPrefect(result){
	var parogress = $('.progress-bar');
	var count=parseInt(result*100/39);
	parogress.css("width",count+"%");
	parogress.text(count+"%");
	if(parseInt>=80){
		$('#ID_infoPerfect img').attr("src","images/base/fullInfo1.png");
	}
}
//上传头像
function upLoadHead(){
	var file = dwr.util.getValue("upLoadHeadInput");
	var fileName = file.value;
	var users_id = $("#users_id").val();
	UpdateDWR.updateHead(file,fileName,users_id,function(result){
		var obj=JSON.parse(result)[0];
		updateInfoPrefect(obj.count);
		$("#myHead").attr("src",obj.path);
		$('#ID_head img').attr("src","images/base/hasHead1.png");
	});
}
//显示最高的选项的最低值
function HeightVal(obj,lowest,index){
	var height=lowest.next('span').next('.height');
	height.html("");
	if(obj==1){
		for(var i=index+20;i<37;i++){
			
			if(i!=36){
				height.append("<option value="+i+">"+i+"岁</option>");
			}else{
				height.append("<option value="+i+">保密</option>");
			}
			
		}
	}else{	
		for(var i=index+160;i<182;i++){
			if(i!=181){
				height.append("<option value="+i+">"+i+"厘米</option>");
			}else{
				height.append("<option value="+i+">保密</option>");
			}
			
		}
	}
	
}

//显示自己选择的标签
function showSelectTag(text){
	
	if(isContainsTag(text)){
		var leng = text.length;
		if(leng==2){
			selectTag="<span class='selectTag1' onclick='$(this).remove()'>"+
			  text+"<img class='closeTag' src='images/register/removeTag.png' '/>"
	       "</span>";
		}else if(leng==3){
			selectTag="<span class='selectTag2' onclick='$(this).remove()'>"+
			  text+"<img class='closeTag' src='images/register/removeTag.png'/>"
	     "</span>";
		}else{
			
			selectTag="<span class='selectTag3' onclick='$(this).remove()'>"+
			  text+"<img class='closeTag' src='images/register/removeTag.png'/>"
	     "</span>";
		}
		
		myTagDiv.append(selectTag);
	}	
}


//判断是否已经选择了正在点击的标签
function isContainsTag(text){
	var  flag=0;
	$('#myTagDiv span').each(function(index,element){
		if($(this).text()==text){
			flag++;
		}
	});
	return flag==0;
}
//常住地点的显示
function showPlace(key,index){
	var values = nowPlace[index][key];
	var ops = $('#sPlace').get(0).options;
	for (var i = 0; i < values.length; i++) {
		ops[i].text = values[i];
		ops[i].value = values[i];
	}
}