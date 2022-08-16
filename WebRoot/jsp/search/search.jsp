
<%@page import="yucheng.taomei.vo.user.*"%>
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
<title>桃梅网-觅爱</title>
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
<script type="text/javascript" src="dwr/interface/UpdateDWR.js"></script>
<script type="text/javascript" src="dwr/interface/SearchDWR.js"></script>
<link rel="stylesheet" href="css/myTaoMei/title.css" />
<link rel="stylesheet" href="css/search/search.css" />
<link rel="stylesheet" href="css/messageAlert.css" />
<script type="text/javascript" src="js/webSocket/adviceSocket.js"></script>
<script type="text/javascript" src="js/search/search.js"></script>
</head>

<body>
	<%
		UnionUser union = (UnionUser) session.getAttribute("unionUser");
		BaseInfoUser base = union.getBaseInfoUser();
		OtherInfoUser othe = union.getOtherInfoUser();
		QualificationInfoUser qual = union.getQualificationInfoUser();
		AllInfoUser all = (AllInfoUser) session.getAttribute("allInfoUser");
		String unionStr = (String) session.getAttribute("unionUserStr");
		String searchInfoUserStr = session
				.getAttribute("searchInfoUserStr").toString();
	%>
	<input id="users_id" value="<%=base.getUsers_id()%>" type="hidden">
	<div id="unionStr" style="display: none"><%=unionStr%></div>
	<input id="headPicture" type="hidden"
		value="<%=othe.getHeadPicture()%>">
	<input id="myNickName" type="hidden" value="<%=base.getNickName()%>">
	<input id="mySex" type="hidden" value="<%=base.getSex()%>">
	<div id="searchInfoUserStr" style="display: none"><%=searchInfoUserStr%></div>
	<div id="all">
		<!-- 整体头部begin -->
		<div id="allHead">
			<!-- 头部顶部begin -->
			<div id="head">
				<div id="headContent">
					<img id="logo" src="images/register/logo.png">
					<ul class="titleNavLeft">
						<li><a href="#">首页<span class=titleFenGe>|</span></a></li>
						<li><a href="jsp/myTaoMei/recommend.jsp" target="_blank">我的桃梅<span
								class=titleFenGe>|</span></a></li>
						<li><a href="#">梅园<span class=titleFenGe>|</span></a></li>
						<li><a href="searchQualUserAction.action"
							style="color:rgb(236,93,167);)">觅爱<span class=titleFenGe>|</span></a></li>
						<li><a href="newTalkAction.action" target="_blank">俱乐部<span class=titleFenGe>|</span></a></li>
						<li><a href="chatAction.action" target="_blank">畅聊<span class=titleFenGe>|</span></a></li>
						<li><a href="#">晒幸福</a></li>
					</ul>
					<ul class="titleNavRight">
						<li><a href="#">退出</a></li>
						<li><span class="accountInfoText">梅元:</span> <a href="#">
								<%=othe.getMeiyuan()%>
						</a> <span class=titleFenGe></span></li>
						<li><span class="accountInfoText">桃梅ID:</span> <a href="#">
								<%=base.getUsers_id()%>
						</a> <span class=titleFenGe></span></li>
						<li><span class="accountInfoText">hi,</span> <a href="#">
								<%=base.getNickName()%>
						</a> <span class=titleFenGe></span></li>
					</ul>
				</div>
			</div>
			<!-- 头部顶部end -->
		</div>
		<!-- 整体头部end -->

		<!-- 中间部分begin -->
		<div id="allContent">

			<div id="content">

				<!-- 展示搜索用户begin -->
				<div id="showSearchUser">
					<!-- 搜索选项卡begin -->
				<div id="searchQual">
					<div id="searchTabsDiv">
						<div class="searchTab searchTabActive">条件搜索</div>
						<div class="searchTab">热门标签</div>
						<div class="searchTab">精确查找</div>
					</div>
					<div id="fristSearchContent" class="searchContent">
						<table id="qualTable" border="0">
							<tr align="right">
								<td width="22px"><img src="images/search/search.jpg"></td>
								<td width="100px;"><span>我要寻找居住在</span></td>
								<td width="60px"><select id="bPlace" class="qualSelect"
									name="nowPlace">
										<option value="重庆">重庆</option>
										<option value="北京">北京</option>
										<option value="上海">上海</option>
										<option value="广东">广东</option>
										<option value="湖南">湖南</option>
								</select></td>
								<td width="35px"><span>年龄</span></td>
								<td width="55px"><select id="wantLowestAgeSelect"
									class="qualSelect lowest">
										<option value="20">20岁</option>
										<option value="21">21岁</option>
										<option value="22">22岁</option>
										<option value="23">23岁</option>
										<option value="24">24岁</option>
										<option value="25">25岁</option>
										<option value="26">26岁</option>
										<option value="27">27岁</option>
										<option value="28">28岁</option>
										<option value="29">29岁</option>
										<option value="30">30岁</option>
										<option value="31">31岁</option>
										<option value="32">32岁</option>
										<option value="33">33岁</option>
										<option value="34">34岁</option>
										<option value="35">35岁</option>
								</select></td>
								<td width="10px"><span>-</span></td>
								<td width="55px"><select id="wantHighestAgeSelect"
									class="qualSelect lowest">
										<option value="20">20岁</option>
										<option value="21">21岁</option>
										<option value="22">22岁</option>
										<option value="23">23岁</option>
										<option value="24">24岁</option>
										<option value="25">25岁</option>
										<option value="26">26岁</option>
										<option value="27">27岁</option>
										<option value="28">28岁</option>
										<option value="29">29岁</option>
										<option value="30">30岁</option>
										<option value="31">31岁</option>
										<option value="32">32岁</option>
										<option value="33">33岁</option>
										<option value="34">34岁</option>
										<option value="35">35岁</option>
								</select></td>
								<td width="76px"><span>岁的</span><span><%if (base.getSex().equals("男")) {out.print("女");} else {out.print("男");}%></span><span>朋友</span></td>
								<td width="65px"><div class="sureSearch"
										onclick="qualSearch()" class="sureSearch">搜索</div></td>
							</tr>
						</table>
						<table border="0" id="moreQualTable" style="margin-top: 20px;">
							<tr align="right">
								<td width="60px"><input type="checkbox"
									onclick="moreQualChange($(this))"
									style="position: relative;top:-3px"></td>
								<td width="60px"><span>更多条件</span></td>
								<td width="125px"><select id="wantEducationalSelect"
									class="banMoreQual" name="educational">
										<option value="高中中专及以下">高中中专及以下</option>
										<option value="大专">大专</option>
										<option value="本科">本科</option>
										<option value="双学士">双学士</option>
										<option value="硕士">硕士</option>
										<option value="博士">博士</option>
										<option value="博士后">博士后</option>
								</select></td>
								<td width="125px"><select id="wantIncomeSelect"
									class="banMoreQual">
										<option value="2000元以下">2000元以下</option>
										<option value=2000-5000元>2000-5000元</option>
										<option value="5000-10000元">5000-10000元</option>
										<option value="10000-20000元">10000-20000元</option>
										<option value="20000元以上">20000元以上</option>
								</select></td>
								<td width="90px"><select id="wantLowestHeightSelect"
									class="banMoreQual lowest">
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
										<option value="170">170厘米</option>
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
								</select></td>
								<td width="10px">-</td>
								<td width="72px"><select id="wantHighestHeightSelect"
									class="banMoreQual height">
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
										<option value="170">170厘米</option>
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
								</select></td>
								<td width="68px"><select id="marriageSelect"
									class="banMoreQual" name="marriage">
										<option value="未婚">未婚</option>
										<option value="已婚">已婚</option>
										<option value="丧偶">丧偶</option>
								</select></td>
							</tr>
						</table>
					</div>
					<div class="searchContent">
					
						<div id="showTag">
						选择人群标签：
							<span class="searchTag">诚信</span>
							<span class="searchTag">孝顺</span>
							<span class="searchTag">宅心仁厚</span>
							<span class="searchTag">可爱</span>
							<span class="searchTag">爱生活</span>
							<span class="searchTag">正直</span>
							<span class="searchTag">阳光</span>
							<span class="searchTag">有腹肌</span>
							<span class="searchTag">运动</span>
							
						</div>
					</div>
					<div class="searchContent">
						<div class="input-group" style="font-size: 16px;width: 500px;margin: auto;"> 
							<input  class="form-control" style="background: white;" placeholder="请输入用户昵称"/>
							<div class="btn input-group-addon" style="background: rgb(236,93,167)">搜索</div>
						</div>
					</div>
				</div>
				<!-- 搜索选项卡end -->
					<div id="searchResultDiv">
						<span class="searchResultSpan">共搜索到</span><span
							id="searchResultCount"></span><span class="searchResultSpan">位符合您要求的用户</span>
					</div>
					<table id="searchUserTable" border="0">
					
					</table>
					
				</div>
				<!-- 展示搜索用户end -->
			</div>

		</div>
		<!-- 中间部分begin -->
		<div id="footer">
			<img src="images/login/footer.png">
		</div>
	</div>
	<!-- 消息弹出框begin -->
	<div id="messageAlert">
		<div id="closeMessageAlert" onclick="stopBrowserFlash()"
			style="cursor: pointer;"></div>
		<img id="message_head" src="images/1468475002907A42DA1B_c.jpg">
		<div id="messageContent">
			<p id="messageNickName">：
			<p>
			<p id="messageText"></p>
			<a id="messageOpre1" target="_blank" onclick="stopBrowserFlash()"></a><a
				onclick="stopBrowserFlash()" id="messageOpre2" target="_blank"></a>
		</div>
	</div>
	<!-- 消息弹出框end -->
</body>

</html>