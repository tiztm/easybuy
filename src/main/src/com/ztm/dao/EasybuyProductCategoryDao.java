package com.ztm.dao;


import com.ztm.core.dao.BaseDao;
import com.ztm.entity.EasybuyProduct;
import com.ztm.entity.EasybuyProductCategory;


public class EasybuyProductCategoryDao extends BaseDao<EasybuyProductCategory> {


    public EasybuyProductCategory getCategoryByID(int epc_id) {




        EasybuyProductCategory Bean = this.getBean("select * from easybuy_product_category where epc_id ="+epc_id);
        return Bean;

    }
}
