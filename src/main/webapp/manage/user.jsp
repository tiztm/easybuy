<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ztm.entity.EasybuyUser" %>
<%@ page import="com.ztm.dao.EasybuyUserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="common/import.jsp" %>
</head>
<body>
<%
	EasybuyUserDao ebUserDao = new EasybuyUserDao();
	String pageNumberStr = request.getParameter("pageNumber");
	int pageNumber = 1;     //当前页
	int pageSize = 10;  //每页显示条数
	if(pageNumberStr != null && !"".equals(pageNumberStr)) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	int totalUsers = ebUserDao.getUsersCount(); // 总用户数
	int totalPages = totalUsers/pageSize + ((totalUsers%pageSize) > 0 ? 1 : 0); //总页数
	int firstItemID = (pageNumber-1)*pageSize;

	request.setAttribute("pageNumber",pageNumber);
	request.setAttribute("pageSize",pageSize);
	request.setAttribute("totalUsers",totalUsers);
	request.setAttribute("totalPages",totalPages);

	List<EasybuyUser> usersList = ebUserDao.getUsersList( firstItemID, pageSize);
	request.setAttribute("users_list",usersList);
	request.setAttribute("nextAction","user.jsp");



%>


<%@ include file="common/header.jsp" %>

<div class="main">
		<h2>用户管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>姓名</th>
					<th>性别</th>
					<th>Email</th>
					<th>手机</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${requestScope.users_list}" var="user" varStatus="abc">
					<tr>
						<td class="first w4 c">${user.eu_user_id}</td>
						<td class="w1 c">${user.eu_user_name}</td>
						<td class="w2 c">
							<c:if test="${user.eu_sex == 1}">男</c:if>
							<c:if test="${user.eu_sex == 2}">女</c:if>
						</td>
						<td class="w2 c">
							${user.eu_email}
						</td>
						<td class="w4 c">
							${user.eu_mobile}
						</td>
						<td class="w5 c">
							<c:if test="${user.eu_user_name != 'admin'}">
							<a href="javascript:Delete('/userDel','${user.eu_user_id}');">
								<label class="ui-blue"><input type="submit" name="submit" value="删除" /></label>
							</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>

				<%@ include file="common/page.jsp" %>

			</table>



		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 易买网 All Rights Reserved. 苏ICP证1000001号
</div>
</body>
</html>
