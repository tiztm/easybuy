package com.ztm.entity;

import com.ztm.core.util.anno.PrimaryKey;

/**
 * Created by NilsZhang
 */
public class EasybuyOrderDetail {
    @PrimaryKey
    private int eod_id;
    private int eo_id;
    private int ep_id;
    private int eod_quantity;
    private int eod_cost;

    public int getEp_id() {
        return ep_id;
    }

    public void setEo_id(int eo_id) {
        this.eo_id = eo_id;
    }

    public int getEo_id() {
        return eo_id;
    }

    public int getEod_cost() {
        return eod_cost;
    }

    public int getEod_id() {
        return eod_id;
    }

    public int getEod_quantity() {
        return eod_quantity;
    }

    public void setEod_cost(int eod_cost) {
        this.eod_cost = eod_cost;
    }

    public void setEod_id(int eod_id) {
        this.eod_id = eod_id;
    }

    public void setEp_id(int ep_id) {
        this.ep_id = ep_id;
    }

    public void setEod_quantity(int eod_quantity) {
        this.eod_quantity = eod_quantity;
    }

}
