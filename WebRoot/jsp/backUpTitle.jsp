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
<title>My JSP 'showPal.jsp' starting page</title>
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
<link rel="stylesheet" href="css/myTaoMei/title.css" />
<script type="text/javascript" src="js/myTaoMei/info.js"></script>
</head>

<body>
	<%
		String infoType = request.getParameter("infoType");
		UnionUser union = (UnionUser) session.getAttribute("unionUser");
		BaseInfoUser base = union.getBaseInfoUser();
		OtherInfoUser othe = union.getOtherInfoUser();
	%>
	<input id="infoType" value="<%=infoType%>" type="hidden">
	<input id="users_id" value="<%=base.getUsers_id()%>" type="hidden">
	<div id="all">
		<!-- ????????????begin -->
		<div id="allHead">
			<!-- ????????????begin -->
			<div id="head">
				<div id="headContent">
					<img id="logo" src="images/register/logo.png">
					<ul class="titleNavLeft">
						<li><a href="#">??????<span class=titleFenGe>|</span></a></li>
						<li><a href="#" style="color:rgb(236,93,167);)">????????????<span
								class=titleFenGe>|</span></a></li>
						<li><a href="#">??????<span class=titleFenGe>|</span></a></li>
						<li><a href="#">??????<span class=titleFenGe>|</span></a></li>
						<li><a href="#">?????????<span class=titleFenGe>|</span></a></li>
						<li><a href="#">??????<span class=titleFenGe>|</span></a></li>
						<li><a href="#">?????????</a></li>
					</ul>
					<ul class="titleNavRight">
						<li><a href="#">??????</a></li>
						<li><span class="accountInfoText">??????:</span> <a href="#"><%=othe.getMeiyuan()%></a>
							<span class=titleFenGe></span></li>
						<li><span class="accountInfoText">??????ID:</span><a href="#"><%=base.getUsers_id()%></a>
							<span class=titleFenGe></span></li>
						<li><span class="accountInfoText">hi,</span> <a href="#"><%=base.getNickName()%></a>
							<span class=titleFenGe></span></li>
					</ul>
				</div>
			</div>
			<!-- ????????????end -->
		</div>
		<!-- ????????????end -->
		
		<!-- ????????????begin -->
		<div>
		
		</div>
		<!-- ????????????end -->
		
		<div id="footer">
		
		</div>
	</div>
	
	
</body>

</html>