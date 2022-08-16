<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">

		<title>桃梅网-登陆</title>
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
<script type="text/javascript" src="dwr/interface/ValidateDWR.js"></script>
<script type="text/javascript" src="js/login/login.js"></script>
		<link rel="stylesheet" href="css/login/login.css" />
	</head>

	<body>
		<div id="all">
			<div id="header">
				<img src="images/register/logo.png">
				<div></div>
				<span>自由婚恋网站</span>
			</div>
			<div id="center">
				<div id="allLogin">
					<div id="login">
						<div id="loginTitle">
							<span>会员登陆</span>
						</div>
						<div id="loginPointDiv">
										<img src="images/login/loginPoint.png" id="loginPointImg">
										<span id="loginPointText"></span>
									</div>
						<div>
						<table id="loginTable">
							<tr>
								<td>登陆账号</td>
								<td><input id="account" maxlength="20" value="904620272@qq.com" class="form-control" placeholder="请输入邮箱"/></td>
							</tr>
							<tr>
								<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</td>
								<td><input id="passWords"type="passWord" maxlength="14" value="aaa8824879" class="form-control" placeholder="请输入密码"/></td>
							</tr>
							<tr style="height: 30px;">
								<td>&nbsp;</td>
								<td>
									<input id="login2" type="checkbox">
									<span id="loginLabel2">两周内自动登陆</span>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>
									<div id="sureLogin">登陆</div>
									<span id="losePass">忘记密码</span>
								</td>
							</tr>
							<tr>
								<td><span id="otherLoginText">其他账号登陆</span></td>
								<td>
									<img src="images/login/otherLogin.png" id="otherLogin">
								</td>
							</tr>
							<tr><td></td>
								<td>
									<a href="jsp/register/register.jsp" id="gotoRegister">还不是会员?立即注册</a>
								</td>
							</tr>
						</table>
						</div>
					</div>
					<div>
					<img src="images/login/loginBG.png" id="loginImg">
				</div>
				</div>
				
			</div>
			<div id="footer">
				<img src="images/login/footer.png">
			</div>
		</div>
	</body>

</html>