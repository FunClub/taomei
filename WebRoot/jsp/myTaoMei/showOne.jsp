<%@page import="yucheng.taomei.vo.user.AllInfoUser"%>
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
		BaseInfoUser base = union.getBaseInfoUser();
		OtherInfoUser othe = union.getOtherInfoUser();
		AllInfoUser all = (AllInfoUser)session.getAttribute("allInfoUser");
		String allInfoStr = session.getAttribute("allInfoStr").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">
		<title><%=all.getNickName() %>的个人资料</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" href="css/reset.css" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<link rel="stylesheet" href="resource/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
		<script type="text/javascript" src="resource/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>

		<script type="text/javascript" src="resource/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="resource/easyui/locale/easyui-lang-zh_CN.js"></script>
		<link rel="stylesheet" type="text/css" href="resource/easyui/themes/gray/easyui.css" />
		<link rel="stylesheet" type="text/css" href="resource/easyui/themes/icon.css" />

		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="dwr/interface/ValidateDWR.js"></script>
		<script type="text/javascript" src="dwr/interface/UpdateDWR.js"></script>
		<link rel="stylesheet" href="css/myTaoMei/title.css" />
		<link rel="stylesheet" href="css/showOne.css" />
		<link rel="stylesheet" href="css/messageAlert.css" />
		<script type="text/javascript" src="js/webSocket/adviceSocket.js"></script>
		<script type="text/javascript" src="js/myTaoMei/showOne.js"></script>
		
		
	</head>

	<body>
		<input id="infoType" value="<%=infoType%>" type="hidden">
		<input id="users_id" value="<%=base.getUsers_id()%>" type="hidden">
		<input id="from_id" type="hidden" value="<%=base.getUsers_id()%>">
		<input id="to_id" type="hidden" value="<%=all.getUsers_id()%>">
		<input id="headPicture" type="hidden" value="<%=othe.getHeadPicture() %>">
		<input id="myNickName" type="hidden" value="<%=base.getNickName() %>">
		<input id="mySex" type="hidden" value="<%=base.getSex() %>">
		<div id="allInfoStr" style="display: none;">
			<%=allInfoStr %>
		</div>
		<div id="all">
			<!-- 整体头部begin -->
			<div id="allHead">
				<!-- 头部顶部begin -->
				<div id="head">
					<div id="headContent">
						<img id="logo" src="images/register/logo.png">
						<ul class="titleNavLeft">
							<li>
								<a href="#">首页<span class=titleFenGe>|</span></a>
							</li>
							<li>
								<a href="jsp/myTaoMei/recommend.jsp" target="_blank" >我的桃梅<span class=titleFenGe>|</span></a>
							</li>
							<li>
								<a href="#">梅园<span class=titleFenGe>|</span></a>
							</li>
							<li>
								<a href="searchQualUserAction.action" target="_blank" style="color:rgb(236,93,167);)">觅爱<span class=titleFenGe>|</span></a>
							</li>
							<li>
								<a href="newTalkAction.action" target="_blank">俱乐部<span class=titleFenGe>|</span></a>
							</li>
							<li>
								<a href="chatAction.action">畅聊<span class=titleFenGe>|</span></a>
							</li>
							<li>
								<a href="#">晒幸福</a>
							</li>
						</ul>
						<ul class="titleNavRight">
							<li>
								<a href="#">退出</a>
							</li>
							<li><span class="accountInfoText">梅元:</span>
								<a href="#">
									<%=othe.getMeiyuan()%>
								</a>
								<span class=titleFenGe></span></li>
							<li><span class="accountInfoText">桃梅ID:</span>
								<a href="#">
									<%=base.getUsers_id()%>
								</a>
								<span class=titleFenGe></span></li>
							<li><span class="accountInfoText">hi,</span>
								<a href="#">
									<%=base.getNickName()%>
								</a>
								<span class=titleFenGe></span></li>
						</ul>
					</div>
				</div>
				<!-- 头部顶部end -->
			</div>
			<!-- 整体头部end -->

			<!-- 中间部分begin -->
			<div id="allContent">
				<div id="content">
					<!-- top信息begin -->
					<div id="topInfo">
						<div id="headPictureDiv">
							<img id="VIPimg" src="images/VIP.png"> <img id="headPicture" src="<%=all.getHeadPicture()%>">
							<%
								if(base.getUsers_id()!=all.getUsers_id()){%>
								<div id="isOnline">

								<img id="onlineImg" src="images/myTaoMei/person.png"> <%if(all.getSex().equals("男")){out.print("他");}else{out.print("她");} %>在线，快聊聊吧。
							</div>
								<%}
							 %>
							
						</div>
						<div id="updateInfoDiv">
							<%
								if(base.getUsers_id()==all.getUsers_id()){%>
								<a href="jsp/myTaoMei/info.jsp?infoType=all"> <img src="images/myTaoMei/updateInfoS.jpg"> <span>修改资料</span>
								</a>
								<%}
							 %>
							
						</div>
						<div id="baseInfoDiv">
							<div id="topNameDiv">
								<span id="nickName"><%=all.getNickName() %></span>
								<ul id="IDValidateUl">
									
								</ul>
							</div>
							<div id="topSomeInfo">
								<ul id="someInfoUl">
									<li>
										<%=all.getCity() %>,
										<%=all.getTown() %>
									</li>
									<li>
										<%=all.getAge() %>岁</li>
									<li>
										<%=all.getHeight() %>cm</li>
									<li>
										<%=all.getIncome() %>
									</li>
									<li>
										<%=all.getHasHouseAble() %>
									</li>
								</ul>
							</div>
							<div id="showTag">
								
							</div>
							<%
								if(base.getUsers_id()!=all.getUsers_id()){%>
								<div id="opreations">
									<div id="wirterLetter"><a href="writeEmailAction.action?users_id=<%=all.getUsers_id() %>">写私信</a></div>
									<div id="chat"><a href="chatAction.action" style="background: none">聊天</a></div>
									<div id="giveGift">送礼物</div>
									<div id="addFriends" onclick="addFriend()">加好友</div>
								</div>
								<%}
							 %>
							
						</div>
					</div>
					<!-- top信息begin-->

					<!-- 照片信息begin -->
					<div id="allPhotoDiv">
						<table id="photoTable">
							<tr>
								
							</tr>
						</table>
					</div>
					<!-- 照片信息end -->

					<!-- 整体资料begin -->
					<div id="allInfo">
						<!-- 内心独白begin -->
						<div id="allIntroduction" class="subDeta" style="margin-top: 10px;">
							<div class="infoTitle">
								<div></div>
								<span>内心独白</span>
							</div>
							<div class="infoContent">
							<%=all.getIntroduction() %>
							</div>
						</div>
						<!-- 内心独白end-->

						<!-- 详细资料begin -->
						<div id="allDeta" class="subDeta" style="margin-top: 20px">
							<div class="infoTitle">
								<div></div>
								<span>详细资料</span>
							</div>
							<div class="infoContent">
								<table class="infoTable" border="0">
									<tr>
										<td>籍<%for (int i = 0; i < 14; i++) {%>&nbsp;<%}%>贯:
										</td>
										<td><span><%=all.getCity() %></span></td>
									</tr>
									<tr>
										<td>体<%for (int i = 0; i < 14; i++) {%>&nbsp;<%}%>重:
										</td>
										<td><span><%=all.getWeights() %>斤</span></td>
									</tr>
									<tr>
										<td>学<%for (int i = 0; i < 14; i++) {%>&nbsp;<%}%>历:
										</td>
										<td>
										<span><%=all.getEducational() %></span>
										</td>
									</tr>
									<tr>
										<td>月<%for (int i = 0; i < 14; i++) {%>&nbsp;<%}%>薪:
										</td>
										<td><span><%=all.getIncome() %></span></td>
									</tr>
									<tr>
										<td>是否想要小孩:</td>
										<td><span><%=all.getWantChildAble() %></span></td>
									</tr>
									<tr>
										<td>喜欢的异性类型:</td>
										<td><span><%=all.getLoverType() %></span></td>
									</tr>
									<tr>
										<td>是否愿意与父母同住:</td>
										<td><span><%=all.getLiveWithParentsAble() %></span></td>
									</tr>
								</table>
								<table class="infoTable" border="0" style="margin-left: 30px;">
									<tr>
										<td>婚<%for (int i = 0; i < 14; i++) {%>&nbsp;<%}%>姻:
										</td>
										<td><span><%=all.getMarriage() %></span></td>
									</tr>
									<tr>
										<td>身<%for (int i = 0; i < 14; i++) {%>&nbsp;<%}%>高:
										</td>
										<td><span><%=all.getHeight() %>cm</span></td>
									</tr>
									<tr>
										<td>职<%for (int i = 0; i < 14; i++) {%>&nbsp;<%}%>业:
										</td>
										<td><span><%=all.getProfession() %></span></td>
									</tr>
									<tr>
										<td>住
											<%for (int i = 0; i < 14; i++) {%>&nbsp;<%}%>房:
										</td>
										<td><span><%=all.getHasHouseAble() %></span></td>
									</tr>
									<tr>
										<td>能否接受异地恋:</td>
										<td><span><%=all.getDistanceLoveAble() %></span></td>
									</tr>
									<tr>
										<td>能否接受婚前性行为:</td>
										<td><span><%=all.getSexAble() %></span></td>
									</tr>
									<tr>
										<td>最有魅力的部位:</td>
										<td><span><%=all.getPrettyParts() %></span></td>
									</tr>
								</table>

							</div>
						</div>
						<!-- 详细资料end-->

						<!--择偶标准begin  -->
						<div id="allQual" class="subDeta" style="margin-top: 20px">
							<div class="infoTitle">
								<div></div>
								<span>择偶标准</span>
							</div>
							<div class="infoContent">
								<table class="infoTable" border="0">
									<tr>
										<td>希望对方居住地:</td>
										<td><span><%=all.getWantLivePlace() %></span></td>
									</tr>
									<tr>
										<td>希望对方收入:</td>
										<td><span><%=all.getWantIncome() %></span></td>
									</tr>
									<tr>
										<td>希望对方年龄:</td>
										<td><span><%=all.getWantLowestAge() %>-<%=all.getWantHighestAge() %>岁</span></td>
									</tr>
								</table>
								<table class="infoTable" border="0" style="margin-left: 40px;">
									<tr>
										<td>希望对方学历:</td>
										<td><span><%=all.getWantEducational() %></span></td>
									</tr>
									<tr>
										<td>希望对方身高:</td>
										<td><span><%=all.getWantLowestHeight() %>-<%=all.getWantHighestHeight() %>cm</span></td>
									</tr>
									<tr>
										<td>希望对方体重</td>
										<td><span><%=all.getWantWeight()%>斤</span></td>
									</tr>
								</table>

							</div>
						</div>
						<!--择偶标准end  -->

						<div class="subDeta" style="margin-top: 10px;color:rgb(180,180,180);margin-right: 20px;float: right;">
							<img src="images/myTaoMei/prompt_bg.gif" style="margin-right: 10px">以上并不是硬性条件,快来和我联系吧!
						</div>

						<!--收到的礼物begin  -->
						<div id="allGift" class="subDeta" style="margin-top: 20px">
							<div class="infoTitle">
								<div></div>
								<span>收到的礼物</span>
							</div>
							<div class="infoContent">
								<img src="images/012.gif"><img src="images/012.gif" class="gift"><img src="images/012.gif" class="gift">
							</div>
						</div>
						<!--收到的礼物end  -->
					</div>
					<!-- 整体资料end -->

				</div>
			</div>
			<!-- 中间部分end -->

			<div id="footer">
				<img src="images/login/footer.png">
			</div>
		</div>
		
		<!-- 相册浏览弹出层begin -->
		<div class="allAlert" id="photoValidateAlert">
			<div class="alertBG" style="opacity:0.7;"></div>
			<div class="baseAlert photoAlert">
				<div class="closePhoto" onclick="closePhoto()"></div>
				<div class="photoPrePointer" onclick="showPrePhoto()"></div>
				<div class="showPhotoDiv"><img src="images/psb.jpg" class="alertPhoto"></div>
				<div class="photoNextPointer" onclick="showNextPhoto()"></div>
				<div class="photoBottom">
					<div class="btnPre" onclick="showPrePhoto()"></div>
						<div class="alertPhotoDiv"></div>
					<div class="btnNext" onclick="showNextPhoto()"></div>
				</div>
			</div>
		</div>
	<!-- 相册浏览弹出层end-->
		<!-- 消息弹出框begin -->
		<div id="messageAlert">
			<div id="closeMessageAlert" onclick="stopBrowserFlash()" style="cursor: pointer;"></div>
			<img id="message_head" src="images/1468475002907A42DA1B_c.jpg" >
			<div id="messageContent">
				<p id="messageNickName">宇动心诚：<p>
				<p id="messageText">查看了你的资料</p>
				<a id="messageOpre1" target="_blank"  onclick="stopBrowserFlash()">给她发信</a><a  onclick="stopBrowserFlash()" id="messageOpre2" target="_blank">查看资料</a>
			</div>
		</div>
		<!-- 消息弹出框end -->
	</body>

</html>