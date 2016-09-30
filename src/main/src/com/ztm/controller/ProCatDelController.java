package com.ztm.controller;


import com.ztm.dao.EasybuyProductCategoryDao;
import com.ztm.entity.EasybuyProductCategory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="ProCatDelController", urlPatterns="/proCatDel")
public class ProCatDelController extends BaseController {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        String userId = request.getParameter("id").trim();
        if(userId == null ||userId.length()<1) {
        }
        else {
            System.out.println(userId);
            EasybuyProductCategoryDao ebUserDao = new EasybuyProductCategoryDao();
            EasybuyProductCategory user = new EasybuyProductCategory();
            user.setEpc_id(Integer.parseInt(userId));
            ebUserDao.delete(user);

        }
        response.sendRedirect("/manage/productClass.jsp");

    }

}
