package com.ztm.entity;

import com.ztm.core.util.anno.PrimaryKey;

import java.util.Date;

/**
 * Created by NilsZhang
 */
public class EasybuyComment {

    @PrimaryKey
    private int ec_id;

    private String ec_reply;
    private String ec_content;
    private Date ec_create_time;
    private Date ec_reply_time;
    private String ec_nick_name;

    public int getEc_id() {
        return ec_id;
    }

    public String getEc_content() {
        return ec_content;
    }

    public Date getEc_create_time() {
        return ec_create_time;
    }

    public String getEc_nick_name() {
        return ec_nick_name;
    }

    public String getEc_reply() {
        return ec_reply;
    }

    public Date getEc_reply_time() {
        return ec_reply_time;
    }

    public void setEc_id(int ec_id) {
        this.ec_id = ec_id;
    }

    public void setEc_content(String ec_content) {
        this.ec_content = ec_content;
    }

    public void setEc_create_time(Date ec_create_time) {
        this.ec_create_time = ec_create_time;
    }

    public void setEc_nick_name(String ec_nick_name) {
        this.ec_nick_name = ec_nick_name;
    }

    public void setEc_reply(String ec_reply) {
        this.ec_reply = ec_reply;
    }

    public void setEc_reply_time(Date ec_reply_time) {
        this.ec_reply_time = ec_reply_time;
    }
}
