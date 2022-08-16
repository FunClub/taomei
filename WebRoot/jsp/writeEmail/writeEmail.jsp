<%@page import="yucheng.taomei.vo.user.OtherInfoUser"%>
<%@page import="yucheng.taomei.vo.user.BaseInfoUser"%>
<%@page import="yucheng.taomei.vo.user.UnionUser"%>
<%@page import="yucheng.taomei.vo.user.WriteEmailUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
WriteEmailUser emailUser  = (WriteEmailUser)request.getAttribute("emailUser");
UnionUser union = (UnionUser)session.getAttribute("unionUser");
BaseInfoUser base = union.getBaseInfoUser();
OtherInfoUser othe = union.getOtherInfoUser();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">

		<title>给<%=emailUser.getNickName() %>写信</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" href="css/reset.css" />
		<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet" href="resource/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="resource/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>
<script type="text/javascript" src="dwr/interface/UpdateDWR.js"></script>
		<link rel="stylesheet" href="css/writeEmail/writeEmail.css" />
		<link rel="stylesheet" href="css/messageAlert.css" />
		<script type="text/javascript" src="js/webSocket/adviceSocket.js"></script>
		<script type="text/javascript" src="js/writeEmail/writeEmail.js"></script>
	</head>

	<body>
		<input id="from_id" type="hidden" value="<%=base.getUsers_id()%>">
		<input id="to_id" type="hidden" value="<%=emailUser.getUsers_id()%>">
		<input id="headPicture" type="hidden" value="<%=othe.getHeadPicture() %>">
		<input id="myNickName" type="hidden" value="<%=base.getNickName() %>">
		<input id="mySex" type="hidden" value="<%=base.getSex() %>">
		<div id="all">
			<div id="allHeader">
				<div id="header">
					<img src="images/register/logo.png">
					<div></div>
					<span>给<%if(emailUser.getSex().equals("女")) {%>她<% }else{%>他<% }%>写信</span>
				</div>
			</div>
			<div id="allCenter">
				<div id="center">
					<!-- 用户资料begin -->
					<div id="usersInfo">
						<div id="headPictureDiv">
							<a><img src="<%=emailUser.getHeadPicture()%>"></a>
						</div>
						<div id="textInfoDiv"><img id="logo" src="images/writeEmail/recipient_topbg.png">
							<span id="nickName"><%=emailUser.getNickName() %></span><img id="validate" src="images/base/hasHead1.png" title="有头像"><a id="viewInfo" href="showOneAction.action?users_id=<%=emailUser.getUsers_id()%>" target="_blank">查看详情</a>
							<p id="baseInfo"><%=emailUser.getAge() %>岁，<%=emailUser.getMarriage() %>，<%=emailUser.getHeight() %>cm，<%=emailUser.getEducational()%>，<%=emailUser.getCity() %><%=emailUser.getTown() %>，<%=emailUser.getIncome() %></p>
							<span id="photoCount">照片：<a><%=emailUser.getPhotoCount() %>张</a></span><span id="lastLoginTime">最后登录时间：<%if(emailUser.getLastLoginTime()==null) {%>未登陆<%}else{ out.print(emailUser.getLastLoginTime());} %></span>
						</div>
					</div>
					<!-- 用户资料end -->
					
					<!-- 写信面板begin -->
					<div id="writeContent">
						<div id="writeAreaDiv">
							<textarea rows="14" cols="90"  id="writeArea"></textarea>
						</div>
						<div id="writeHelp">
							<p id="helipTitle" title="点击使用">
								<img src="images/writeEmail/help.jpg">&nbsp;&nbsp;为你支招:
							</p>
							<div class="help" title="点击使用">
								<img src="images/myTaoMei/circle.png">&nbsp;碰到一个喜欢的人是世上最好的梦，你愿意进入我的梦中吗? 
							</div>  
							<div class="help" title="点击使用">
								<img src="images/myTaoMei/circle.png">&nbsp;如果不交谈，永远不清楚对方是不是自己在找的人，可以聊一聊么？
							</div>
							<div class="help" title="点击使用">
								<img src="images/myTaoMei/circle.png">&nbsp;老人说爱情就是一句话，看对眼了。我觉得我和你对眼了，你呢？
							</div>
							<div class="help" title="点击使用">    
								<img src="images/myTaoMei/circle.png">&nbsp;看到你的资料，我很高兴，感觉我们应该还挺合适的，希望你有同感。 
							</div>
							<div class="help" title="点击使用">    
								<img src="images/myTaoMei/circle.png">&nbsp;有人说，爱情里最重要的是真诚。那我特真诚地请求你：回封信吧！  
							</div>
						</div>
					</div>
					<!-- 写信面板end -->
					
					<!-- 发送面板begin -->
					<div id="sendMessage">
						<div id="vipSend" class="send">会员免费发信</div>
						<div id="meiyuanSend" class="send">支付梅元发信</div>
						<div id="justSend" class="send" onclick="$('#messageAlert').show(600)">直接发信</div>
					</div>
					<!-- 发送面板end -->
					
					<!-- 发送提示面板begin -->
					<div id="sendPointe">
						<img src="images/writeEmail/tip.jpg">&nbsp;&nbsp;<span>使用会员和桃梅发送，对方可免费查看您的私信</span>
					</div>
					<!-- 发送提示面板end  -->
				</div>
			</div>
			<div id="footer">
				<img src="images/login/footer.png">
			</div>
		</div>
		
		<!-- 消息弹出框begin -->
		<div id="messageAlert">
			<div id="closeMessageAlert" onclick="stopBrowserFlash()" style="cursor: pointer;"></div>
			<img id="message_head" src="images/1468475002907A42DA1B_c.jpg" >
			<div id="messageContent">
				<p id="messageNickName">宇动心诚：<p>
				<p id="messageText">查看了你的资料</p>
				<a id="messageOpre1" target="_blank"  onclick="stopBrowserFlash()"></a><a  onclick="stopBrowserFlash()" id="messageOpre2" target="_blank"></a>
			</div>
		</div>
		<!-- 消息弹出框end -->
	</body>

</html>