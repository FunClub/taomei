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
	AllNewListTalk allNewListTalk = (AllNewListTalk)session.getAttribute("allNewListTalk");
	AllNewListTalk allHotListTalk = (AllNewListTalk)session.getAttribute("allHotListTalk");
	List<NewListTalk> hotTalkList = allHotListTalk.getNewTalkList();
	List<NewListTalk> newTalkList = allNewListTalk.getNewTalkList();
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>桃梅网-俱乐部</title>

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
<script type="text/javascript" src="js/club/club.js"></script>
<link rel="stylesheet" href="css/myTaoMei/title.css" />
<link rel="stylesheet" href="css/club/club.css" />
</head>

<body>
	<input type="hidden" id="users_id" value="<%=base.getUsers_id()%>">
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
						<li><a href="newTalkAction.action" style="color:rgb(236,93,167);)">俱乐部<span
								class=titleFenGe>|</span></a></li>
						<li><a href="chatAction.action">畅聊<span class=titleFenGe>|</span></a>
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
				<div id="allInfo">
					<div id="myHeadDiv">
						<img src="<%=othe.getHeadPicture()%>">
					</div>
					<div id="baseInfo">
						<p id="myName">
							<%=base.getNickName() %><img src="images/club/mc-icon.png"
								style="margin-left: 10px;margin-bottom: 5px;">
						</p>
						<p id="myUsersID">账号:<%=base.getAccount() %></p>
						<p id="myInfo"><%=base.getCity() %><%=base.getTown() %>，<%=base.getAge() %>岁，<%=base.getHeight() %>cm，<%=base.getMarriage() %></p>
						<p id="clubInfo">
							<img src="images/club/good.png" width="24px"
								style="margin: auto 5px 5px 5px;"><span class="clubCount">32</span>
							次<span style="margin-left: 30px">参与话题：<span
								class="clubCount">56</span> 次
							</span>
						</p>
					</div>

					<div id="clubSearch">
						<div id="searchTagDiv">
							<span style="color:gray">热门标签：</span> <span class="searchTag">情感</span><span
								class="searchTag">约会</span><span class="searchTag">相亲</span><span
								class="searchTag">寻缘</span><br> <span class="searchTag">倾诉</span><span
								class="searchTag">吐槽</span><span class="searchTag">求救</span><span
								class="searchTag">失恋</span> <span class="searchTag">求带走</span><br>
						</div>
						<img id="searchImg" src="images/club/search.png" onclick="searchTalk()"> <input
							class="form-control" id="searchInput" placeholder="输入标题、点击标签" />
						<div id="searchResult">
						</div>	
						
					</div>
					<div id="topsendTalk" onclick="openSendTalk()">发表话题</div>
				</div>
				<ul class="nav nav-tabs" id="clubTabs">
					<li class="active"><a href="#newTalk" data-toggle="tab">最新话题</a></li>
					<li><a href="#hotTalk" data-toggle="tab">最热动态</a></li>
					<li><a href="#myTalk" data-toggle="tab">我的消息</a></li>
					<li><a href="#sendTalk" data-toggle="tab">发表话题</a></li>
				</ul>
				<div class="tab-content" style="padding:30 20 0 20">
					<!--最新话题begin-->
					<div class="tab-pane fade spane active in" id="newTalk">
						<div class="allTalk">
							<%for(int i=0;i<newTalkList.size();i++){
								NewListTalk talk =  newTalkList.get(i);
								List<String> imgs = talk.getTalkImgList();
								String content = talk.getTalkContent();
							%>
								<div class="talkDiv">
									<div class="talkHeadDiv">
										<a href="showOneAction.action?users_id=<%=talk.getUsers_id() %>" target="_blank"><img src="<%=talk.getHeadPicture() %>" class="talkHead"></a>
									</div>
									<p class="talkTitle"><a class="talkA" href="showOneTalkAction.action?talk_id=<%=talk.getTalk_id()%> " target="_blank"><%=talk.getTalkTitle() %></a></p>
									<%if(content!="") {%>
										<p class="talkSimpleContent">
											<%
												if(content.length()>=70){
													out.print(content.substring(0, 69)+"......");
												}else{
													out.print(content);
												}
											%>
										</p>
									<%} %>
									<%if(imgs.size()>0) {%>
										<table class="talkImgTable">
											<tr>
												<%for(int m=0;m<imgs.size();m++){%>
													<td><a href="showOneTalkAction.action?talk_id=<%=talk.getTalk_id()%> "><img src="<%=imgs.get(m) %>" class="talkImg"></a></td>
												<%}%>
											</tr>
										</table>
									<%} %>
									<span class="talkTime">发布于 <%=talk.getTalkTime() %></span>
									<div class="talkInfo">
										<span><img src="images/club/seeCount.png">&nbsp;<%=talk.getTalkSeeCount() %></span>
										<span><img src="images/club/discussCount.png">&nbsp;<%=talk.getTalkDiscussCount() %></span>
									</div>
							  </div>
							  
							<% }%>
							
							<ul class="pagination" id="newTalkPage">
										<li><a href="javascript:void(0)">&laquo;</a></li>
										<li class="active"><a class="emailPage" href="javascript:void(0)">1</a></li>
										<%for(int c=1;c<Math.ceil(allNewListTalk.getNewListTalkCount()/6.0);c++){%>
											<li><a class="emailPage" href="javascript:void(0)"><%=c+1 %></a></li>
										<%} %>
								<li><a href="javascript:void(0)">&raquo;</a></li>
							</ul>
							
						</div>
						<div class="allSimpleTalk">
							<p class="simpleTalkTip"><img src="images/writeEmail/help.jpg" >热门话题</p>
							<%for(int i=0;i<hotTalkList.size();i++) { NewListTalk talk = hotTalkList.get(i);
							String title =talk.getTalkTitle();
							int len = title.length();
							%>
								<div class="simpleTalk">
									<img src="images/myTaoMei/circle.png"><a href="showOneTalkAction.action?talk_id=<%=talk.getTalk_id()%> " target="_blank"><% if(len>9){
										out.print(title.substring(0, 8)+"......");
									}else{
										out.print(title);
									} %>
									</a>
								</div>
							<%} %>
						</div>
					</div>
					<!--最新话题end-->

					<!--最热动态begin-->
					<div class="tab-pane fade spane" id="hotTalk">
						<div class="allTalk">
							<%for(int i=0;i<hotTalkList.size();i++){
								NewListTalk talk =  hotTalkList.get(i);
								List<String> imgs = talk.getTalkImgList();
								String content = talk.getTalkContent();
							%>
								<div class="talkDiv">
									<div class="talkHeadDiv">
										<a href="showOneAction.action?users_id=<%=talk.getUsers_id() %>" target="_blank"><img src="<%=talk.getHeadPicture() %>" class="talkHead"></a>
									</div>
									<p class="talkTitle"><a class="talkA" href="showOneTalkAction.action?talk_id=<%=talk.getTalk_id()%> " target="_blank"><%=talk.getTalkTitle() %></a></p>
									<%if(content!="") {%>
										<p class="talkSimpleContent">
											<%
												if(content.length()>=70){
													out.print(content.substring(0, 69)+"......");
												}else{
													out.print(content);
												}
											%>
										</p>
									<%} %>
									<%if(imgs.size()>0) {%>
										<table class="talkImgTable">
											<tr>
												<%for(int m=0;m<imgs.size();m++){%>
													<td><a href="showOneTalkAction.action?talk_id=<%=talk.getTalk_id()%> "><img src="<%=imgs.get(m) %>" class="talkImg"></a></td>
												<%}%>
											</tr>
										</table>
									<%} %>
									<span class="talkTime">发布于 <%=talk.getTalkTime() %></span>
									<div class="talkInfo">
										<span><img src="images/club/seeCount.png">&nbsp;<%=talk.getTalkSeeCount() %></span>
										<span><img src="images/club/discussCount.png">&nbsp;<%=talk.getTalkDiscussCount() %></span>
									</div>
							  </div>
							  
							<% }%>
							
							<ul class="pagination" id="hotTalkPage">
										<li><a href="javascript:void(0)">&laquo;</a></li>
										<li class="active"><a class="emailPage" href="javascript:void(0)">1</a></li>
										<%for(int c=1;c<Math.ceil(allHotListTalk.getNewListTalkCount()/6.0);c++){%>
											<li><a class="emailPage" href="javascript:void(0)"><%=c+1 %></a></li>
										<%} %>
								<li><a href="javascript:void(0)">&raquo;</a></li>
							</ul>
							
						</div>
						<div class="allSimpleTalk">
							<p class="simpleTalkTip"><img src="images/writeEmail/help.jpg" >最新话题</p>
							<%for(int i=0;i<newTalkList.size();i++) { NewListTalk talk = newTalkList.get(i);
							String title =talk.getTalkTitle();
							int len = title.length();
							%>
								<div class="simpleTalk">
									<img src="images/myTaoMei/circle.png"><a href="showOneTalkAction.action?talk_id=<%=talk.getTalk_id()%> " target="_blank"><% if(len>9){
										out.print(title.substring(0, 9));
									}else{
										out.print(title);
									} %>
									......</a>
								</div>
							<%} %>
							
						</div>
					
					
					</div>
					<!--最热动态end-->

					<!--我的消息begin-->
					<div class="tab-pane fade" id="myTalk">暂无消息</div>
					<!--我的消息end-->

					<!--发表话题begin -->
					<div class="tab-pane fade" id="sendTalk">
						<input id="sendTalkTitle" class="form-control"
							placeholder="请输入标题（30个字以内）">
						<div id="sendTalkDiv">
							<div id="sendTalkOpr">
								<div style="margin-top: 5px;margin-left: 5px">
									<img class="sendTalkOprImg" src="images/club/face.png"
									onclick="$('#allFace').toggle(300);$('#updateImgDiv').css('display','none')"><img
									class="sendTalkOprImg" style="margin-left: 15px"
									onclick="$('#allFace').css('display','none');$('#updateImgDiv').toggle(300)"
									src="images/club/upImg.png">
								</div>
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
								<div id="updateImgDiv">
									<span
										style="display:inline-block;margin:10px 5px auto 20px;color:rgb(120,120,120);font-size: 13px">每次可选
										5 张，支持jpg、gif、png、jpeg格式，每张图片10K-5M内 </span> <img
										style="cursor: pointer;float: right;margin-right: 20px;margin-top: 10px"
										src="images/register/closeTagPoint.png"
										onclick="$('#updateImgDiv').css('display','none');">
									<table id="preUpLoadTable" border="0">
										<tr>
											<td>
												<div id="sureUploadImg">
													<a class="a-upload"> <input id="upLoadImgInput"
														type="file">
													</a>
													<p	style="margin-top: 30px;margin-left: 20px;font-size: 13px;font-weight: bold;color:rgb(100,100,100)">上传图片</p>
												</div>
											</td>
											
										</tr>
									</table>

								</div>
							</div>
							<div id="sendTalkContent"onclick="$('#allFace,#updateImgDiv').css('display','none');"contenteditable="true"></div>
							<div id="selectTag">
								添加标签: <span class="searchTag searchTagActive">情感</span><span
								class="searchTag">约会</span><span class="searchTag">相亲</span><span
								class="searchTag">寻缘</span><span class="searchTag">倾诉</span><span
								class="searchTag">吐槽</span><span class="searchTag">求救</span><span
								class="searchTag">失恋</span> <span class="searchTag">求带走</span>
							</div>
						</div>
						<div id="sureSendTalk" onclick="sureSendTalk()">
							发布
						</div>
						<div id="talkText" style="margin-left: 25px;margin-top: 60px;color:rgb(120,120,120);font-size: 13px">
							<img src="images/club/talkText.png">
							<p style="margin-top: 10px;">俱乐部是一个真诚友善的情感交流互助平台，我们希望每一个话题都有轻松的讨论，积极的观点。<br><br>俱乐部不欢迎以下内容</p>
							<ul>
								<li>
									1、不文明的语言，表达或激发仇恨的言论，将被删除。
								</li>
								<li>
									2、涉及政治问题及不适合公开讨论的敏感内容，将被删除。
								</li>
								<li>
									3、涉及民族、种族、宗教信仰、性取向、性别、文化、阶层、职业、年龄等含有歧视、误导等的内容，将被删除。
								</li>
								<li>
									4、散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容，将被删除。
								</li>
								<li>
									5、涉及个人隐私，相关人要求删除
								</li>
								<li>
									6、其他违反相关法律法规的内容。
								</li>
							</ul>
						</div>
					</div>
					<!--发表话题end-->
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
