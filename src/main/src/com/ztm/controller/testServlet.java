package com.ztm.controller;

import com.ztm.dao.EasybuyCommentDao;
import com.ztm.entity.EasybuyComment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by IDEA
 * User:    tiztm
 * Date:    2016/9/27.
 */
@WebServlet(name="testServlet", urlPatterns="/test")
public class testServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {


        String ecid = request.getParameter("ecid");

        EasybuyCommentDao ebcDao = new EasybuyCommentDao();

        EasybuyComment ebc = new EasybuyComment();
        ebc.setEc_nick_name("1");
        ebc.setEc_content("2");


        ebcDao.save(ebc);

        ebc.setEc_id(2);

        ebc.setEc_content(ecid+"");

        ebcDao.update(ebc);

        EasybuyComment bean = ebcDao.getBean("select * from easybuy_comment where ec_id = "+ecid);

        response.getWriter().write(bean!=null?bean.getEc_reply_time().getTime()+"'":"1");
    }

}