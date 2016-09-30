<%@ page import="com.ztm.dao.EasybuyProductDao" %>
<%@ page import="com.ztm.entity.EasybuyProduct" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="common/import.jsp" %>
</head>
<body>
<%
	String epcid = request.getParameter("id");

	int epc_id = -1;
	try {
		epc_id = Integer.parseInt(epcid);
	} catch (NumberFormatException e) {
		e.printStackTrace();
	}
	EasybuyProduct epdByID = null;
	if(epc_id<1)
	{
		epdByID = new EasybuyProduct();
	}
	else
	{
		EasybuyProductDao epd = new EasybuyProductDao();
		epdByID = epd.getByID(epc_id);


		request.setAttribute("waitSelect",epdByID.getEpc_child_id());

	}
	request.setAttribute("epdByID",epdByID);
%>
<%@ include file="common/proCat.jsp" %>

<%@ include file="common/header.jsp" %>
	<div class="main">
		<h2>修改商品</h2>
		<div class="manage">
			<form action="../addPro" method="post" enctype="multipart/form-data">
				<input type="hidden" class="text" name="id" value="${epdByID.ep_id}" />
				<table class="form">
					<tr>
						<td class="field">商品名称：</td>
						<td><input type="text" class="text" name="productName" value="${epdByID.ep_name}" /></td>
					</tr>
					<tr>
						<td class="field">所属分类：</td>
						<td>
							<select name="parentId">
								${epc_list}
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">商品图片：</td>
						<td><input type="file" class="text" name="photo" /></td>
					</tr>
					<tr>
						<td class="field">商品价格：</td>
						<td><input type="text" class="text tiny" name="productPrice" value="${epdByID.ep_price}" /> 元</td>
					</tr>

					<tr>
						<td class="field">库存：</td>
						<td><input type="text" class="text tiny" name="productStock" value="${epdByID.ep_stock}"  /></td>
					</tr>
					<tr>
						<td class="field">描述：</td>
						<td><input type="text" class="text" name="productDescription" value="${epdByID.ep_description}" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="修改" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 易买网 All Rights Reserved. 苏ICP证1000001号
</div>
</body>
</html>
