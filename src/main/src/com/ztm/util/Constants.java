package com.ztm.util;

/**
 * Created by IDEA
 * User:    tiztm
 * Date:    2016/9/29.
 */
public class Constants {
    private static Constants ourInstance = new Constants();

    public static Constants getInstance() {
        return ourInstance;
    }

    private Constants() {
    }

    public String dbName = "easybuytest";

    public String packageName = "com.ztm.entity";

    public String[] fieldType = {"int","String","Date"};

    public String[] mySQLFieldType = {"INT(11)","VARCHAR(255)","DATE"};
}
