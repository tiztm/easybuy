<%@ page import="com.ztm.dao.EasybuyOrderDao" %>
<%@ page import="com.ztm.entity.EasybuyOrder" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="common/import.jsp" %>
</head>
<body>
<%


	String orderId = request.getParameter("orderId");
	String userName = request.getParameter("userName");
	EasybuyOrderDao ebProDao = new EasybuyOrderDao();
	if((orderId!=null&&orderId.length()>0)||(userName!=null&&userName.length()>0))
	{
		String con = "";
		if(orderId!=null&&orderId.length()>0)
		{
			con+=" and eo_id = "+orderId;
		}

		if(userName!=null&&userName.length()>0)
		{
			con+=" and eo_user_name like '%"+userName+"%'";
		}

		String sql = "select * from easybuy_order where 1=1 " + con;
		//System.out.printf(sql);
		List<EasybuyOrder> usersList = ebProDao.getListBean(sql);
		request.setAttribute("users_list",usersList);

		request.setAttribute("totalPages",1);
		request.setAttribute("totalUsers",usersList.size());
	}
	else
	{

	String pageNumberStr = request.getParameter("pageNumber");
	int pageNumber = 1;     //当前页
	int pageSize = 10;  //每页显示条数
	if(pageNumberStr != null && !"".equals(pageNumberStr)) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	int totalUsers = ebProDao.getAllCount(); // 总用户数
	int totalPages = totalUsers/pageSize + ((totalUsers%pageSize) > 0 ? 1 : 0); //总页数
	int firstItemID = (pageNumber-1)*pageSize;

	request.setAttribute("pageNumber",pageNumber);
	request.setAttribute("pageSize",pageSize);
	request.setAttribute("totalUsers",totalUsers);
	request.setAttribute("totalPages",totalPages);

	List<EasybuyOrder> usersList = ebProDao.getPagedList(firstItemID, pageSize);
	request.setAttribute("users_list",usersList);
	request.setAttribute("nextAction","order.jsp");
	}



%>


<%@ include file="common/header.jsp" %>
	<div class="main">
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">
				<form method="get" action="order.jsp">
					订单号：<input type="text" class="text" name="orderId" />
					订货人：<input type="text" class="text" name="userName" />
					<label class="ui-blue"><input type="submit"  value="查询" />
					</label>
				</form>
			</div>
			<div class="spacer"></div>
			<table class="list">
				<tr>
					<th>ID</th>
					<th>姓名</th>
					<th>价格</th>
					<th>发货地址</th>
					<th>操作</th>
				</tr>



			<c:forEach items="${requestScope.users_list}" var="user" varStatus="abc">
				<tr>
					<td class="first w4 c">${user.eo_id}</td>
					<td class="w1 c">${user.eo_user_name}</td>
					<td class="w1 c">${user.eo_cost}</td>
					<td>${user.eo_user_address}</td>

					<td class="w1 c"> <a href="javascript:Delete('/orderDel','${user.eo_id}');">删除</a></td>
				</tr>
			</c:forEach>
			</table>
			<%@ include file="common/page.jsp" %>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 易买网 All Rights Reserved. 苏ICP证1000001号
</div>
</body>
</html>
