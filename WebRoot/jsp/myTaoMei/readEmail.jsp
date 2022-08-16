<%@page import="yucheng.taomei.vo.email.ShowOneEmail"%>
<%@page import="yucheng.taomei.vo.user.OtherInfoUser"%>
<%@page import="yucheng.taomei.vo.user.QualificationInfoUser"%>
<%@page import="yucheng.taomei.vo.user.DetailedInfoUser"%>
<%@page import="yucheng.taomei.vo.user.UnionUser"%>
<%@page import="yucheng.taomei.vo.user.BaseInfoUser"%>
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
<title>桃梅网-交友中心</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/reset.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet"
	href="resource/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
<script type="text/javascript"
	src="resource/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="resource/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="resource/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css"
	href="resource/easyui/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="resource/easyui/themes/icon.css" />

<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>
<script type="text/javascript" src="dwr/interface/ValidateDWR.js"></script>
<script type="text/javascript" src="dwr/interface/SearchDWR.js"></script>
<script type="text/javascript" src="dwr/interface/UpdateDWR.js"></script>
<link rel="stylesheet" href="css/myTaoMei/title.css" />
<link rel="stylesheet" href="css/myTaoMei/left.css" />
<link rel="stylesheet" href="css/myTaoMei/readEmail.css" />
<script type="text/javascript" src="js/myTaoMei/left.js"></script>
<link rel="stylesheet" href="css/messageAlert.css" />
<script type="text/javascript" src="js/webSocket/adviceSocket.js"></script>
<script type="text/javascript" src="js/myTaoMei/readEmail.js"></script>

</head>

<body>
	<%
		UnionUser union = (UnionUser) session.getAttribute("unionUser");
		BaseInfoUser base = union.getBaseInfoUser();
		OtherInfoUser othe = union.getOtherInfoUser();
		String unionStr = (String) session.getAttribute("unionUserStr");
		ShowOneEmail oneEmail = (ShowOneEmail)session.getAttribute("oneEmail");
		String oneEmailStr = session.getAttribute("oneEmailStr").toString();
	%>
	<input id="from_id" type="hidden" value="<%=base.getUsers_id()%>">
	<input id="users_id" value="<%=base.getUsers_id()%>" type="hidden">
	<input id="t_id" value="<%=oneEmail.getUsers_id()%>" type="hidden">
	<input id="myNickName" type="hidden" value="<%=base.getNickName() %>">
	<input id="headPicture" type="hidden" value="<%=othe.getHeadPicture() %>">
	<input id="email_id" value="<%=oneEmail.getEmail_id()%>" type="hidden">
	<input id="t_sex" value="<%=oneEmail.getSex()%>" type="hidden">
	<div id="oneEmailStr" style="display: none"><%=oneEmailStr%></div>
	<div id="unionStr" style="display: none"><%=unionStr%></div>
	<div id="all">
		<!-- 整体头部begin -->
		<div id="allHead">

			<!-- 头部顶部begin -->
			<div id="head">
				<div id="headContent">
					<img id="logo" src="images/register/logo.png">
					<ul class="titleNavLeft">
						<li><a href="#">首页<span class=titleFenGe>|</span></a></li>
						<li><a href="jsp/myTaoMei/recommend.jsp" style="color:rgb(236,93,167);)">我的桃梅<span
								class=titleFenGe>|</span></a></li>
						<li><a href="#">梅园<span class=titleFenGe>|</span></a></li>
						<li><a href="searchQualUserAction.action" target="_blank">觅爱<span class=titleFenGe>|</span></a></li>
						<li><a href="newTalkAction.action" target="_blank">俱乐部<span class=titleFenGe>|</span></a></li>
						<li><a href="chatAction.action" target="_blank">畅聊<span class=titleFenGe>|</span></a></li>
						<li><a href="#">晒幸福</a></li>
					</ul>
					<ul class="titleNavRight">
						<li><a href="#">退出</a></li>
						<li><span class="accountInfoText">梅元:</span> <a href="#"><%=othe.getMeiyuan()%></a>
							<span class=titleFenGe></span></li>
						<li><span class="accountInfoText">桃梅ID:</span><a href="#"><%=base.getUsers_id()%></a>
							<span class=titleFenGe></span></li>
						<li><span class="accountInfoText">hi,</span> <a href="#"><%=base.getNickName()%></a>
							<span class=titleFenGe></span></li>
					</ul>
				</div>
			</div>
			<!-- 头部顶部end -->

		</div>
		<!-- 整体头部end -->

		<!--整个内容begin  -->
		<div id="allContent">
			<div id="content">
				<!--左边内容begin  -->
				<div id="allCleft">
					<!--用户信息begin  -->
					<div id="allUserInfo">
						<div id="headAndName">
							<div id="myHeadDiv">
								<%
									if (othe.getHeadPicture() == null) {
								%>
								<img id="myHead" src="images/myTaoMei/defaultMeImg.png"
									border="0">
								<%
									} else {
								%>
								<img id="myHead" src="<%=othe.getHeadPicture()%>" border="0">

								<%
									}
								%>

							</div>

							<p id="myName"><%=base.getNickName()%><a href="jsp/myTaoMei/info.jsp?infoType=all"><img id="updateInfoImg"
									src="images/myTaoMei/updateInfoS.jpg"></a>
							</p>
							<a id="showMyInfo" href="showOneAction.action?users_id=<%=othe.getUsers_id()%>" target="_blank">预览我的信息</a>
						</div>
						<div id="validateAndMY">
							<table id="validateTable" border="0">
								<tr>
										<td><img id="sInfoPerfect" src="images/base/fullInfo2.png" title="资料完整"></td><td><img src="images/base/hasEmal1.png" title="邮箱验证"></td><td><img id="sHeadPicture" src="images/base/hasHead2.png" title="有头像"></td>
									</tr>
									<tr>
										<td><img id="sID" src="images/base/hasID2.png" title="身份验证"></td><td><img id="sPhoto" src="images/base/hasImg2.png" title="生活照"></td><td><img ID="sTelphone" src="images/base/hasPhone2.png" title="手机验证"></td>
									</tr>
							</table>
						</div>
						<div id="rechargeMYdiv">
							<span
								style="margin-top: 12px;margin-left: 10px;display: inline-block;">梅元:</span>
							<span
								style="margin-left: 5px;display: inline-block; color:rgb(233,70,155)"><%=othe.getMeiyuan()%></span>
							<a href="#"
								style="margin-left: 90px;display: inline-block; color:rgb(47,177,209)">充值</a>
						</div>
					</div>
					<!--用户信息end  -->

					<div id="viewLetterDiv">
						<a href="emailListAction.action?spaceType=email" style="color:white;text-decoration: none;" id="viewEmail">信箱</a>
					</div>
					<!-- 我的服务begin -->
					<div id="myServiceDiv">
						<table id="serviceTable" border="0">
							<tr>
								<td colspan="2"><span class="allSelect">我的服务</span></td>
							</tr>
							<tr>
								<td class="suService"><a href="#">[写信免费]</a></td>
								<td class="suService"><a href="#">[消息提示]</a></td>
							</tr>
							<tr>
								<td class="suService"><a href="#">[最优推荐]</a></td>
								<td class="suService"><a href="#">[送礼优惠]</a></td>
							</tr>
						</table>

					</div>
					<!-- 我的服务begin -->

					<!--我的桃梅begin  -->
					<div id="taoMeiDiv">
						<table id="taomeiTable" border="0">
							<tr>
								<td height="40px" colspan="2"><span class="allSelect">交友中心</span></td>
							</tr>
							<tr class="selectTr">
								<td><a href="emailListAction.action?spaceType=attention" class="subSelect">我的关注</a><span class="selectJianTou">></span></td>
							</tr>
							<tr class="selectTr">
								<td><a href="emailListAction.action?spaceType=visitor" class="subSelect">最近访客</a><span class="selectJianTou">></span></td>
							</tr>
							<tr class="selectTr">
								<td><a href="#" class="subSelect">礼品盒</a><span class="selectJianTou">></span></td>
							</tr>
							<tr class="selectTr">
								<td><a href="#" class="subSelect">最近联系人</a><span class="selectJianTou">></span></td>
							</tr>
						</table>
					</div>
					<!--我的桃梅end  -->
					<!--我的资料begin  -->
					<div id="myInfoDiv">
						<table id="infoTable" border="0">
							<tr>
								<td height="40px" colspan="2"><span class="allSelect">我的资料</span></td>

							</tr>
							<tr class="selectTr">
								<td><a href="jsp/myTaoMei/info.jsp?infoType=all" class="subSelect">修改资料</a><span class="selectJianTou">></span></td>
							</tr>
							<tr class="selectTr">
								<td><a href="jsp/myTaoMei/info.jsp?infoType=photo" class="subSelect">我的相册</a><span class="selectJianTou">></span></td>
								
							</tr>
							<tr class="selectTr">
								<td><a href="jsp/myTaoMei/info.jsp?infoType=qual" class="subSelect">择偶标准</a><span class="selectJianTou">></span></td>
								
							</tr>
							<tr class="selectTr">
								<td><a href="jsp/myTaoMei/info.jsp?infoType=heart" class="subSelect">内心独白</a><span class="selectJianTou">></span></td>

							</tr>
							<tr class="selectTr">
								<td><a href="jsp/myTaoMei/info.jsp?infoType=vali" class="subSelect">诚信认证</a><span class="selectJianTou">></span></td>
							</tr>

						</table>
					</div>
					<!--我的资料end  -->
				</div>
				<!--左边内容end -->

				<!-- 右边内容begin -->
				<div id="allCRight">
					<!-- 读信提醒begin -->
					<div id="readEmailPoint"><img src="images/writeEmail/readEmailPoint.png">桃梅提醒：请选择自己熟悉的环境见面，不要与刚认识的异性有任何金钱来往，以防被骗。
						<div id="backEmailList"><a href="emailListAction.action?spaceType=email" style="text-decoration:  none;">返回列表</a></div>
					</div>
					<!-- 读信提醒end -->
					
					<!-- 用户资料begin -->
					<div id="usersInfo">
						<div id="headPictureDiv">
							<a><img src="<%=oneEmail.getHeadPicture() %>"></a>
						</div>
						<div id="textInfoDiv"><img id="writeEmailLogo" src="images/writeEmail/recipient_topbg.png">
							<span id="nickName"><%=oneEmail.getNickName() %></span><img id="validate" src="images/base/hasHead1.png" title="有头像"><a id="viewInfo" href="showOneAction.action?users_id=<%=oneEmail.getUsers_id() %>" target="_blank">查看详情</a>
							<p id="baseInfo"><%=oneEmail.getAge() %>岁，<%=oneEmail.getMarriage() %>，<%=oneEmail.getHeight() %>cm，<%=oneEmail.getEducational() %>，<%=oneEmail.getCity() %><%=oneEmail.getTown() %>，<%=oneEmail.getIncome() %></p>
							<span id="photoCount">照片：<a><%=oneEmail.getPhotoCount() %>张</a></span><span id="lastLoginTime">最后登录时间：<%=oneEmail.getLastLoginTime() %></span>
						</div>
					</div>
					<!-- 用户资料end -->
					
					<!-- 私信内容begin -->
					<div id="emailContent">
						<div id="newEmailContent">
							<span id="newNickName"></span><span class="emTime"></span>
							<p class="emText"></p>
						</div>
						
						
						<div id="opretion">
							<img src="images/myTaoMei/useModel.png"><span id="writeModel" class="opretionText">使用模板</span>
							<img src="images/myTaoMei/noLove.png"><span id="writeNo" class="opretionText">礼貌拒绝</span>
							<img src="images/myTaoMei/gift.png"><span class="opretionText">赠送礼物</span>
						</div>
						<div id="writeBackDiv">
							<textarea id="writeBackArea" cols="112" rows="5" style="padding: 10px 20px 20px 20px"></textarea>
						</div>
						<div class="sureWriteBack" id="sureWriteBack">
							免费回复
						</div>
					</div>
					<!-- 私信内容end -->
				</div>
				<!-- 右边内容end -->
			</div>

		</div>
		<!--整个内容end  -->
		<div id="footer">
			<img src="images/login/footer.png">
		</div>
	</div>
	
		<!-- 消息弹出框begin -->
		<div id="messageAlert">
			<div id="closeMessageAlert" onclick="stopBrowserFlash()" style="cursor: pointer;"></div>
			<img id="message_head" src="images/1468475002907A42DA1B_c.jpg" >
			<div id="messageContent">
				<p id="messageNickName">：<p>
				<p id="messageText"></p>
				<a id="messageOpre1" target="_blank"  onclick="stopBrowserFlash()"></a><a  onclick="stopBrowserFlash()" id="messageOpre2" target="_blank"></a>
			</div>
		</div>
		<!-- 消息弹出框end -->
</body>

</html>