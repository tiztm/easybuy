package com.ztm.dao;

import com.ztm.core.dao.BaseDao;
import com.ztm.entity.*;

import java.util.ArrayList;
import java.util.List;


public class EasybuyUserDao extends BaseDao<EasybuyUser>{

    public EasybuyUser getUserByName(String userName) {

        String sql = null;
        List<String> params = new ArrayList<String>();;

        sql = "select * from easybuy_user where eu_user_name = '"+userName+"'";
        //params.add(userName);

        return this.getBean(sql);

    }

    public List<EasybuyUser> getAll() {

        String sql = null;

        sql = "select * from easybuy_user ";
        //params.add(userName);

        return this.getListBean(sql);

    }


    public boolean register(EasybuyUser new_user) {
        this.save(new_user);
        return true;
    }

    public int getUsersCount() {

        String sql = null;

        sql = "select count(*) from easybuy_user ";
        //params.add(userName);

        return BaseDao.getCount(sql);
    }

    public List<EasybuyUser> getUsersList( int firstItemID, int pageSize) {


        String sql = "select * from easybuy_user limit "+firstItemID+","+pageSize;

        return this.getListBean(sql);

    }
}