	var loginPointDiv;
	var loginPointText;
$(function(){
	loginPointText = $('#loginPointText');
	loginPointDiv = $('#loginPointDiv');
	$('#sureLogin').click(function(){
		validateAccountInfo();
	});
	$('#account').click(function(){
		loginPointDiv.hide();
	});
	$('#passWords').click(function(){
		loginPointDiv.hide();
	});
});
var email=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
function validateAccountInfo(){
	var account=$('#account').val();
	var passWords = $('#passWords').val();
	if(account.length>7&&passWords.length>5){
		if(email.test(account)){

					$.post(
					"loginAction.action",
					{
						"account":account,
						"passWords":passWords
					},function(result){
						
						if(result=="1"){
							window.location.href="jsp/myTaoMei/recommend.jsp"
						}else{
							loginPointText.text("账号或密码错误!");
							loginPointDiv.show();
						}
					}
					);
				
			
		}else{
			loginPointText.text("请输入正确的邮箱!");
			loginPointDiv.show();
		}
	}else{
		loginPointText.text("账号或密码格式错误!");
		loginPointDiv.show();
	}
}