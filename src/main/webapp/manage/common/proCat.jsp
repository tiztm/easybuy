<%@ page import="com.ztm.dao.EasybuyProductCategoryDao" %>
<%@ page import="com.ztm.entity.EasybuyProductCategory" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String waitSelect = request.getAttribute("waitSelect")+"";

    EasybuyProductCategoryDao easybuyProductCategoryDao = new EasybuyProductCategoryDao();
    List<EasybuyProductCategory> listBean = easybuyProductCategoryDao.getListBean("select * from easybuy_product_category where epc_parent_id is null");
    //request.setAttribute("ebp_list",listBean);
    String epc_list = "";

    epc_list +="<option value='1000'" + (waitSelect.endsWith("1000")?"selected":"")+
            ">今日特价</option>"
            +"<option value='1001'" +(waitSelect.endsWith("1001")?"selected":"")+
            ">热卖推荐</option>";
    for (EasybuyProductCategory easybuyProductCategory : listBean) {

        String fathername = easybuyProductCategory.getEpc_name();

        List<EasybuyProductCategory> childBean = easybuyProductCategoryDao.getListBean("select * from easybuy_product_category where epc_parent_id ="+easybuyProductCategory.getEpc_id());
        for (EasybuyProductCategory productCategory : childBean) {
            String se = "";
            if(waitSelect!=null&&waitSelect.endsWith(productCategory.getEpc_id()+""))
                se = " selected ";

            epc_list +="<option value='" +productCategory.getEpc_id()+
                    "'" +se+
                    ">" +fathername+
                    " - " + productCategory.getEpc_name() +
                    "</option>";
        }
    }
    request.setAttribute("epc_list",epc_list);


%>