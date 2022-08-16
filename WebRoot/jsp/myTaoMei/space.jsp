<%@page import="yucheng.taomei.vo.email.*"%>
<%@page import="yucheng.taomei.factory.*" %>
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
	String infoType = request.getParameter("infoType");
		UnionUser union = (UnionUser) session.getAttribute("unionUser");
		String unionStr = (String) session.getAttribute("unionUserStr");
		BaseInfoUser base = union.getBaseInfoUser();
		OtherInfoUser othe = union.getOtherInfoUser();
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
<script type="text/javascript" src="dwr/interface/SearchDWR.js"></script>
<link rel="stylesheet" href="css/myTaoMei/title.css" />
<link rel="stylesheet" href="css/myTaoMei/left.css" />
<link rel="stylesheet" href="css/myTaoMei/space.css" />
<script type="text/javascript" src="js/myTaoMei/left.js"></script>
<script type="text/javascript" src="js/myTaoMei/space.js"></script>

</head>

<body>
	<%
		AllListEmail allListEmail = (AllListEmail)session.getAttribute("allListEmail");
		List<ListEmail> emails = allListEmail.getListEmail();
		String spaceType = request.getParameter("spaceType");
		String visitorList = session.getAttribute("visitorList").toString();
		String attentionList = session.getAttribute("attentionList").toString();
	%>
	<input id="infoType" value="<%=infoType%>" type="hidden">
	<input id="users_id" value="<%=base.getUsers_id()%>" type="hidden">
	<input id="spaceType" value="<%=spaceType%>" type="hidden">
	<div id="unionStr" style="display: none"><%=unionStr%></div>
	<div id="visitorList" style="display: none"><%=visitorList%></div>
	<div id="attentionList" style="display: none"><%=attentionList%></div>
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
					<div id="rightTitle">
						<img id="rightInfoImg" src="images/base/hasEmal1.png" style="width: 51px;height: 52px">
						<p id="rightInfoText1">交友中心</p>
						<div id="rightTitleInfoPerfect">
							<% if(allListEmail.getEmailSize()!=0){%>
									<span id="rightTitleInfoPerfectText">信箱已读：<span style="color:rgb(80,80,80)"><%=(allListEmail.getEmailSize()-allListEmail.getUnRead()) * 100 / allListEmail.getEmailSize()%>%</span></span>
								<%}else{ %>
									<span id="rightTitleInfoPerfectText">信箱已读：<span style="color:rgb(80,80,80)">0</span></span>
								<%} %>
							
							<div class="progress">
								<% if(allListEmail.getEmailSize()!=0){%>
									<div
										class="progress-bar progress-bar-success progress-bar-striped active"
										style="min-width:50px;width: <%=(allListEmail.getEmailSize()-allListEmail.getUnRead()) * 100 / allListEmail.getEmailSize()%>%;"><%=allListEmail.getEmailSize()-allListEmail.getUnRead()%> /<%=allListEmail.getEmailSize()%>
									</div>
								<%}else{ %>
									<div
										class="progress-bar progress-bar-success progress-bar-striped active"
										style="min-width:50px;width: 100%;">无私信
									</div>
								<%} %>
							</div>
						</div>
						<span id="rightInfoText2">请不与他人发生经济往来</span>

					</div>

					<ul class="nav nav-tabs" id="palTabs">
						<li><a href="#email" data-toggle="tab">我的私信</a></li>
						<li><a href="#attention" data-toggle="tab">我的关注</a></li>
						<li><a href="#visitor" data-toggle="tab">最近访客</a></li>
						
						<li><a href="#qualification" data-toggle="tab">礼品盒</a></li>
						<li><a href="#upHead" data-toggle="tab">最近联系人</a></li>
					</ul>
					<div class="tab-content">
						<!--我的私信begin-->
						<div class="tab-pane fade" id="email">
								<table id="emailTable" width="750" border="0" style="margin:0px auto auto 30px;">
									<%
										for(int i=0;i<emails.size();i++) {ListEmail email = emails.get(i);
									%>
									<tr>
										<td width="30px"><input type="checkbox" class="deleteEmail"><input type="hidden" value="<%=email.getEmail_id()%>"></td>
										<td width="30px">
											<%if(email.isState()){ %>
													<img src="images/myTaoMei/yidu.png" class="emailStateImg">
											<%}else{ %>
													<img src="images/myTaoMei/weidu.png" class="emailStateImg">
											<%} %>			
										</td>
										<td width="40px"><div class="emailHeadDiv"><a href="readEmailAction.action?users_id=<%=email.gettID() %>&email_id=<%=email.getEmail_id() %>"><img class="emailHead" src="<%=email.getHeadPicture()%>"></a></div></td>
										<td width="50px">
											<div class="emailInfoDiv">
												<p class="emBaseInfo"><a href="readEmailAction.action?users_id=<%=email.gettID() %>&email_id=<%=email.getEmail_id() %>"><span class="emNickName"><%=email.getNickName() %></span><span><%=email.getAge() %>岁</span><span><%=email.getCity() %></span></a></p>
												<p class="emDetaInfo"><a href="readEmailAction.action?users_id=<%=email.gettID() %>&email_id=<%=email.getEmail_id() %>"><span class="emTime"><%=email.getEmailTime() %>前</span><span><%if(email.isYou()){%>你发出的私信<% }else{%>给你发来的私信<%} %></span><span>共有</span><span class="emCount"><%=email.getContentSize() %></span><span>条消息</span></a></p>
											</div>
										</td>
										<td width="50px">
											<%if(email.isState()){%>
												<div class="yiduEmail"></div>
											<%}else{ %>
												<div class="viewEmail"><a href="readEmailAction.action?users_id=<%=email.gettID() %>&email_id=<%=email.getEmail_id() %>" style="color:white">查看私信</a></div>
											<%} %>
											
										</td>
									</tr>
									<%} %>
								</table>
								
								<% if(allListEmail.getEmailSize()==0){%>
									<div style="text-align: center;margin: 20px auto 20px 20px;" >
										没有私信
									</div>
									
								<%}else{%>
									<div id="deletePoint">
										<p>私信删除之后无法恢复</p>
										<div onclick="deleteEmail()">确定</div>
									</div>
									<div id="emailOpreation">
										<input id="allEmailSelect" type="checkbox" onclick="allSelectEmail()">
										<span style="font-size: 13px;color:rgb(100,100,100);margin: -15px auto auto 20px;">全选</span>
										<span id="deleteEmail" onclick="isDelete();">删除</span>
									</div>
									<div id="emailPagination" id="emailPagination">
									<ul class="pagination">
										<li><a href="javascript:void(0)">&laquo;</a></li>
										<li class="active"><a class="emailPage" href="javascript:void(0)">1</a></li>
										<%for(int i=1;i<Math.ceil(allListEmail.getEmailSize()/10.0);i++){%>
											<li><a class="emailPage" href="javascript:void(0)"><%=i+1 %></a></li>
										<%} %>
										<li><a href="javascript:void(0)">&raquo;</a></li>
									</ul>
								</div>
								
								<% }%>
						</div>
						<!-- 我的私信end -->
						
						<!--我的关注begin  -->
						<div class="tab-pane fade" id="attention">
							<div id="allAttentionDiv" >
								
							</div>
						</div>
						<!--我的关注end  -->
						
						<!-- 最近访客begin -->
						<div class="tab-pane fade" id="visitor">
							<table id="visitorTable" border="0">
								
							</table>
						</div>
						<!-- 最近访客end -->

						

						<!-- 征友标准begin -->
						<div class="tab-pane fade" id="qualification">
							
						</div>
						<!-- 征友标准end -->
						<div class="tab-pane fade" id="upHead">
							
						</div>

						
					</div>

				</div>
				<!-- 右边内容end -->
			</div>

		</div>
		<!--整个内容end  -->
		<div id="footer">
			<img src="images/login/footer.png">
		</div>
		  
</div>
	
</body>

</html>