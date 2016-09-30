package com.ztm.controller;

import com.ztm.dao.EasybuyProductCategoryDao;
import com.ztm.dao.EasybuyProductDao;
import com.ztm.entity.EasybuyProduct;
import com.ztm.entity.EasybuyProductCategory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet(name = "ProductAddController", urlPatterns="/addPro")
public class ProductAddController extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        add(request, response);
    }



    /**
     * 上传图片
     */
    private String uploadPhoto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part part = request.getPart("photo");
        if(part == null) {
            return "";
        }
        String header = part.getHeader("Content-Disposition");
        String fileName = header.substring(header.indexOf("filename=\"")+10,header.lastIndexOf("\""));
        if(fileName != null && !"".equals(fileName)) {
            part.write(fileName);
        }
        return fileName;
    }

    /**
     * 新增商品
     */
    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        EasybuyProductDao easybuyProductDao = new EasybuyProductDao();

        String productName = request.getParameter("productName").trim();
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

        ep_file_name = uploadPhoto(request,response);


        EasybuyProduct product = new EasybuyProduct();
        product.setEp_name(productName);
        product.setEp_description(productDescription);
        product.setEp_price(productPrice);
        product.setEp_stock(productStock);
        product.setEpc_id(epc_id);
        product.setEpc_child_id(epc_child_id);
        product.setEp_file_name(ep_file_name);
        System.out.println(ep_file_name);
        int result = easybuyProductDao.save(product);
        if(result != 0)
        {
            response.sendRedirect("/manage/manage-result.jsp?resultPage=/manage/product.jsp");
        }
        else {

            request.getRequestDispatcher("/manage/product-add.jsp").forward(request,response);
        }
    }

    /**
     * 删除商品
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

}
