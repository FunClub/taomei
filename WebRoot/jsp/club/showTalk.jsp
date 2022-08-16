<%@page import="yucheng.taomei.vo.club.*"%>
<%@ page language="java" import="java.util.*,yucheng.taomei.vo.user.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UnionUser union = (UnionUser) session.getAttribute("unionUser");
	BaseInfoUser base = union.getBaseInfoUser();
	OtherInfoUser othe = union.getOtherInfoUser();
	AllInfoUser all = (AllInfoUser) session.getAttribute("allInfoUser");
	OneTalk talk = (OneTalk)session.getAttribute("talk");
	String talkDiscuss = talk.getTalkDiscuss();
	String disJson = talk.getDiscussTalkJSON();
	int talk_id = talk.getTalk_id();
	List<String> imgs = talk.getImgs();
	List<String> tags = talk.getTags();
	List<DiscussTalk> discuss = talk.getDiscuss();
	List<AboutTalk> abouts = talk.getAbouts();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>话题-<%=talk.getTalkTitle() %></title>

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
<script type="text/javascript" src="js/club/showTalk.js"></script>
<link rel="stylesheet" href="css/myTaoMei/title.css" />
<link rel="stylesheet" href="css/club/showTalk.css" />
</head>

<body>
	<input type="hidden" id="users_id" value="<%=base.getUsers_id()%>">
	<textarea id="talkDiscuss" style="display: none;"><%=talkDiscuss %></textarea>
	<textarea id="disJson" style="display: none;"><%=disJson %></textarea>
	<input id="talk_id" type="hidden" value="<%=talk_id %>">
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
						<li><a href="searchQualUserAction.action" target="_blank">觅爱<span
								class=titleFenGe>|</span></a></li>
						<li><a href="newTalkAction.action" target="_blank" style="color:rgb(236,93,167);)">俱乐部<span
								class=titleFenGe>|</span></a></li>
						<li><a href="chatAction.action" target="_blank">畅聊<span class=titleFenGe>|</span></a>
						</li>
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

		<!--中间部分begin  -->
		<div id="allContent">
			<div id="content">
				<img src="images/club/banner.png" style="margin-right: 20px;">
				<div id="allTalk"><br>				 
					<h4><%=talk.getTalkTitle() %></h4>
					<div id="userInfo" style="padding: 1px;">
						<div id="headDiv"><img src="<%=talk.getHeadPicture() %>" id="headImg"></div>
						<p id="userBaseInfo"><%=talk.getNickName() %>，<%=talk.getAge() %>岁，<%=talk.getHeight() %>cm，<%=talk.getCity()+talk.getTown() %></p>
						<span id="talkTime"><%=talk.getTalkTime() %></span>
						<span style="margin-left: 580px"><img src="images/club/seeCount.png">&nbsp;<%=talk.getTalkSeeCount() %></span>
						<span style="margin-left: 10px"><img src="images/club/discussCount.png">&nbsp;<%=talk.getTalkDiscussCount() %></span>
						<span style="float: right;color:rgb(130,130,130)">楼主</span>
					</div>
					<div id="talkContent"><%=talk.getTalkContent() %><br>
					<%for(int i=0;i<imgs.size();i++) {%>
						<img class="talkImg" src="<%=imgs.get(i)%>"><br><br>
					<%} %>
					</div>
					<div id="talkTag">
						<span style="font-size: 13px;color:rgb(120,120,120)">标签：</span><%for(int i=0;i<tags.size();i++) {%><span class="talkTag"><%=tags.get(i) %></span><%} %>
					</div>
					<div id="wirteDiscussDiv">
						<h5>发表评论(<%=talk.getTalkDiscussCount() %>)</h5>
						<div id="wirteDiscuss" contenteditable="true" onclick="$('#allFace').hide(300)"></div>
						<img id="openFace" onclick="$('#allFace').toggle(300)" src="images/club/face.png">
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

									</table>
								</div>
						<div id="sendDiscuss" onclick="sendDiscuss()">
							发表
						</div>
					</div>
					<div id="allDisscuss">
						<%int count=0;for(int i=discuss.size()-1;i>=0;i--){ DiscussTalk disTalk = discuss.get(i);%>
							<div class="disscussDiv">
							<div class="disHeadDiv"><a href="showOneAction.action?users_id=<%=disTalk.getUsers_id()%>" target="_blank"><img src="<%=disTalk.getHeadPicture() %>" class="disHeadImg"></a></div>
							<p class="disBaseInfo"><%=disTalk.getNickName() %>，<%=disTalk.getAge() %>岁，<%=disTalk.getHeight() %>cm，<%=disTalk.getCity()+disTalk.getTown() %></p><span class="disTime">#<%=i+1 %>楼&nbsp;<%=disTalk.getDiscussTime() %></span>
							<div class="disContent"><%=disTalk.getDisscuss() %></div>
							<div class="disOpreation">
								<span class="disGood"><img  src="images/club/good1.png">&nbsp;赞&nbsp;0</span>
								<img src="images/club/discuss.png">&nbsp;评论&nbsp;0
							</div>
						</div>
						<%count++;if(count==8){break;}} %>
						
					</div>
					<% if(discuss.size()>0){%>
						<ul class="pagination" id="disTalkPage">
										<li><a href="javascript:void(0)">&laquo;</a></li>
										<li class="active"><a class="emailPage" href="javascript:void(0)">1</a></li>
										<%for(int c=1;c<Math.ceil(discuss.size()/8.0);c++){%>
											<li><a class="emailPage" href="javascript:void(0)"><%=c+1 %></a></li>
										<%} %>
							<li><a href="javascript:void(0)">&raquo;</a></li>
						</ul>
					<%} %>
					
				</div>
				<div id="allAboutTalk">
					<p class="simpleTalkTip"><img src="images/writeEmail/help.jpg" >相关话题</p>
					<%for(int i=0;i<abouts.size();i++) {AboutTalk talks = abouts.get(i); String content = talks.getTalkTitle();%>
						<div class="simpleTalk">
							<img src="images/myTaoMei/circle.png"><a href="showOneTalkAction.action?talk_id=<%=talks.getTalk_id()%> " target="_blank">
								<%
									if(content.length()>=10){
										out.print(content.substring(0, 9)+"......");
									}else{
										out.print(content);
									}
								%>
							</a>
						</div>
					<%} %>
					
				</div>
			</div>
		</div>
		<!--中间部分end  -->

		<div id="footer">
			<img src="images/login/footer.png">
		</div>
	</div>
</body>
</html>
