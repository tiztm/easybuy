package com.ztm.controller;


import com.ztm.dao.EasybuyUserDao;
import com.ztm.entity.EasybuyUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name="RegisterController", urlPatterns="/register")
public class RegisterController extends BaseController {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String userName = request.getParameter("userName").trim();
        String passWord = request.getParameter("passWord").trim();

        if(userName==null||userName.length()<1||passWord==null||passWord.length()<1)

        {
            response.sendRedirect("error.jsp");
            return;
        }

        String addr = request.getParameter("addr");
        EasybuyUser new_user = new EasybuyUser();
        new_user.setEu_user_name(userName);
        new_user.setEu_password(passWord);
        new_user.setEu_address(addr);
        new_user.setEu_status(1);
        EasybuyUserDao user_dao = new EasybuyUserDao();

       // user_dao.addUser(new_user);
       if(user_dao.register(new_user)==true)
       { response.sendRedirect("reg-result.jsp");
    }else
       {
           response.sendRedirect("error.jsp");
       }
    }

}
