package com.ztm.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

    SimpleDateFormat sdf = new SimpleDateFormat("ssSSS");
    /**
     * 上传图片
     * 将request中的图片保存在服务器上
     */
    protected String uploadPhoto(HttpServletRequest request, HttpServletResponse response,String upFileName ) throws ServletException, IOException {
        Part part = request.getPart(upFileName);
        if(part == null) {
            return "";
        }
        String header = part.getHeader("Content-Disposition");
        String fileName = header.substring(header.indexOf("filename=\"")+10,header.lastIndexOf("\""));
        if(fileName != null && !"".equals(fileName)) {
            fileName = "/images/" +sdf.format( new Date() )+ fileName;
            part.write(getServletConfig().getServletContext().getRealPath("/") + fileName);
        }
        return fileName;
    }

}
