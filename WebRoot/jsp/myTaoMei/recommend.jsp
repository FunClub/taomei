<%@page import="yucheng.taomei.vo.user.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String infoType = request.getParameter("infoType");
UnionUser union = (UnionUser) session.getAttribute("unionUser");
List<RecommendUser> reco = (List<RecommendUser>)session.getAttribute("recoUser");
List<NewStarUser> starUser = (List<NewStarUser>)session.getAttribute("starUser");
String unionStr = (String) session.getAttribute("unionUserStr");
BaseInfoUser base = union.getBaseInfoUser();
OtherInfoUser othe = union.getOtherInfoUser();
QualificationInfoUser qual = union.getQualificationInfoUser();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>桃梅网-我的桃梅</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" href="css/reset.css" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<link rel="stylesheet" href="resource/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
		<script type="text/javascript" src="resource/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/sTitle.css" />
		<link rel="stylesheet" href="css/myTaoMei/left.css" />
		<link rel="stylesheet" href="css/myTaoMei/recommend.css" />
		<link rel="stylesheet" href="css/messageAlert.css" />
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="dwr/interface/SearchDWR.js"></script>
		<script type="text/javascript" src="dwr/interface/UpdateDWR.js"></script>
		<script type="text/javascript" src="js/allTitle.js"></script>
		<script type="text/javascript" src="js/myTaoMei/left.js"></script>
		<script type="text/javascript" src="js/webSocket/adviceSocket.js"></script>
		<script type="text/javascript" src="js/writeEmail/writeEmail.js"></script>
		
	</head>

	<body>
		<input id="from_id" type="hidden" value="<%=base.getUsers_id()%>">
		<div id="unionStr" style="display: none"><%=unionStr%></div>
		<div id="all">
			<!-- 整体头部begin -->
			<div id="allHead">

				<!-- 头部顶部begin -->
				<div id="head">
					<div id="headContent">
						<ul id="content1">
							<li>hi,
								<a href="#"><%=base.getNickName() %></a>
							</li>
							<li>梅元 <a href="#"><%=othe.getMeiyuan() %></a></li>
							<li>桃梅ID<a href="#"><%=base.getUsers_id() %></a></li>
							<li>
								<a href="#">退出</a>
							</li>
						</ul>
						<ul id="content2">
							<li>消息</li>
						</ul>
					</div>
				</div>
				<!-- 头部顶部end -->

				<!-- 头部logo benin -->
				<div id="logoDiv">
					<img id="logo" src="images/register/logo.png">
					<img id="vipImg" src="images/logoVIP.png">
				</div>
				<!-- 头部logo end -->

				<!-- 头部导航begin -->
				<div id="allNav">
					<ul>
						<li>
							<a href="#">首页</a>
						</li>
						<li id="myTaoMeiLi" class="navChange">
							<a href="jsp/myTaoMei/recommend.jsp">我的桃梅</a>
						</li>
						<li>
							<a href="#">梅园</a>
						</li>
						<li>
							<a  href="searchQualUserAction.action" target="_blank">觅爱</a>
						</li>
						<li>
							<a href="newTalkAction.action" target="_blank">俱乐部</a>
						</li>
						<li>
							<a href="chatAction.action" target="_blank">畅聊</a>
						</li>
						<li>
							<a href="#">晒幸福</a>
						</li>
					</ul>
				</div>
				<!-- 头部导航end -->
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
									<img id="myHead" src="<%=othe.getHeadPicture() %>">
								</div>
								
								<p id="myName"><%=base.getNickName() %><a href="jsp/myTaoMei/info.jsp?infoType=all"><img id="updateInfoImg" src="images/myTaoMei/updateInfoS.jpg"></a></p>
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
								<span style="margin-top: 12px;margin-left: 10px;display: inline-block;">梅元:</span>
								<span style="margin-left: 5px;display: inline-block; color:rgb(233,70,155)"><%=othe.getMeiyuan() %></span>
								<a href="#" style="margin-left: 90px;display: inline-block; color:rgb(47,177,209)">充值</a>
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
									<td class="suService"><a href="#">[写信免费]</a></td><td class="suService"><a href="#">[消息提示]</a></td>
								</tr>
								<tr>
									<td class="suService"><a href="#">[最优推荐]</a></td><td class="suService"><a href="#">[送礼优惠]</a></td>
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
						<div id="allCRight">、
							
							<!-- 桃梅推荐begin -->
							<div>
								<div class="rightTitle">
									桃梅推荐
								</div>
								<div id="palQualificationDiv">
									你正在寻找，
									居住在：<span id="quabPlace"><%=qual.getWantLivePlace() %></span>，
									年龄：<span id="quaAge"><%=qual.getWantLowestAge() %>-<%=qual.getWantHighestAge() %></span>岁，
									身高：<span id="quaHeight"><%=qual.getWantLowestHeight() %>-<%=qual.getWantHighestHeight() %></span>cm
									的<span id="quaSex"><% if(base.getSex().equals("男")){%>女<%} else{%>男<%} %>性</span>
									<a href="jsp/myTaoMei/info.jsp?infoType=qual" id="palQualificationText">修改择友标准</a>
								</div>
								
								<table id="qualificationTable" border="0">
									<tr>
										<%for(int i=0;i<reco.size();i++){RecommendUser r=reco.get(i);%>
										<td>
											<div class="otherUserInfoDiv">
												<%if (r.getHeadPicture()!=null){ %>
												<a target="_black" href="showOneAction.action?users_id=<%=r.getUsers_id()%>"><img class="quaHead" src="<%=r.getHeadPicture()%>" /></a>
												<%}else{%>
													<img class="quaHead" src="images/myTaoMei/defaultMeImg.png" />
												<%}%>
												<p class="quaNameAndAge"><%=r.getNickName() %>&nbsp;&nbsp;<%=r.getAge()%>岁</p>
												<p class="quaPlace"><%=r.getCity() %> <%=r.getTown() %></p>
												<%if(i==4)break; %>
											</div>
										</td>
										<%} %>
									</tr>
									<tr>
										<%for(int i=5;i<reco.size();i++){RecommendUser r=reco.get(i);%>
										<td>
											<div class="otherUserInfoDiv">
												<%if (r.getHeadPicture()!=null){ %>
												<a target="_black" href="showOneAction.action?users_id=<%=r.getUsers_id()%>"><img class="quaHead" src="<%=r.getHeadPicture()%>" /></a>
												<%}else{%>
													<img class="quaHead" src="images/myTaoMei/defaultMeImg.png" />
												<%}%>
												<p class="quaNameAndAge"><%=r.getNickName() %>&nbsp;&nbsp;<%=r.getAge()%>岁</p>
												<p class="quaPlace"><%=r.getCity() %> <%=r.getTown() %></p>
											</div>
										</td>
										<%} %>
									</tr>
								</table>
							</div>
							<!-- 桃梅推荐end -->
							
							<!--今日新星begin-->
								<div class="rightTitle" style="margin-top: 20px;">
									今日新星
								</div>
								<%for(int i=0;i<starUser.size();i++){ 
									NewStarUser star = starUser.get(i);
									List<String> photo = star.getPhotoObj().getList();
								%>
									<div class="newsUserDiv">
									<a href="showOneAction.action?users_id=<%=star.getUsers_id()%>" target="_blank"><img src="<%=star.getHeadPicture() %>" class="newsHead"></a>
									<div class="showPhoto">
										<table>
											<tr>
												<%for(int x=0;x<photo.size();x++){%>
													<td><a href="showOneAction.action?users_id=<%=star.getUsers_id()%>" target="_blank"><img src="<%=photo.get(x) %>"></a></td>
												<%if(x==3){break;}} %>
											</tr>
										</table>
									</div><br>
									<a class="newsName" href="showOneAction.action?users_id=<%=star.getUsers_id()%>" target="_blank" ><%=star.getNickName() %></a><br>
									<span class="validateLV">认证等级:</span>
									
									<table class="validateLVTable">
										<tr>
											<td><img src="images/base/hasEmal1.png"></td>
											<td><img src="images/base/hasHead1.png"></td>
											<%if(star.getID().equals("未填写")==false){%>
												<td><img src="images/base/hasID1.png"></td>
											<%} %>
											<%if(photo.size()>=3){%>
												<td><img src="images/base/hasImg1.png"></td>
											<%} %>
											<%if(star.getTelphone().equals("未填写")==false){%>
												<td><img src="images/base/hasPhone1.png"></td>
											<%} %>
											
										</tr>
									</table>
									<p class="newsInfo"><%=star.getCity() %><%=star.getTown() %>，<%=star.getAge() %>岁，<%=star.getHeight() %>cm，<%=star.getEducational() %>，<%=star.getIncome() %></p>
									<div class="sayHi">
										<a href="writeEmailAction.action?users_id=<%=star.getUsers_id()%>" target="_blank" >打招呼</a>
									</div>
								</div>
								<%}%>
							<!--今日新星end-->
						</div>
					<!-- 右边内容end -->
				</div>
			</div>
			<!--整个内容end  -->
			<div id="footer">
					<img src="images/login/footer.png">
			</div>
			<!-- 消息弹出框begin -->
		<div id="messageAlert">
			<div id="closeMessageAlert" onclick="stopBrowserFlash()" style="cursor: pointer;"></div>
			<img id="message_head" src="images/1468475002907A42DA1B_c.jpg" >
			<div id="messageContent">
				<p id="messageNickName"><p>
				<p id="messageText"></p>
				<a id="messageOpre1" target="_blank"  onclick="stopBrowserFlash()"></a><a  onclick="stopBrowserFlash()" id="messageOpre2" target="_blank">查看资料</a>
			</div>
		</div>
		<!-- 消息弹出框end -->
		</div>
	</body>

</html>