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

<%@ include file="common/header.jsp" %>

<div class="main">
		<h2>提示信息</h2>
		<div class="manage">
			<div class="shadow">
				<em class="corner lb"></em>
				<em class="corner rt"></em>
				<div class="box">
					<div class="msg">
						<p>恭喜：操作成功！</p>
						<script type="text/javascript">
							setTimeout("location.href='${param.resultPage}'", 1000);
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 易买网 All Rights Reserved. 苏ICP证1000001号
</div>
</body>
</html>
