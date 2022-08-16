var nowPlace;// 现居地对象
var selectTag;// 选择的个性标签
var myTagDiv;// 存放我选择的个性标签Div
var email;// 邮箱的正则表达式
var isTrueAccount;// 账号是否合法
var isTruePass;// 密码是否合法
var isTrueCode;// 验证码是否合法
$(function() {
	initRegister();
	addRegisterEvent();
});

// 初始化注册相关的变量
function initRegister() {
	nowPlace = [ {
		"重庆" : new Array('巴南', '江北', '南岸', '双桥', '万州')
	}, {
		"北京" : new Array('东城', '西城', '崇文', '宣武', '丰台')
	}, {
		"上海" : new Array('黄埔', '南区', '卢湾', '徐汇', '长宁')
	}, {
		"广东" : new Array('广州', '深圳', '珠海', '汕头', '佛山')
	}, {
		"湖南" : new Array('长沙', '株洲', '衡阳', '邵阳', '岳阳')
	} ];
	myTagDiv = $("#myTagDiv");
	email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	$("#account,#passWords").tooltip({
		position : 'right',
		content : '请输入内容',
		showEvent : "focus",// 获得焦点时显示
		deltaX : 20,
		hideEvent : "blur",// 失去焦点时隐藏
		onShow : function() {
			$(this).tooltip('tip').css({
				backgroundColor : '#FFFFFF',
				borderColor : '#CCCCCC'
			});
		}
	});
	isTrueAccount = false;
	isTruePass = false;
	isTrueCode = false;
}
// 添加注册相关的事件
function addRegisterEvent() {
	$('#bPlace').change(function() {
		showPlace($(this).val(), $(this).prop('selectedIndex'));
	});
	$('#closeTagPointImg').click(function() {
		$('.tagPoint').hide(200);
	});
	$('#selectTag span').click(function() {
		showSelectTag($(this).text());
	});
	$('#account').keyup(function() {
		validataAccount();
	});
	$('#account').click(function() {
		validataAccount();
	});
	$('#account').focusout(function() {
		if (isTrueAccount) {
			resetInput($(this));
		} else {
			validataAccount();
		}

	});
	$('#nowRegister').click(function() {
		registerUser();
	});
	$('#passWords').keyup(function() {
		passValidate();
	});
	$('#passWords').focusout(function() {
		if (isTruePass) {
			resetInput($(this));
		} else {
			passValidate();
		}
	});
	$('#validataCodeInput').keyup(function() {
		validateCode();
	});
	$('#validataCodeInput').focusout(function() {
		if (isTrueCode) {
			resetInput($(this));
		} else {
			validateCode();
		}

	});
}

// 重设输入框
function resetInput(inputObj) {
	inputObj.css({
		"borderColor" : "rgb(204,204,204)",
		"boxShadow" : "0 0 0px red"
	});
}
// 验证码验证
function validateCode() {
	var codeInput = $('#validataCodeInput');
	var codeInputVal = codeInput.val();
	var codeInputLen = codeInputVal.length;
	var validateCodePoint = $('#validateCodePoint');
	if (codeInputLen == 4) {
		ValidateDWR
				.isValidateCode(
						codeInputVal,
						function(result) {
							if (result == false) {
								validateCodePoint
										.html("<font color='red' size='2'>验证码错误!</font>");
								errorInput(codeInput);
								isTrueCode = false;
							} else {
								validateCodePoint
										.html("<font color='gray' size='2'>正确</font>");
								;
								successInput(codeInput);
								isTrueCode = true;
							}
						});
	} else {
		validateCodePoint.html("<font color='red' size='2'>验证码错误!</font>");
		errorInput(codeInput);
		isTrueCode = false;
	}

}
// 密码验证
function passValidate() {
	var pass = $('#passWords');
	if (pass.val().length > 5) {
		pass.tooltip('update', '<font color="black">密码可用</font>');
		successInput(pass);
		isTruePass = true;
	} else {
		pass.tooltip('update', '<font color="red">请输入6-14位密码</font>');
		errorInput(pass);
		isTruePass = false;
	}
}
// 用户注册
function registerUser() {
	if (isTrueAccount && isTrueCode && isTruePass) {
		var sex = $(".sexDiv input:checked").val();
		var age = $("#selectAge option:checked").val();
		var city = $("#bPlace option:checked").val();
		var town = $("#sPlace option:checked").val();
		var marriage = $(".marriageDiv input:checked").val();
		var height = $("#heightSelect option:checked").val();
		educationalSelect
		var educational = $("#educationalSelect option:checked").val();
		var income = $("#incomeSelect option:checked").val();
		var account = $('#account').val();
		var passWords = $('#passWords').val();
		var nickName = $('#nickName').val();
		var tagArray = new Array();
		$('#myTagDiv span').each(function() {
			tagArray.push($(this).text());
		});
		var tag = JSON.stringify(tagArray);
		var introduction = $("#introduction").val();
		$.post("registerAction.action", {
			"sex" : sex,
			"age" : age,
			"city" : city,
			"town" : town,
			"marriage" : marriage,
			"height" : height,
			"income" : income,
			"educational" : educational,
			"account" : account,
			"passWords" : passWords,
			"nickName" : nickName,
			"introduction" : introduction,
			"tag" : tag
		}, function(result) {
			if (result) {
				$.post("loginAction.action", {
					"account" : account,
					"passWords" : passWords
				}, function(result) {
					window.location.href = "jsp/myTaoMei/recommend.jsp"
				});
			} else {
				alert("注册失败");
			}

		})
	} else {
		alert("请填写正确的账号信息");
	}

}
// 验证用户名是否合法
function validataAccount() {
	var account = $('#account');
	var accountVal = account.val();
	var accountLen = accountVal.length;
	if (accountLen > 7 && accountLen < 21) {
		if (email.test(accountVal)) {
			ValidateDWR.isAccountRegisted(accountVal, function(result) {
				if (result) {
					account
							.tooltip('update',
									'<font color="black">邮箱可用</font>');
					successInput(account);
					isTrueAccount = true;
				} else {
					account.tooltip('update',
							'<font color="red">邮箱已被注册,请更换!</font>');
					errorInput(account);
					isTrueAccount = false;
				}
			});
		} else {
			account.tooltip('update', '<font color="red">邮箱格式错误!</font>');
			errorInput(account);
			isTrueAccount = false;
		}
	} else {
		account.tooltip('update', '<font color="black">请输入8-20位邮箱</font>');
		isTrueAccount = false;
	}

}
// 错误输入的input标签样式
function errorInput(inputObj) {
	inputObj.css({
		"borderColor" : "red",
		"boxShadow" : "0 0 3px red"
	});
}

function successInput(inputObj) {

	inputObj.css({
		"borderColor" : "rgb(102,175,233)",
		"boxShadow" : "0 0 3px rgb(102,175,240)"
	});
}
// 显示自己选择的标签
function showSelectTag(text) {

	if (isContainsTag(text)) {
		var leng = text.length;
		if (leng == 2) {
			selectTag = "<span class='selectTag1' onclick='$(this).remove()'>"
					+ text
					+ "<img class='closeTag' src='images/register/removeTag.png' '/>"
			"</span>";
		} else if (leng == 3) {
			selectTag = "<span class='selectTag2' onclick='$(this).remove()'>"
					+ text
					+ "<img class='closeTag' src='images/register/removeTag.png'/>"
			"</span>";
		} else {

			selectTag = "<span class='selectTag3' onclick='$(this).remove()'>"
					+ text
					+ "<img class='closeTag' src='images/register/removeTag.png'/>"
			"</span>";
		}

		myTagDiv.append(selectTag);
	}
}

// 判断是否已经选择了正在点击的标签
function isContainsTag(text) {
	var flag = 0;
	$('#myTagDiv span').each(function(index, element) {
		if ($(this).text() == text) {
			flag++;
		}
	});
	return flag == 0;
}
// 常住地点的显示
function showPlace(key, index) {
	var values = nowPlace[index][key];
	var ops = $('#sPlace').get(0).options;
	for (var i = 0; i < values.length; i++) {
		ops[i].text = values[i];
		ops[i].value = values[i];
	}
}
// 更换验证码图片
function changeValidataCode() {
	document.getElementById("validataCodeImg").src = "validataCodeAction.action?"
			+ Math.random();
}