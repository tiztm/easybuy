package com.ztm.controller;


import com.ztm.dao.EasybuyOrderDao;
import com.ztm.entity.EasybuyOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="OrderDelController", urlPatterns="/orderDel")
public class OrderDelController extends BaseController {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        String userId = request.getParameter("id").trim();
        if(userId == null ||userId.length()<1) {
        }
        else {
            System.out.println(userId);
            EasybuyOrderDao ebUserDao = new EasybuyOrderDao();
            EasybuyOrder user = new EasybuyOrder();
            user.setEo_id(Integer.parseInt(userId));
            ebUserDao.delete(user);

        }
        response.sendRedirect("/manage/order.jsp");

    }

}
