var discussArray;;//所有评论(数据库中存储的)
var wirteDiscuss;
var talk_id;
var users_id;
var discussList;//评论人数组
var allDisscussDiv;
var lastClikPage;//上次点击的评论页
$(function(){
	initShowTalk();
	addShowTalkEvent();
});

function initShowTalk(){
	discussArray = JSON.parse($('#talkDiscuss').text());
	wirteDiscuss = $('#wirteDiscuss');
	users_id=$('#users_id').val();
	talk_id = $('#talk_id').val();
	discussList = JSON.parse($("#disJson").text());
	allDisscussDiv = $('#allDisscuss');
	lastClikPage= $('#disTalkPage .active');
}

function addShowTalkEvent(){
	$('#allFace img').click(function(){
		$('#allFace').toggle(300);
		$('#wirteDiscuss').append("<img class=talkDiscussFace src="+$(this).attr("src")+">")
	});
	$('#disTalkPage a').click(function(){
		if($(this).parent().hasClass("active")==false){
			lastClikPage.removeClass("active");
			var li=$(this).parent();
			li.addClass("active");
			lastClikPage=li;
			discussPage($(this).text());
			
		}
		
	});
}

//发表评论
function sendDiscuss(){
	var discuss= $('#wirteDiscuss').html();		
	var insertDiscuss = {
			"users_id":users_id,
			"talk_id":talk_id,
			"discuss":discuss
	};
	if(discussArray==null){
		discussArray = new Array();	
	}
	discussArray.push(insertDiscuss);

	var dis = JSON.stringify(discussArray);
	UpdateDWR.updateDiscuss(dis,function(result){
		if(result){
			window.location.reload();
			$(window).scrollTop($('#wirteDiscuss').offset().top+200);
			$('#wirteDiscuss').html("");
		}
	});
}
function discussPage(page){

	allDisscussDiv.html("");
	var disLen = discussList.length;
	var begin=disLen-8*(parseInt(page)-1)-1;
	var end=begin-7;
	var discuss;
	var html;
	for(begin;begin>=end;begin--){	
		discuss=discussList[begin];
		html="<div class=disscussDiv>"+
				"<div class=disHeadDiv><a href=showOneAction.action?users_id="+discuss.users_id+"target=_blank><img src="+discuss.headPicture+" class=disHeadImg></a></div>"+
				"<p class=disBaseInfo>"+discuss.nickName+"，"+discuss.age+"岁，"+discuss.height+"cm，"+discuss.city+discuss.town+"</p><span class=disTime>#"+(begin+1)+"楼&nbsp;"+discuss.discussTime+"</span>"+
				"<div class=disContent>"+discuss.disscuss+"</div>"+
				"<div class=disOpreation>"+
					"<span class=disGood><img  src=images/club/good1.png>&nbsp;赞&nbsp;0</span>"+
					"<img src=images/club/discuss.png>&nbsp;评论&nbsp;0"+
				"</div>"+
	         "</div>";
		allDisscussDiv.append(html);
	}
	
}