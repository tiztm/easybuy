<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ztm.entity.EasybuyUser" %>
<%@ page import="com.ztm.dao.EasybuyUserDao" %>
<%@ page import="com.ztm.entity.EasybuyProductCategory" %>
<%@ page import="com.ztm.dao.EasybuyProductCategoryDao" %>
<%@ page import="com.ztm.entity.EasybuyProduct" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="common/import.jsp" %>
</head>
<body>
<%

	EasybuyProductCategoryDao easybuyProductCategoryDao = new EasybuyProductCategoryDao();
	List<EasybuyProductCategory> listBean = easybuyProductCategoryDao.getListBean("select * from easybuy_product_category where epc_parent_id is null");
	//request.setAttribute("ebp_list",listBean);
	String epc_list = "";
	for (EasybuyProductCategory easybuyProductCategory : listBean) {

		epc_list +="<option value=\"" +easybuyProductCategory.getEpc_id()+
				"\">" + easybuyProductCategory.getEpc_name() +
				"</option>";

		List<EasybuyProductCategory> childBean = easybuyProductCategoryDao.getListBean("select * from easybuy_product_category where epc_parent_id ="+easybuyProductCategory.getEpc_id());
		for (EasybuyProductCategory productCategory : childBean) {
			epc_list +="<option value='" +productCategory.getEpc_id()+
					"'>├ " + productCategory.getEpc_name() +
					"</option>";
		}



		//easybuyProductCategory.setEpcList(childBean);
	}
	request.setAttribute("epc_list",epc_list);


%>


<%@ include file="common/header.jsp" %>
	<div class="main">
		<h2>添加商品</h2>
		<div class="manage">
			<form action="../addPro" method="post">
				<table class="form">
					<tr>
						<td class="field">商品名称：</td>
						<td><input type="text" class="text" name="productName" value="" /></td>
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
						<td><input type="text" class="text tiny" name="productPrice" /> 元</td>
					</tr>

					<tr>
						<td class="field">库存：</td>
						<td><input type="text" class="text tiny" name="productStock" /></td>
					</tr>
					<tr>
						<td class="field">描述：</td>
						<td><input type="text" class="text" name="productDescription" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label></td>
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
