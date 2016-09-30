<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.ztm.dao.EasybuyProductCategoryDao" %>
<%@ page import="com.ztm.entity.EasybuyProductCategory" %>
<%@ page import="java.util.List" %>
<%

    EasybuyProductCategoryDao easybuyProductCategoryDao = new EasybuyProductCategoryDao();
    List<EasybuyProductCategory> listBean = easybuyProductCategoryDao.getListBean("select * from easybuy_product_category where epc_parent_id is null");

    if(listBean!=null)
    {
    //request.setAttribute("ebp_list",listBean);
    String epc_list = "";
    for (EasybuyProductCategory easybuyProductCategory : listBean) {

        epc_list +="<dt>"+ easybuyProductCategory.getEpc_name() +
                "</dt>";

        List<EasybuyProductCategory> childBean = easybuyProductCategoryDao.getListBean("select * from easybuy_product_category where epc_parent_id ="+easybuyProductCategory.getEpc_id());
        for (EasybuyProductCategory productCategory : childBean) {
            epc_list +="<dd><a href='product-list.jsp?id=" +productCategory.getEpc_id()+
                    "'>" + productCategory.getEpc_name() +
                    "</a></dd>";
        }



        //easybuyProductCategory.setEpcList(childBean);
    }
    request.setAttribute("epc_list",epc_list);
    }


%>