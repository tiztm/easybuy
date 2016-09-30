package com.ztm.controller;



import com.ztm.dao.EasybuyUserDao;
import com.ztm.entity.EasybuyUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="UserDelController", urlPatterns="/userDel")
public class UserDelController extends BaseController {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");


        String userId = request.getParameter("id").trim();

        if(userId == null ||userId.length()<1) {

        }
        else {
            System.out.println(userId);
            EasybuyUserDao ebUserDao = new EasybuyUserDao();
            EasybuyUser user = new EasybuyUser();
            user.setEu_user_id(Integer.parseInt(userId));
            ebUserDao.delete(user);
            //EasybuyUser user = ebUserDao.getUserByName(userName);
        }

        response.sendRedirect("/manage/user.jsp");

    }

}
