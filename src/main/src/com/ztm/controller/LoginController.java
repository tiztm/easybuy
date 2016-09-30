package com.ztm.controller;



import com.ztm.dao.EasybuyUserDao;
import com.ztm.entity.EasybuyUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name="LoginController", urlPatterns="/login")
public class LoginController extends BaseController {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");


        String userName = request.getParameter("userName").trim();
        String password = request.getParameter("passWord").trim();
        String errorPage = "/login.jsp";
        if(userName == null ||userName.length()<1 || password == null) {

            request.setAttribute("msg","未填写用户名密码");
            forwardPage(request, response, errorPage);

            return;
        }
        EasybuyUserDao ebUserDao= new EasybuyUserDao();
        EasybuyUser user = ebUserDao.getUserByName(userName);
        if(user != null && user.getEu_password() != null && user.getEu_password().equals(password))
        {
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            if(user.getEu_status() == 2) {
                response.sendRedirect("/manage/index.jsp");
            } else{
                response.sendRedirect("/index.jsp");
            }
        }
        else
        {
            request.setAttribute("msg","密码错误");

            forwardPage(request, response, errorPage);
        }
    }

}
