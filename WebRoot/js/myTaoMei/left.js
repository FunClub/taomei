var base;
var othe;
var photoArray;
var unionObj;
$(function(){
	initLeft();
	initLeftIDValidate();
});
function initLeft(){
	var unionStr = $('#unionStr').text();

	unionObj = JSON.parse(unionStr)[0];
	base = unionObj.baseInfoUser;
	deta = unionObj.detailedInfoUser;
	qual = unionObj.qualificationInfoUser;
	othe = unionObj.otherInfoUser;
	if(othe.photo==""){
		photoArray= new Array();
	}else{
		photoArray=JSON.parse(othe.photo)[0].list;
	}
	SearchDWR.getUnReadCount(base.users_id,function(result){		
		if(result>0){
			$('#viewEmail').text("信箱("+result+"封未读)");
		}else{
			$('#viewEmail').text("信箱");
		}
	});
	
}
//初始化身份验证
function initLeftIDValidate(){
	if((unionObj.infoPerfect*100/39)>=80){
		$('#sInfoPerfect').attr("src","images/base/fullInfo1.png");
	}
	if(base.headPicture!=""){
		$('#sHeadPicture').attr("src","images/base/hasHead1.png")
	}
	if(othe.headPicture!=""){//头像验证
		$('#ID_head img').attr("src","images/base/hasHead1.png");
	}
	if(base.ID!="未填写"){
		$('#sID').attr("src","images/base/hasID1.png");
	}
	if(photoArray.length>=3){//相册验证
		$('#sPhoto').attr("src","images/base/hasImg1.png");
	}

	if(base.telphone!="未填写"){//手机验证
		$('#sTelphone').attr("src","images/base/hasPhone1.png");
	
	}

}
