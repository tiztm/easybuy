package com.ztm.core.controller;

/**
 * Created by IDEA
 * User:    tiztm
 * Date:    2016/9/29.
 */
import com.ztm.core.dao.BaseDao;
import com.ztm.core.util.ClassUtils;
import com.ztm.core.util.StringUtil;
import com.ztm.core.util.db.DBUtilsHelper;
import com.ztm.util.Constants;
import org.apache.commons.dbutils.QueryRunner;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 */
@WebServlet(name="InitServlet",urlPatterns = "/InitServlet",loadOnStartup=1)
public class InitServlet extends HttpServlet {

    private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(InitServlet.class);


    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitServlet() {
        //System.out.println("调用构造方法1");
    }


    public void init(ServletConfig config) throws ServletException {
        System.out.println("调用初始化方法1");

        //数据库初始化
        String realPath = config.getServletContext().getRealPath("/")+"WEB-INF\\classes";
        System.out.println(realPath);


        ClassUtils.WEB_CLZ_PATH = realPath;

        List<Class> entityClz = ClassUtils.scanPackage(Constants.getInstance().packageName);
        for(Class clazz : entityClz){

            String tableName = clazz.toString();
            String colsNames = "";

            tableName = StringUtil.camelToUnderline(tableName.substring(tableName.lastIndexOf(".")+1,tableName.length()));


            //System.out.println(tableName));

            Field[] fields = clazz.getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {//

                String mysqlTypeName = null;
                String typeName = fields[i].getType().toString();

                String[] fieldTypes = Constants.getInstance().fieldType;
                for (int fieldCount = 0; fieldCount < fieldTypes.length; fieldCount++) {
                    if(typeName.endsWith(fieldTypes[fieldCount]))
                    {
                        mysqlTypeName = Constants.getInstance().mySQLFieldType[fieldCount];
                        break;
                    }
                }

                if(mysqlTypeName==null)
                {
                    logger.error("存在无法识别的类型："+tableName);
                    return;
                }



                if(fields[i].getName().endsWith("_id"))
                {
                    //主键
                    colsNames = colsNames + " " + fields[i].getName() +
                            " " + mysqlTypeName +
                            " NOT NULL AUTO_INCREMENT,  PRIMARY KEY (`" +fields[i].getName()+
                            "`),";
                }
                else {
                    colsNames = colsNames + " " + fields[i].getName() +
                            " " + mysqlTypeName +
                            ", ";
                }

                //

            }

            if(colsNames.length()<1)
            {
                logger.error("该表无字段："+tableName);
                continue;
            }


            geneTable(tableName, colsNames.substring(0,colsNames.length()-2));


        }



        String tablename = "EasybuyComment";

        String colsNames = "number INT(11),\n" +
                "name VARCHAR(255),\n" +
                "birthday DATE\n";


        //geneTable(tablename, colsNames);





    }

    private void geneTable(String tablename, String colsNames) {


        System.out.println(tablename);

        System.out.println(colsNames);


        int count = BaseDao.getCount("SELECT count( * ) \n" +
                "FROM information_schema.TABLES\n" +
                "WHERE table_name = '" +tablename+
                "'\n" +
                "AND TABLE_SCHEMA = '" + Constants.getInstance().dbName +
                "'");

        logger.debug(count+"");

        if(count<1)
        {

            try {


                BaseDao.getQueryRunner().update("CREATE TABLE IF NOT EXISTS " + tablename +
                        " (\n" +
                        colsNames +
                        ");");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public void destroy() {
        logger.debug("调用销毁方法1");

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        out.print("hello servlet");
        logger.debug("调用Get方法");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}