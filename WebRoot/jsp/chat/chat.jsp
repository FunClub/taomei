
<%@page import="yucheng.taomei.vo.chat.*"%>
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
<title>桃梅网-畅聊</title>
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
<link rel="stylesheet" href="css/chat/chat.css" />
<script type="text/javascript" src="js/chat/chat.js"></script>
</head>

<body>
	<%
		UnionUser union = (UnionUser) session.getAttribute("unionUser");
		BaseInfoUser base = union.getBaseInfoUser();
		OtherInfoUser othe = union.getOtherInfoUser();
		List<ListFriend> friendList=(List<ListFriend>)session.getAttribute("friendList");
		List<NearMessage> nearList= (List<NearMessage>)session.getAttribute("nearList");
		
	%>
	<input id="users_id" value="<%=base.getUsers_id()%>" type="hidden">
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
						<li><a href="searchQualUserAction.action">觅爱<span
								class=titleFenGe>|</span></a></li>
						<li><a href="newTalkAction.action" target="_blank">俱乐部<span class=titleFenGe>|</span></a></li>
						<li><a href="#" style="color:rgb(236,93,167);)">畅聊<span
								class=titleFenGe>|</span></a></li>
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
				<!-- 左边begin -->
				<div id="allLeft">
					<div id="myInfo">
						<div id="myHeadDiv">
							<img id="myhead" src="<%=othe.getHeadPicture()%>">
						</div>
						<span id="myName"><%=base.getNickName() %></span>
					</div>
					
					<div id="chatTabsDiv">
						<div class="chatTab chatTabActive">消息</div>
						<div class="chatTab">好友</div>
						<div class="chatTab">随便聊聊</div>
					</div>
					
					<div id="chatContent">
						<div id="fristChatContent" class="chatContent scrollContent">
							<%for(NearMessage near:nearList) {%>
							<div class='friendDiv' users_id="<%=near.getUsers_id() %>" headPicture="<%=near.getHeadPicture() %>" nickName="<%=near.getNickName()%>">
								<div class='frienHeaddDiv'>
									<img class='friendHead' src="<%=near.getHeadPicture() %>">
								</div>
								<span class='friendName'><%=near.getNickName() %></span><span class='messgaeCount label label-warning'><%if(near.getUnReadCount()==0){%><%}else{%><%=near.getUnReadCount() %>条未读<%}%></span><br>
								<span  class='nearMessage'><%=near.getChatText() %></span><span class='messageTime'><%=near.getChatTime() %>前</span>
						  	</div>
						  	<%} %>
						</div>
						<div class="chatContent scrollContent" id="friendList">
							<%for(int i=0;i<friendList.size();i++){ListFriend friend = friendList.get(i); %>
								<div class="friendDiv" users_id="<%=friend.getUsers_id()%>" headPicture="<%=friend.getHeadPicture()%>" nickName="<%=friend.getNickName() %>">
									<div class="frienHeaddDiv">
										<img class="friendHead" src="<%=friend.getHeadPicture()%>">
									</div>
									<span class="friendName"><%=friend.getNickName() %></span>
									<%if(friend.getState().equals("在线")) {%>
										<span class="onlineState">[ 在线 ]</span>
									<%}else{ %>
										<span class="downState">[ 离线 ]</span>
									<%} %>
									<p><span  class="nearMessage"><%=friend.getCity() %>，<%=friend.getAge() %>岁，<%=friend.getHeight() %>cm，<%=friend.getMarriage() %></span></p>
								</div>
							<%} %>
						</div>
						<div class="chatContent scrollContent">暂无会员在线</div>
					</div>
					
				</div>
				<!-- 左边end -->
				<div id="unSelectChat" style="margin-top: 260px;text-align: center;">
						<img src="images/chat/2016-08-27_215337.png"><br>
					`	暂未选择聊天
				</div>
				
				<!-- 右边begin -->
				<div id="allRight">
					<div id="friendInfo">
						<div id="fiHeaddDiv">
							<a target="_blank"><img id="fiHead" src="images/1468208444389AAA573B_c.jpg"></a>
						</div>
						<p><a target="_blank" id="fiNickName"></a></p>
						<p id="heartInfo">Hello！很高兴能在世纪佳缘这个平台结缘各位，我的性格活泼开朗，为人正直诚恳，也比较好说话，说得通俗点那豆是性情温和，各种托那些豆不要来烦我老，本人炼就一双孙大圣的火眼金睛哈！</p>
					</div>
					<div id="messageContent" class="scrollContent">
					</div>
					<div id="writeContent">
						<div id="allFace">
							<table>
								<tr>
									<td><img src="images/face/[白眼].gif"></td>
									<td><img src="images/face/[鄙视].gif"></td>
									<td><img src="images/face/[鄙夷].gif"></td>
									<td><img src="images/face/[不乐].gif"></td>
									<td><img src="images/face/[大兵].gif"></td>
									<td><img src="images/face/[奋斗].gif"></td>
									<td><img src="images/face/[愤怒].gif"></td>
									<td><img src="images/face/[鼓掌].gif"></td>
									<td><img src="images/face/[憨笑].gif"></td>
									<td><img src="images/face/[坏笑].gif"></td>
								</tr>
								<tr>
									<td><img src="images/face/[惊呆].gif"></td>
									<td><img src="images/face/[惊恐].gif"></td>
									<td><img src="images/face/[惊讶].gif"></td>
									<td><img src="images/face/[囧].gif"></td>
									<td><img src="images/face/[可怜].gif"></td>
									<td><img src="images/face/[酷].gif"></td>
									<td><img src="images/face/[困].gif"></td>
									<td><img src="images/face/[冷汗].gif"></td>
									<td><img src="images/face/[流汗].gif"></td>
									<td><img src="images/face/[流泪].gif"></td>
								</tr>
								<tr>
									<td><img src="images/face/[撇嘴].gif"></td>
									<td><img src="images/face/[敲打].gif"></td>
									<td><img src="images/face/[色].gif"></td>
									<td><img src="images/face/[偷笑].gif"></td>
									<td><img src="images/face/[吐舌].gif"></td>
									<td><img src="images/face/[微笑].gif"></td>
									<td><img src="images/face/[猥琐].gif"></td>
									<td><img src="images/face/[疑问].gif"></td>
									<td><img src="images/face/[晕].gif"></td>
									<td><img src="images/face/[咒骂].gif"></td>
								</tr>
								<tr>
									<td><img src="images/face/[猪头].gif"></td>
									<td><img src="images/face/[抓狂].gif"></td>
									<td><img src="images/face/[龇牙].gif"></td>
									
								</tr>
							</table>
						</div>
						<div id="writeOpreation">
							<img id="selectFace" src="images/chat/face.png" title="选择表情">
							<a class="a-upload">
								<input id="upLoadImgInput" type="file">
							</a>
							<img src="images/chat/chatText.png" title="找话题" onclick="findChat();">
						</div>
						<div id="writeMessage" contenteditable="true"></div>
						<div id="sendMessage" onclick="sendCommMessage()">
							发送
						</div>
					</div>
				</div>
				<!-- 右边end -->
			</div>
		</div>
		<!-- 中间部分begin -->
		<div id="footer">
			<img src="images/login/footer.png">
		</div>
	</div>
</body>

</html>