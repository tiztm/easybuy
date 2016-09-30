package com.ztm.controller;

import com.ztm.dao.EasybuyOrderDao;
import com.ztm.dao.EasybuyProductDao;
import com.ztm.entity.EasybuyOrder;
import com.ztm.entity.EasybuyProduct;
import com.ztm.entity.EasybuyUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


@WebServlet(name = "OrderProController", urlPatterns="/orderPro")
public class OrderProController extends  BaseController {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        EasybuyProductDao easybuyProductDao = new EasybuyProductDao();
        EasybuyUser user = (EasybuyUser)request.getSession().getAttribute("user");
        String id = request.getParameter("id");
        EasybuyProduct product = null;
        if(user==null||id == null ||id.length()<1) {
            response.sendRedirect("/error.jsp");
            return;
        }
        else {

            product = easybuyProductDao.getByID(Integer.parseInt(id));
        }



        EasybuyOrder ebo = new EasybuyOrder();
        ebo.setEo_cost(product.getEp_price());
        ebo.setEo_create_time(new Date());
        ebo.setEo_status(0);
        ebo.setEo_user_name(user.getEu_user_name());
        ebo.setEo_user_id(user.getEu_user_id());
        ebo.setEo_user_address(user.getEu_address());
        EasybuyOrderDao eod  = new EasybuyOrderDao();
        eod.save(ebo);





        response.sendRedirect("/shopping-result.jsp");
    }




}
