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
<title>桃梅网-我的资料</title>
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
<link rel="stylesheet" href="css/myTaoMei/info.css" />
<script type="text/javascript" src="js/myTaoMei/left.js"></script>
<script type="text/javascript" src="js/myTaoMei/info.js"></script>

</head>

<body>
	<%
		String infoType = request.getParameter("infoType");
		UnionUser union = (UnionUser) session.getAttribute("unionUser");
		String unionStr = (String) session.getAttribute("unionUserStr");
		BaseInfoUser base = union.getBaseInfoUser();
		OtherInfoUser othe = union.getOtherInfoUser();
	%>
	<input id="infoType" value="<%=infoType%>" type="hidden">
	<input id="users_id" value="<%=base.getUsers_id()%>" type="hidden">
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
					<div id="rightTitle">
						<img id="rightInfoImg" src="images/myTaoMei/info.png">
						<p id="rightInfoText1">我的资料</p>
						<div id="rightTitleInfoPerfect">
							<span id="rightTitleInfoPerfectText">资料完善度：</span>
							<div class="progress">
								<div
									class="progress-bar  progress-bar-striped active"
									style="width: <%=union.getInfoPerfect() * 100 / 39%>%"><%=union.getInfoPerfect() * 100 / 39%>%
								</div>
							</div>
						</div>
						<span id="rightInfoText2">请保证资料的正确性</span>

					</div>

					<ul class="nav nav-tabs" id="infoTabs">
						<li><a href="#baseInfo" data-toggle="tab">基本资料</a></li>
						<li><a href="#detailedInfo" data-toggle="tab">详细资料</a></li>
						<li><a href="#heartInfo" data-toggle="tab">内心独白</a></li>
						<li><a href="#qualification" data-toggle="tab">择偶标准</a></li>
						<li><a href="#upHead" data-toggle="tab">上传头像</a></li>
						<li><a href="#photo" data-toggle="tab">我的相册</a></li>
						<li><a href="#IDValidate" data-toggle="tab">诚信认证</a></li>

					</ul>
					<div class="tab-content" style="padding:30 30 0 20">
						<!--基本资料begin-->
						<div class="tab-pane fade" id="baseInfo">
							<div class="infoDiv">
								<div class="infoDivLeft">
									<table class="infoTable">
										<tr>
											<td><span class="infoText">登陆账号:</span></td>
											<td><span id="account" class="infoText"><%=base.getAccount()%></span></td>
										</tr>
										<tr>
											<td><span class="infoText">手机:</span></td>
											<td><span id="telphone" class="infoText"><%=base.getTelphone()%></span></td>
										</tr>
										<tr>
											<td><span class="infoText">昵称:</span></td>
											<td><input id="nickName" class="form-control"
												value="<%=base.getNickName()%>" /></td>
											<td><span class="infoText">&nbsp;&nbsp;*禁止填写非法信息</span></td>
										</tr>
										<tr>
											<td><span class="infoText">年龄:</span></td>
											<td><select class="selectInfo" id="ageSelect">
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
											</select></td>
										</tr>

										<tr>
											<td><span class="infoText">身高:</span></td>
											<td><select id="heightSelect" class="selectInfo">
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
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">体重:</span></td>
											<td><select id="weightSelect" class="selectInfo">
													<option value="70">70斤</option>
													<option value="80">80斤</option>
													<option value="90">90斤</option>
													<option value="100">100斤</option>
													<option value="110">110斤</option>
													<option value="120">120斤</option>
													<option value="130">130斤</option>
													<option value="140">140斤</option>
													<option value="150">150斤</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">学历:</span></td>
											<td><select id="educationalSelect" class="selectInfo">
													<option value="高中中专及以下">高中中专及以下</option>
													<option value="大专">大专</option>
													<option value="本科">本科</option>
													<option value="双学士">双学士</option>
													<option value="硕士">硕士</option>
													<option value="博士">博士</option>
													<option value="博士后">博士后</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>

										<tr>
											<td><span class="infoText">现居地:</span></td>
											<td><select id="bPlace" class="selectNowPlace">
													<option value="重庆">重庆</option>
													<option value="北京">北京</option>
													<option value="上海">上海</option>
													<option value="广东">广东</option>
													<option value="湖南">湖南</option>
											</select> <select id="sPlace" class="selectNowPlace">
													<option value="巴南">巴南</option>
													<option value="江北">江北</option>
													<option value="南岸">南岸</option>
													<option value="双桥">双桥</option>
													<option value="万州">万州</option>
											</select></td>

										</tr>
									</table>
								</div>
								<div class="infoDivRight">
									<table class="infoTable" style="float: right;">

										<tr>
											<td><span class="infoText">身份证:</span></td>
											<td><span id="ID" class="infoText"><%=base.getID()%></span></td>
										</tr>
										<tr>
											<td><span class="infoText">性别:</span></td>
											<td><span id="sex" class="infoText"><%=base.getSex()%></span></td>
										</tr>
										<tr>
											<td><span class="infoText">QQ号码:</span></td>
											<td><input id="QQ" class="form-control"
												value="<%=base.getQQ()%>" /></td>
										</tr>
										<tr>
											<td><span class="infoText">血型:</span></td>
											<td><select id="bloodSelect" class="selectInfo">
													<option value="A">A</option>
													<option value="B">B</option>
													<option value="AB">AB</option>
													<option value="O">O</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">职业:</span></td>
											<td><select id="professionSelect" class="selectInfo">
													<option value="在校学生">在校学生</option>
													<option value="军人">军人</option>
													<option value="老师">老师</option>
													<option value="白领">白领</option>
													<option value="家庭主妇">家庭主妇</option>
													<option value="歌手">歌手</option>
													<option value="网管">网管</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">婚姻状况:</span></td>
											<td><select id="marriageSelect" class="selectInfo"
												name="marriage">
													<option value="未婚">未婚</option>
													<option value="已婚">已婚</option>
													<option value="丧偶">丧偶</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">是否有房:</span></td>
											<td><select id="hasHouseSelect" class="selectInfo">
													<option value="已购房">已购房</option>
													<option value="与父母同住">与父母同住</option>
													<option value="租房">租房</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">月薪:</span></td>
											<td><select id="incomeSelect" class="selectInfo">
													<option value="2000元以下">2000元以下</option>
													<option value=2000-5000元>2000-5000元</option>
													<option value="5000-10000元">5000-10000元</option>
													<option value="10000-20000元">10000-20000元</option>
													<option value="20000元以上">20000元以上</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
									</table>
								</div>
							</div>
							<div class="saveInfo" id="updateBaseInfo">保存资料</div>
						</div>
						<!-- 基本资料end -->

						<!-- 详细信息begin -->
						<div class="tab-pane fade" id="detailedInfo">
							<div class="infoDiv">
								<div class="infoDivLeft">
									<table class="infoTable">
										<tr>
											<td><span class="infoText">是否想要小孩:</span></td>
											<td><select class="selectInfo" id="selectWantChildAble">
													<option value="想">想</option>
													<option value="不想">不想</option>
													<option value="还没想好">还没想好</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">喜欢的异性类型:</span></td>
											<td><select id="loverTypeSelect" class="selectInfo">
													<option value="善解人意">善解人意</option>
													<option value="活泼开朗">活泼开朗</option>
													<option value="娇小可爱">娇小可爱</option>
													<option value="体贴温柔">体贴温柔</option>
													<option value="落落大方">落落大方</option>
													<option value="成熟魅力">成熟魅力</option>
													<option value="眉清目秀">眉清目秀</option>
													<option value="雍容华贵">雍容华贵</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">是否愿意和父母同住:</span></td>
											<td><select id="liveWithParentsAbleSelect"
												class="selectInfo">
													<option value="愿意">愿意</option>
													<option value="不愿意">不愿意</option>
													<option value="看情况">看情况</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>

									</table>
								</div>
								<div class="infoDivRight">
									<table class="infoTable">
										<tr>
											<td><span class="infoText">是否接受异地恋:</span></td>
											<td><select id="distanceLoveAbleSelect"
												class="selectInfo">
													<option value="是">是</option>
													<option value="否">否</option>
													<option value="看情况">看情况</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">能否接受婚前性行为:</span></td>
											<td><select id="sexAbleSelect" class="selectInfo">
													<option value="能">能</option>
													<option value="不能">不能</option>
													<option value="看情况">看情况</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">你最有魅力的部位:</span></td>
											<td><select id="prettyPartsSelect" class="selectInfo">
													<option value="笑容">笑容</option>
													<option value="脸蛋">脸蛋</option>
													<option value="眼睛">眼睛</option>
													<option value="秀眉">秀眉</option>
													<option value="头发">头发</option>
													<option value="鼻子">鼻子</option>
													<option value="嘴唇">嘴唇</option>
													<option value="耳朵">耳朵</option>
													<option value="大腿">大腿</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
									</table>

								</div>

								<div id="selectTag" title="贴标签">
									<div id="myTagDiv">
										<span class="infoText">已选择个性标签：</span>
									</div>
									<div id="showTag">
										<span class="infoText">标签库(点击选择)：</span> <span
											class="baseTag3 blueTagColor">宅心仁厚</span> <span
											class="baseTag1 redTagColor">可爱</span> <span
											class="baseTag1 xxxTagColor">诚信</span> <span
											class="baseTag1 blueTagColor">孝顺</span> <span
											class="baseTag1 redTagColor">正直</span> <span
											class="baseTag1 xxxTagColor">阳光</span> <span
											class="baseTag2 redTagColor">有腹肌</span> <span
											class="baseTag1 blueTagColor">运动</span> <span
											class="baseTag1 xxxTagColor">工作狂</span> <span
											class="baseTag3 blueTagColor">潮流女王</span> <span
											class="baseTag2 redTagColor">爱生活</span> <span
											class="baseTag1 redTagColor">内敛</span> <span
											class="baseTag1 blueTagColor">网游</span> <span
											class="baseTag3 redTagColor">小酌两杯</span> <span
											class="baseTag1 blueTagColor">旅行</span> <span
											class="baseTag1 xxxTagColor">潮男</span>
									</div>
								</div>
							</div>

							<div class="saveInfo" id="updateDetaInfo">保存资料</div>
						</div>
						<!-- 详细信息end -->

						<!--内心独白begin  -->
						<div class="tab-pane fade" id="heartInfo">
							<textarea id="heartArea" rows="10" cols="115"></textarea>
							<div>
								<span style="color:rgb(120,120,120)">请不要在内心独白中有任何联系以及不良信息,您可以输入<span
									style="color:rgb(0,214,223);font-weight: bold;margin: 0 10 0 10">200</span>个字
								</span>
								<div class="saveInfo" style="float: right;"
									id="updateIntroduction">确认提交</div>
							</div>
						</div>
						<!--内心独白end  -->

						<!-- 征友标准begin -->
						<div class="tab-pane fade" id="qualification">
							<div class="infoDiv">
								<div class="infoDivLeft">
									<table class="infoTable">
										<tr>
											<td><span class="infoText">希望对方居住地:</span></td>
											<td><select id="wantLivePlace" class="selectInfo">
													<option value="重庆">重庆</option>
													<option value="北京">北京</option>
													<option value="上海">上海</option>
													<option value="广东">广东</option>
													<option value="湖南">湖南</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">希望对方收入:</span></td>
											<td><select id="wantIncomeSelect" class="selectInfo">
													<option value="2000元以下">2000元以下</option>
													<option value=2000-5000元>2000-5000元</option>
													<option value="5000-10000元">5000-10000元</option>
													<option value="10000-20000元">10000-20000元</option>
													<option value="20000元以上">20000元以上</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">希望对方年龄:</span></td>
											<td><select id="wantLowestAgeSelect"
												class="selectInfo lowest" style="width: 77px;">
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
													<option value="保密">保密</option>
											</select><span style="margin: 0px 3px 0 5px;font-size: 14px">到</span>
												<select id="wantHighestAgeSelect" class="selectInfo height"
												style="width: 77px;">
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
													<option value="保密">保密</option>
											</select></td>
										</tr>
									</table>
								</div>
								<div class="infoDivRight">
									<table class="infoTable">
										<tr>
											<td><span class="infoText">希望对方学历:</span></td>
											<td><select id="wantEducationalSelect"
												class="selectInfo">
													<option value="高中中专及以下">高中中专及以下</option>
													<option value="大专">大专</option>
													<option value="本科">本科</option>
													<option value="双学士">双学士</option>
													<option value="硕士">硕士</option>
													<option value="博士">博士</option>
													<option value="博士后">博士后</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">希望对方体重:</span></td>
											<td><select id="wantWeightSelect" class="selectInfo">
													<option value="70">70斤</option>
													<option value="80">80斤</option>
													<option value="90">90斤</option>
													<option value="100">100斤</option>
													<option value="110">110斤</option>
													<option value="120">120斤</option>
													<option value="130">130斤</option>
													<option value="140">140斤</option>
													<option value="150">150斤</option>
													<option value="保密">保密</option>
											</select></td>
										</tr>
										<tr>
											<td><span class="infoText">希望对方身高:</span></td>
											<td><select id="wantLowestHeightSelect"
												class="selectInfo lowest" style="width: 77px;">
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
													<option value="保密">保密</option>
											</select><span style="margin: 0px 3px 0 5px;font-size: 14px">到</span>
												<select id="wantHighestHeightSelect"
												class="selectInfo height" style="width: 77px;">
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
													<option value="保密">保密</option>
											</select></td>
										</tr>
									</table>
								</div>

							</div>
							<div class="saveInfo" id="updateQualInfo">保存资料</div>
						</div>
						<!-- 征友标准end -->
						<div class="tab-pane fade" id="upHead">
							<div class="infoDiv">
								<div id="upLoadHead">
									<img id="upLoadHeadLogo"
										src="images/myTaoMei/upLoadHeadLogo.png">
									<div class="a-upload">
										<input id="upLoadHeadInput" type="file">
									</div>
								</div>
							</div>
							<img id="upLoadHeadTextImg" src="images/myTaoMei/upLoadHead.png">
						</div>

						<!--我的相册begin  -->
						<div class="tab-pane fade" id="photo">
							<div>
								<table id="photoTable" border="0">

								</table>
							</div>
						</div>
						<!--我的相册end  -->

						<!-- 身份验证信息begin -->
						<div class="tab-pane fade" id="IDValidate">
							<div>
								<p
									style="color:red;margin: auto;text-align: center;margin-bottom: 10px;font-size: 13px">如若相遇，实名才能有份，请进行实名认证</p>
								<table id="IDValidateTable">
									<tr>
										<td>
											<div class="subValidate" id="ID_infoPerfect">
												<img src="images/base/fullInfo2.png">
												<p>小有名气</p>
												<span>资料完善度达80%时获得</span>
												<div class="saveInfo" style="font-size: 14px">修改资料</div>
											</div>

										</td>
										<td>
											<div class="subValidate" id="ID_head">
												<img src="images/base/hasHead2.png">
												<p>有头有脸</p>
												<span>上传头像即可获得</span>
												<div class="saveInfo" style="font-size: 14px">更新头像</div>
											</div>

										</td>
										<td>
											<div class="subValidate" id="ID_photo">
												<img src="images/base/hasImg2.png">
												<p>千姿百态</p>
												<span>上传3张相片即可</span>
												<div class="saveInfo" style="font-size: 14px">上传相片</div>
											</div>

										</td>
									</tr>
									<tr>
										<td>
											<div class="subValidate" id="ID_IDCard">
												<img src="images/base/hasID2.png">
												<p>足行天下</p>
												<span>验证身份后即可升级</span>
												<div class="saveInfo" style="font-size: 14px">验证身份</div>
											</div>

										</td>
										<td>
											<div class="subValidate" id="ID_email">
												<img src="images/base/hasEmal2.png">
												<p>邮箱达人</p>
												<span>通过邮箱注册即可获得</span>
												<div class="saveInfo" style="font-size: 14px">已验证</div>
											</div>

										</td>
										<td>
											<div class="subValidate" id="ID_telphone">
												<img src="images/base/hasPhone2.png">
												<p>手机王子</p>
												<span>验证手机后即可升级</span>
												<div class="saveInfo" style="font-size: 14px">验证手机</div>
											</div>

										</td>
									</tr>
								</table>
							</div>
						</div>
						<!-- 身份验证信息end -->
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
	
	<!-- 身份验证弹出层begin -->
	<div class="allAlert" id="IDValidateAlert">
		<div class="alertBG"></div>
		<div class="baseAlert validateAlert">
			<div class="validateAlertTitle">
				验证身份证<span class="closeValidateAlert">×</span>
			</div>
			<div class="validateContent">
				<div class="input-group">
					<div class="input-group-addon" style="color:gray; font-size: 14px">姓名</div>
					<input class="form-control">
				</div>
				<div class="input-group">
					<div class="input-group-addon" style="color:gray; font-size: 14px">号码</div>
					<input class="form-control" maxlength="15" id="IDInput">
				</div>
				<div
					style="color:rgb(150,150,150);font-size: 12px;margin-top: 20px;">
					<p>为享受更好的安全服务，请进行实名认证。</p>

					注意身份证只能成功验证一次，请认真填写真实姓名和身份证号
				</div>
			</div>
			<div class="saveInfo" onclick="IDValidate()">提交验证</div>
			<span id="IDVilidateResult">验证失败！</span>
		</div>
	</div>
	<!-- 身份验证弹出层end -->
	
	<!-- 手机验证弹出层begin -->
	<div class="allAlert" id="telValidateAlert">
		<div class="alertBG"></div>
		<div class="baseAlert validateAlert" style="height: 200px">
			<div class="validateAlertTitle">
				验证手机号<span class="closeValidateAlert">×</span>
			</div>
			<div class="validateContent" style="padding-bottom: 20px">
				<div class="input-group">
					<div class="input-group-addon" style="color:gray; font-size: 14px">号码</div>
					<input class="form-control" maxlength="11" id="telInput">
				</div>
			</div>
			<div class="saveInfo" onclick="telValidate()">提交验证</div>
			<span id="telVilidateResult">验证失败！</span>
		</div>
	</div>
	<!-- 手机验证弹出层end -->
	
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
</body>

</html>