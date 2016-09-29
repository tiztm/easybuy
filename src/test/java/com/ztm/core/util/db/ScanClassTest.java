package com.ztm.core.util.db;

import com.ztm.core.util.ClassFilter;
import com.ztm.core.util.ClassUtils;
import org.junit.Test;

import java.lang.reflect.Modifier;

/**
 * Created by IDEA
 * User:    tiztm
 * Date:    2016/9/29.
 */
public class ScanClassTest {
    private ClassFilter filter;


    protected void setUp(){
        filter = new ClassFilter(){

            public boolean accept(Class clazz) {
                return
                        !Modifier.isAbstract(clazz.getModifiers())
                                && !Modifier.isInterface(clazz.getModifiers())
                                && Modifier.isPublic(clazz.getModifiers())
                                && !Modifier.isStatic(clazz.getModifiers())
                                ;
            }
        };
    }


    @Test
    public void testScanClassTest() throws Exception{

        setUp();

        for(Class clazz : ClassUtils.scanPackage("com.ztm.entity")){
            System.out.println(clazz);
        }

    }
}
