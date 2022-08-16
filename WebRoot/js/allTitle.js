$(function(){
	addRecommendEvent();
})

//添加事件
function addRecommendEvent(){
	//导航的变化
	$("#allNav li:not('#myTaoMeiLi')").mouseenter(function(){
		$(this).addClass("navChange");
	});
	$("#allNav li:not('#myTaoMeiLi')").mouseleave(function(){
		$(this).removeClass("navChange");
	});
}