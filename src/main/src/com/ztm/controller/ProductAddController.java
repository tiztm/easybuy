package com.ztm.controller;

import com.ztm.dao.EasybuyProductCategoryDao;
import com.ztm.dao.EasybuyProductDao;
import com.ztm.entity.EasybuyProduct;
import com.ztm.entity.EasybuyProductCategory;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "ProductAddController", urlPatterns="/addPro")
@MultipartConfig
public class ProductAddController extends  BaseController {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf8");
        EasybuyProductDao easybuyProductDao = new EasybuyProductDao();

        String productName = request.getParameter("productName").toString();
        String productPriceStr = request.getParameter("productPrice").trim();
        int productPrice = 0;
        if(productPriceStr != null && !"".equals(productPriceStr)) {
            productPrice = Integer.parseInt(productPriceStr);
        }
        String productDescription = request.getParameter("productDescription").trim();
        String productStockStr = request.getParameter("productStock").trim();
        int productStock = 0;
        if(productStockStr != null && !"".equals(productStockStr)) {
            productStock = Integer.parseInt(productStockStr);
        }
        String epc_child_idStr = request.getParameter("parentId");
        int epc_child_id = 0;
        if(epc_child_idStr != null && !"".equals(epc_child_idStr)) {
            epc_child_id = Integer.parseInt(epc_child_idStr);
        }
        int epc_id = epc_child_id;
        EasybuyProductCategoryDao categoryDao = new EasybuyProductCategoryDao();
        EasybuyProductCategory category = categoryDao.getCategoryByID(epc_id);
        if(category != null&&category.getEpc_parent_id()>0) {
            epc_id = category.getEpc_parent_id();
        }
        String ep_file_name = null;

        ep_file_name = uploadPhoto(request,response,"photo");

        String id = request.getParameter("id");
        EasybuyProduct product = null;
        if(id == null ||id.length()<1) {
            product = new EasybuyProduct();
        }
        else {
            product = easybuyProductDao.getByID(Integer.parseInt(id));
        }



        product.setEp_name(productName);
        product.setEp_description(productDescription);
        product.setEp_price(productPrice);
        product.setEp_stock(productStock);
        product.setEpc_id(epc_id);
        product.setEpc_child_id(epc_child_id);
        if(ep_file_name!=null&&ep_file_name.length()>1)
            product.setEp_file_name(ep_file_name);

        if(id == null ||id.length()<1) {
           easybuyProductDao.save(product);
        }
        else {
            easybuyProductDao.update(product);
        }

        response.sendRedirect("/manage/manage-result.jsp?resultPage=/manage/product.jsp");
    }




}
