package com.ztm.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by IDEA
 * User:    tiztm
 * Date:    2016/9/30.
 */
public class BaseController  extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }



    protected void forwardPage(HttpServletRequest request, HttpServletResponse response, String errorPage) throws ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher rd = null;
        rd = sc.getRequestDispatcher(errorPage);
        rd.forward(request, response);
    }

}
