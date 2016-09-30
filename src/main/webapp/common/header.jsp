<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page isELIgnored ="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="header" class="wrap">
	<div id="logo"><a href="/index.jsp"><img src="images/logo.gif" /></a></div>
	<div class="help">

		<c:if test="${user == null}">

		<a href="login.jsp">登录</a><a href="register.jsp">注册</a>
			</c:if>
<c:if test="${user != null}">
		${user.eu_user_name}
	<c:if test="${user.eu_user_name eq 'admin'}">
		<a href="/manage/index.jsp">管理平台</a>
	</c:if>
</c:if>
	</div>
	<div class="navbar">
		<ul class="clearfix">
			<li class="current">首页</li>
			<li>图书</li>
			<li>百货</li>
			<li>品牌</li>
			<li>促销</li>
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="wrap">
		<ul class="clearfix">
			<li class="first">音乐</li>
			<li>影视</li>
			<li>少儿</li>
			<li>动漫</li>
			<li>小说</li>
			<li>外语</li>
			<li>数码相机</li>
			<li>笔记本</li>
			<li>羽绒服</li>
			<li>秋冬靴</li>
			<li>运动鞋</li>
			<li>美容护肤</li>
			<li>家纺用品</li>
			<li>婴幼奶粉</li>
			<li>饰品</li>
			<li class="last">Investor Relations</li>
		</ul>
	</div>
</div>
