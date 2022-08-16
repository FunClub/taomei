var lastClickTab;// 上次点击的选项卡;
var isUseMoreQual=false;// 是否使用更多条件
var isUseMoreQualCount=0;
var lastShowContent;// 上次显示的搜索内容;
var lastClickTag;//上次点击的标签对象
var tag=null;
var union;// 联合User对象
var search;// 搜索出来的用户
var qual;// 交友条件对象
var loverSex;// 另一半性别
var searchUserTable;
var users_id;//
var to_id;// 收件人ID
var headPicture;// 我的头像
var nickName;// 我的昵称
var sex;// 我的性别
var lastPage;//上一页
var page=0;
var searchObj;//搜索用户的string对象
$(function(){
	initSearch();
	addSearchEvent();
});

// 初始化搜索
function initSearch(){
	headPicture = $('#headPicture').val();
	nickName = $('#myNickName').val();
	sex = $('#mySex').val();
	lastClickTab=$('.searchTab:eq(0)');
	lastShowContent = $('#fristSearchContent');
	union= JSON.parse($("#unionStr").text())[0];
	qual = union.qualificationInfoUser;
	users_id = union.baseInfoUser.users_id;
	loverSex=qual.sex=="男"?"女":"男";
	searchUserTable = $('#searchUserTable');
	search = JSON.parse($('#searchInfoUserStr').text());
	initUserList(search);// 初始化用户列表
	if(parseInt(search.count)>0){
		showPage(search);
		lastPage = lastPage=$('#searchPagination .active');
	}else{
		searchUserTable.append("<tr><td width='500px' align='right'>未搜到任何用户！</td></tr>");
	}

	searchObj = {
			"wantLivePlace":qual.wantLivePlace,
			"wantLowestAge":qual.wantLowestAge,
			"wantHighestAge":qual.wantHighestAge,
			"wantSex":loverSex,
			"page":page
	}
	initSearchSelect();// 初始化搜索下拉列表
}
// 条件化搜索用户
function qualSearch(){
	var wantLivePlace =$('#bPlace option:checked').val();
	var wantLowestAge = $('#wantLowestAgeSelect option:checked').val();
	var wantHighestAge= $('#wantHighestAgeSelect option:checked').val();	
	if(isUseMoreQual){
		var wantEducational = $('#wantEducationalSelect option:checked').val();
		var wantIncome = $('#wantIncomeSelect option:checked').val();
		var wantLowestHeight = $('#wantLowestHeightSelect option:checked').val();
		var wantHighestHeight = $('#wantHighestHeightSelect option:checked').val();
		var wantMarriage = $('#marriageSelect option:checked').val();
		searchObj = {
				"wantLivePlace":wantLivePlace,
				"wantLowestAge":wantLowestAge,
				"wantHighestAge":wantHighestAge,
				"wantSex":loverSex,
				"wantEducational":wantEducational,
				"wantIncome":wantIncome,
				"wantLowestHeight":wantLowestHeight,
				"wantHighestHeight":wantHighestHeight,
				"wantMarriage":wantMarriage,
				"page":page,
				"wantTag":tag
		}
	}else{
		searchObj = {
				"wantLivePlace":wantLivePlace,
				"wantLowestAge":wantLowestAge,
				"wantHighestAge":wantHighestAge,
				"wantSex":loverSex,
				"wantTag":tag,
				"page":page
		}
	}
	var searchStr = JSON.stringify(searchObj);
	SearchDWR.getSearchInfoUser(searchStr,function(result){
		search = JSON.parse(result);
		searchUserTable.html("");
		$('#searchPagination').remove();
		initUserList(search);
		if(parseInt(search.count)>0){
			showPage(search);
			lastPage = lastPage=$('#searchPagination .active');
		}else{
			searchUserTable.append("<tr><td width='500px' align='right'>未搜到任何用户！</td></tr>");
		}
		$('#searchPagination .classPage').click(function(){
			showPointUser($(this).text());
			lastPage.removeClass("active");
			$(this).parent().addClass("active");
			lastPage=$('#searchPagination .active');
		});
	});
}


// 初始化用户列表
function initUserList(allSearchObj){
	var search = allSearchObj.userList;
	var count = allSearchObj.count;
	$('#searchResultCount').text(count);
	var html;
	var num=0;
	for(var i=search.length-1;i>=0;i--){
		if(num%2==0){
			html="<tr>"+
					"<td>"+
						"<div class='userDiv'>"+
							"<a href='showOneAction.action?users_id="+search[i].users_id+"' target='_blank'>"+"<img src='"+search[i].headPicture+"' class='head'></a>"+
							"<p class='nickName'><a href='showOneAction.action?users_id="+search[i].users_id+"' target='_blank'>"+search[i].nickName+"</a></p>"+
							"<span class='subInfo'>"+search[i].city+""+search[i].town+"</span><span class='fenge'>|</span><span class='subInfo'>"+search[i].age+"岁</span><span class='fenge'>|</span><span class='subInfo'>"+search[i].height+"cm</span>"+
							"<br>"+
							"<span class='qualSpan'>择偶:</span> <span class='subInfo'>"+search[i].wantLowestAge+"-"+search[i].wantHighestAge+"岁，"+search[i].wantLowestHeight+"-"+search[i].wantHighestHeight+"cm，"+search[i].wantEducational+"，"+search[i].wantLivePlace+"</span>"+
							"<div class='operation'>"+
							"<a target='_blank' href='writeEmailAction.action?users_id="+search[i].users_id+"'"+"><img class='sendMessage' src='images/search/senMessage.png'></a> <img class='attention' src='images/search/attentionTa.png' onclick='attentionOne("+search[i].users_id+")'>"+
							"</div>"+
						"</div>"+
					"</td>"+
				"</tr>";
			searchUserTable.append(html);
		}else{
			html="<td>"+
					"<div class='userDiv'>"+
						"<a href='showOneAction.action?users_id="+search[i].users_id+"' target='_blank'>"+"<img src='"+search[i].headPicture+"' class='head'></a>"+
						"<p class='nickName'><a href='showOneAction.action?users_id="+search[i].users_id+"' target='_blank'>"+search[i].nickName+"</a></p>"+
						"<span class='subInfo'>"+search[i].city+""+search[i].town+"</span><span class='fenge'>|</span><span class='subInfo'>"+search[i].age+"岁</span><span class='fenge'>|</span><span class='subInfo'>"+search[i].height+"cm</span>"+
						"<br>"+
						"<span class='qualSpan'>择偶:</span> <span class='subInfo'>"+search[i].wantLowestAge+"-"+search[i].wantHighestAge+"岁，"+search[i].wantLowestHeight+"-"+search[i].wantHighestHeight+"cm，"+search[i].wantEducational+"，"+search[i].wantLivePlace+"</span>"+
						"<div class='operation'>"+
							"<a target='_blank' href='writeEmailAction.action?users_id="+search[i].users_id+"'"+"><img class='sendMessage' src='images/search/senMessage.png'></a> <img class='attention' src='images/search/attentionTa.png' onclick='attentionOne("+search[i].users_id+")'>"+
							"</div>"+
					"</div>"+
				"</td>";
			$('#searchUserTable tr:last').append(html);
		}
		num++;
	}
	
	
}
//显示页数
function showPage(allSearchObj){
	var count = allSearchObj.count;
	var yushu = count%10;
	var pages = count/10;
	if(yushu!=0){
		pages+=1;
	}
	var html2="";
	var html1 ="<div id='searchPagination'>"+
				"<ul class='pagination'>"+
					"<li><a href='javascript:void(0)'>&laquo;</a></li>"+
					"<li class='active'><a class='classPage' href='javascript:void(0)'>1</a></li>";
	
	for(var i=2;i<=pages;i++){
		html2+="<li><a class='classPage' href='javascript:void(0)'>"+i+"</a></li>";
	}
	var html3=	"<li><a href='javascript:void(0)'>&raquo;</a></li>"+
			  "</ul>"+
			"</div>";
	$('#showSearchUser').append(html1+html2+html3);
}

// 关注对方
function attentionOne(attention_id){
	var attention = {
			"atusers_id":users_id,
			"attention_id":attention_id
	};
	var atStr = JSON.stringify(attention);
	UpdateDWR.insertAttention(atStr,function(result){
		if(result){
			adviceAttention(attention_id);
			alert("关注成功");
			
		}else{
			alert("已关注该用户!");
		}
	});
}
// 通知对方，我关注了他
function adviceAttention(to_id){
	var message={
			"from_id":users_id,
			"to_id":to_id,
			"headPicture":headPicture,
			"sex":sex,
			"nickName":nickName,
			"type":2
	}
	var meailStr = JSON.stringify(message);
	sendMessage(meailStr);
}
// 初始化搜索下拉列表
function initSearchSelect(){
	$("#wantLivePlace option[value="+qual.wantLivePlace+"]").attr("selected","selected");// 希望对方居住地
	$("#wantIncomeSelect option[value="+qual.wantIncome+"]").attr("selected","selected");// 希望对方收入wantHighestAge
	$("#wantLowestAgeSelect option[value="+qual.wantLowestAge+"]").attr("selected","selected");// 希望对方最小年龄
	$("#wantHighestAgeSelect option[value="+qual.wantHighestAge+"]").attr("selected","selected");// 希望对方最大年龄
	$("#wantEducationalSelect option[value="+qual.wantEducational+"]").attr("selected","selected");// 希望对方教育程度
	$("#wantWeightSelect option[value="+qual.wantWeight+"]").attr("selected","selected");// 希望对方体重
	$("#wantHighestHeightSelect option[value="+qual.wantHighestHeight+"]").attr("selected","selected");// 希望对方最大身高
	$("#wantLowestHeightSelect option[value="+qual.wantLowestHeight+"]").attr("selected","selected");// 希望对方最小身高
}
// 添加搜索事件
function addSearchEvent(){
	var nowShowContent;
	$('.searchTab').each(function(index){// 选项卡切换
		$(this).click(function(){
			$(this).addClass("searchTabActive");
			lastClickTab.removeClass("searchTabActive");
			lastShowContent.slideUp(500);
			lastClickTab = $(this);
			nowShowContent=$("#searchQual .searchContent:eq("+index+")");
			nowShowContent.slideDown(500);
			lastShowContent=nowShowContent;
		});
	});
	$('#searchPagination .classPage').click(function(){
		showPointUser($(this).text());
		lastPage.removeClass("active");
		$(this).parent().addClass("active");
		lastPage=$('#searchPagination .active');
	});
	$("#wantLowestAgeSelect").change(function(){// 显示最高年龄的最低值
		HeightVal(1,$(this),$(this).prop('selectedIndex'))
	});
	$("#wantLowestHeightSelect").change(function(){// 显示最高身高的最低值
		HeightVal(2,$(this),$(this).prop('selectedIndex'))
	});
	$('#showTag .searchTag').click(function(){
		$(this).toggleClass('searchTagActive');
		if(lastClickTag!=undefined&&lastClickTag!=$(this)){
			lastClickTag.removeClass('searchTagActive')
		}
		if($(this).hasClass('searchTagActive')){
			tag=$(this).text();
			lastClickTag=$(this);
		}else{
			tag=null;
			lastClickTag=undefined;
		}
		qualSearch();
	});
}
//显示指定页的用户
function showPointUser(pages){
	searchObj.page=(parseInt(pages)-1)*10+1;
	var str = JSON.stringify(searchObj);
	SearchDWR.getSearchInfoUser(str,function(result){
		search = JSON.parse(result);
		searchUserTable.html("");
		initUserList(search);
	});
	
}
// 显示最高的选项的最低值
function HeightVal(obj,lowest,index){
	var height;
	if(obj==1){
		height=$("#wantHighestAgeSelect");
	}else{
		height=$("#wantHighestHeightSelect");
	}
	height.html("");
	if(obj==1){
		for(var i=index+20;i<36;i++){
			
			if(i!=36){
				height.append("<option value="+i+">"+i+"岁</option>");
			}else{
				height.append("<option value="+i+">保密</option>");
			}
			
		}
	}else{	
		for(var i=index+160;i<181;i++){
			if(i!=181){
				height.append("<option value="+i+">"+i+"厘米</option>");
			}else{
				height.append("<option value="+i+">保密</option>");
			}
			
		}
	}
	
}
// 是否使用更多条件
function moreQualChange(input){
	if(isUseMoreQualCount%2==0){
		$('#moreQualTable select').removeClass("banMoreQual");
		$('#moreQualTable select').addClass("qualSelect");
		isUseMoreQual=true;
	
	}else{
		$('#moreQualTable select').removeClass("qualSelect");
		$('#moreQualTable select').addClass("banMoreQual");
		isUseMoreQual=false;
	}
	isUseMoreQualCount++;
}