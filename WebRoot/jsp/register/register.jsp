<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>桃梅网-注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet" href="resource/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="resource/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>

<script type="text/javascript" src="resource/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resource/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/gray/tabs.css" />
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/gray/tooltip.css" />
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/icon.css" />

<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>
<script type="text/javascript" src="dwr/interface/ValidateDWR.js"></script>
<link rel="stylesheet" href="css/register/register.css" />
<link rel="stylesheet" href="css/reset.css" />
<script type="text/javascript" src="js/register/register.js"></script>



</head>

<body>
	<div id="all">
		<!-- 内容egin -->
		<div id="content">
			<div id="left">
				<ul>
					<li><img src="images/register/logo.png"></li>
					<li class="leftImg"><img src="images/register/loginBGLeft.png"></li>
					<li>
						<div>
							<p style="font-size: 25px;text-align: center;margin-top: 100px;">超多注册会员</p>
							<p style="font-size: 17px;color:rgb(100,100,100);text-align: center;margin-top: 20px;">给你万一挑一的机会</p>
							<p style="font-size: 25px;text-align: center;margin-top: 60px;">成功率高</p>
							<p style="font-size: 17px;color:rgb(100,100,100);text-align: center;margin-top: 20px;">千万会员，见证幸福</p>
						</div>
					</li>
				</ul>
			</div>

			<!-- 内容右边begin -->
			<div id="right">
				<div id="title">
					<table>
						<tr>
							<td valign="top"><img id="titleImgLeft"
								src="images/register/litleImg1.png"></td>
							<td>
								<div id="titleTextDiv">
									<p id="titleText1">友情诚可贵，爱情价更高</p>
									<br>
									<p id="titleText2">耍朋友，你至少还是要认真填写资料，注册个账号吧?</p>
								</div>
							</td>
							<td valign="top"><img id="titleImgRight"
								src="images/register/litleImg2.png"></td>
						</tr>
						
					</table>
				</div>
				
				<!-- 全部信息begin -->
				<div id="allUserInfo">
					<form id="userInfoForm" action="registerAction" method="post">
					<table id="userInfoTable" >
						<!-- 填写性别begin -->
						<tr>
							<td>我是</td>
							<td>
								<div class="sexDiv">
									<input id="boy" type="radio" name="sex" value="男" checked="checked"> <img
										src="images/register/boy.png"> <label for="boy"
										class="labelText">男</label>
								</div>
							</td>
							<td>
								<div class="sexDiv" style="margin-right: 60px">
									<input id="gril" name="sex" type="radio" value="女"> <img
										src="images/register/girl.png"> <label for="gril"
										class="labelText">女</label>
								</div>
							</td>
							
							<td class="infoPointText">
								*注册后无法更改
							</td>
						</tr>
						<!-- 填写性别end -->
						
						<!-- 填写年龄 -->
						<tr>
							<td>年龄</td>
							<td colspan="2">
								<select class="selectInfo" id="selectAge" name="age">
									<option value="20">20岁&nbsp;&nbsp;&nbsp;青春年华</option>
									<option value="21">21岁&nbsp;&nbsp;&nbsp;青春年华</option>
									<option value="22">22岁&nbsp;&nbsp;&nbsp;青春年华</option>
									<option value="23">23岁&nbsp;&nbsp;&nbsp;青春年华</option>
									<option value="24">24岁&nbsp;&nbsp;&nbsp;青春年华</option>
									<option value="25">25岁&nbsp;&nbsp;&nbsp;青春年华</option>
									<option value="26">26岁&nbsp;&nbsp;&nbsp;奋斗青年</option>
									<option value="27">27岁&nbsp;&nbsp;&nbsp;奋斗青年</option>
									<option value="28">28岁&nbsp;&nbsp;&nbsp;奋斗青年</option>
									<option value="29">29岁&nbsp;&nbsp;&nbsp;奋斗青年</option>
									<option value="30">30岁&nbsp;&nbsp;&nbsp;奋斗青年</option>
									<option value="31">31岁&nbsp;&nbsp;&nbsp;事业有成</option>
									<option value="32">32岁&nbsp;&nbsp;&nbsp;事业有成</option>
									<option value="33">33岁&nbsp;&nbsp;&nbsp;事业有成</option>
									<option value="34">34岁&nbsp;&nbsp;&nbsp;事业有成</option>
									<option value="35">35岁&nbsp;&nbsp;&nbsp;事业有成</option>
									<option value="保密">保密</option>
								</select>
							</td>
							<td rowspan="5">
								<div id="LoginDiv">
									<a href="index.jsp">会员登陆</a>
								</div>
								
							</td>
						</tr>
						<!-- 填写年龄end -->
						
						<!--填写常住地begin  -->
						<tr>
							<td>现居地</td>
							<td>
								<select id="bPlace" class="selectNowPlace" name="nowPlace">
									<option value="重庆">重庆</option>
									<option value="北京">北京</option>
									<option value="上海">上海</option>
									<option value="广东">广东</option>
									<option value="湖南">湖南</option>
								</select>							
							</td>
							<td>
								<select id="sPlace" class="selectNowPlace" name="nowPlace">
									<option value="巴南">巴南</option>
									<option value="江北">江北</option>
									<option value="南岸">南岸</option>
									<option value="双桥">双桥</option>
									<option value="万州">万州</option>
								</select>						
							</td>
						</tr>
						<!--填写常住地end  -->
						
						<!-- 填写婚姻状况begin -->
							<tr>
								<td>婚姻状况</td>
								<td colspan="2">
										<div class="marriageDiv">
											<input  name="marriage" type="radio" value="未婚" checked="checked"> 
											<label class="labelText">未婚</label>
										</div>
										<div class="marriageDiv">
											<input  name="marriage" type="radio" value="已婚"> 
											<label class="labelText">已婚</label>
										</div>
										<div class="marriageDiv">
											<input  name="marriage" type="radio" value="丧偶"> 
											<label class="labelText">丧偶</label>
										</div>
										<div class="marriageDiv">
											<input  name="marriage" type="radio" value="保密"> 
											<label class="labelText">保密</label>
										</div>
								</td>
								
							</tr>						
						<!-- 填写婚姻状况end -->
						
						<!-- 填写身高begin -->
						<tr>
							<td>身高</td>
							<td colspan="2">
								<select id="heightSelect" class="selectInfo" name="height">
									<option value="160">160厘米</option>
									<option value="161">161厘米</option>
									<option value="162">162厘米</option>
									<option value="163">163厘米</option>
									<option value="164">164厘米</option>
									<option value="165">165厘米</option>
									<option value="166">166厘米</option>
									<option value="167">167厘米</option>
									<option value="168">168厘米</option>
									<option value="169">169厘米</option>
									<option value="170"  selected="selected">170厘米</option>
									<option value="171">171厘米</option>
									<option value="172">172厘米</option>
									<option value="173">173厘米</option>
									<option value="174">174厘米</option>
									<option value="175">175厘米</option>
									<option value="176">176厘米</option>
									<option value="177">177厘米</option>
									<option value="178">178厘米</option>
									<option value="179">179厘米</option>
									<option value="180">180厘米</option>
									<option value="保密">保密</option>
								</select>
							</td>
							
						</tr>
						<!-- 填写身高end -->
						
						<!-- 填写学历begin -->
						<tr>
							<td>学历</td>
							<td colspan="2">
								<select id="educationalSelect" class="selectInfo" name="educational">
									<option value="高中中专及以下">高中中专及以下</option>
									<option value="大专">大专</option>
									<option value="本科"  selected="selected">本科</option>
									<option value="双学士">双学士</option>
									<option value="硕士">硕士</option>
									<option value="博士">博士</option>
									<option value="博士后">博士后</option>
									<option value="保密">保密</option>
								</select>
							</td>
							
						</tr>
						<!-- 填写学历end -->
						
						<!-- 填写月薪begin -->
						<tr>
							<td>月薪</td>
							<td colspan="2">
								<select id="incomeSelect" class="selectInfo" name="income">
									<option value="2000元以下">2000元以下</option>
									<option value=2000-5000元>2000-5000元</option>
									<option value="5000-10000元"  selected="selected">5000-10000元</option>
									<option value="10000-20000元">10000-20000元</option>
									<option value="20000元以上">20000元以上</option>
									<option value="保密">保密</option>
								</select>
							</td>
							
						</tr>
						<!-- 填写学历end -->
						
						<!-- 填写账号begin -->
							<tr>
								<td>邮箱</td>
								<td colspan="3">
									<input id="account" name="account" class="accountInfo form-control">
								</td>
								
							</tr>
						<!-- 填写账号end -->
						
						<!-- 填写密码begin -->
							<tr>
								<td>密码</td>
								<td colspan="3">
									<input id="passWords" maxlength="14" name="passWords" type="password" class="accountInfo form-control">
								</td>
								
							</tr>
						<!-- 填写密码end -->
						
						<!-- 填写昵称begin -->
							<tr>
								<td>昵称</td>
								<td colspan="3">
									<input maxlength="10" id="nickName" class="accountInfo form-control">
								</td>
							</tr>
						<!-- 填写昵称end -->
						
						<!-- 填写自我介绍begin -->
						<tr>
							<td valign="top"><span  style="position: relative;top:20px;">自我介绍</span></td>
							<td colspan="3">
								<div  class="easyui-tabs" data-options="plain:true" style="width: 400px; margin-left: 20px;margin-top:10px">
									<div id="selectTag" title="贴标签" >
										<div class="tagPoint">
											请选择几个标签让更多的人了解你,稍后可修改!<img id="closeTagPointImg" style="margin-left: 30px;cursor: pointer;" src="images/register/closeTagPoint.png">
										</div>
										<div id="myTagDiv">
											<span class='selectTag2' onclick="$(this).remove()">爱运动<img class='closeTag' src='images/register/removeTag.png' /></span>
											<span class='selectTag1' onclick="$(this).remove()">运动<img class='closeTag' src='images/register/removeTag.png' /></span>
											<span class='selectTag3' onclick="$(this).remove()">宅心仁厚<img class='closeTag' src='images/register/removeTag.png' /></span>
											<span class='selectTag1' onclick="$(this).remove()">旅行<img class='closeTag' src='images/register/removeTag.png' /></span>
											<span class='selectTag1' onclick="$(this).remove()">阳光<img class='closeTag' src='images/register/removeTag.png' /></span>
											<span class='selectTag3' onclick="$(this).remove()">小酌两杯<img class='closeTag' src='images/register/removeTag.png' /></span>
										</div>
										<div id="showTag">
											<span class="baseTag3 blueTagColor">宅心仁厚</span>
											<span class="baseTag1 redTagColor">可爱</span>
											<span class="baseTag1 xxxTagColor">诚信</span>
											<span class="baseTag1 blueTagColor">孝顺</span>
											<span class="baseTag1 redTagColor">正直</span>
											<span class="baseTag1 xxxTagColor">阳光</span>
											<span class="baseTag2 redTagColor">有腹肌</span>
											<span class="baseTag1 blueTagColor">运动</span>
											<span class="baseTag1 xxxTagColor">工作狂</span>
											<span class="baseTag3 blueTagColor">潮流女王</span>
											<span class="baseTag2 redTagColor">爱生活</span>
											<span class="baseTag1 redTagColor">内敛</span>
											<span class="baseTag1 xxxTagColor">运动</span>
											<span class="baseTag1 blueTagColor">网游</span>
											<span class="baseTag3 redTagColor">小酌两杯</span>
											<span class="baseTag1 blueTagColor">旅行</span>
											<span class="baseTag1 xxxTagColor">潮男</span>
										</div>
										
									</div>
									<div title="内心独白">
									<textarea id="introduction" rows="8" cols="55"></textarea>
									</div>
								</div>
							</td>
						</tr>						
						<!-- 先写自我介绍end -->
						
						<!--验证码显示begin  -->
						<tr>
							<td>&nbsp;</td>
							<td colspan="3">
								<div id="allValidata">
									<img id="validataCodeImg" src="validataCodeAction.action" onclick="changeValidataCode()"><p>防止恶意注册,请输入图中的字符</p>
									<span onclick="changeValidataCode()">看不清,换一张</span>
								</div>
							</td>
						</tr>
						<!--验证码显示end  -->
						
						<!-- 输入验证码begin -->
						<tr>
							<td>验证码</td>
							<td><input maxlength="4" id="validataCodeInput" class="form-control"></td>
							<td><span id="validateCodePoint"></span></td>
						</tr>
						<!-- 输入验证码end -->
						
						<!-- 注册按钮begin -->
						<tr>
							<td>&nbsp;</td>
							<td colspan="2">
								<div id="nowRegister">立即注册</div>
							</td>
						</tr>
						<!-- 注册按钮end -->
						
						<!--承诺begin  -->
						<tr>
							<td>&nbsp;</td>
							<td colspan="3"><span id="chengnuo">我承诺年满18岁、单身、抱着严肃的态度，真诚寻找另一半</span></td>
						</tr>
						<!--承诺end  -->
					</table>
					</form>
				</div>
				<!-- 全部信息ending -->
				
			</div>
			<!-- 内容右边end -->

		</div>
		<!--
            	内容end
            -->
		<div id="footer">
			<img src="images/login/footer.png">
		</div>
	</div>
</body>
</html>
