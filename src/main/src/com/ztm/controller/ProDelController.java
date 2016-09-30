package com.ztm.controller;


import com.ztm.dao.EasybuyProductDao;
import com.ztm.entity.EasybuyProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="ProDelController", urlPatterns="/proDel")
public class ProDelController extends BaseController {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        String userId = request.getParameter("id").trim();
        if(userId == null ||userId.length()<1) {
        }
        else {
            System.out.println(userId);
            EasybuyProductDao ebUserDao = new EasybuyProductDao();
            EasybuyProduct user = new EasybuyProduct();
            user.setEp_id(Integer.parseInt(userId));
            ebUserDao.delete(user);

        }
        response.sendRedirect("/manage/product.jsp");

    }

}
