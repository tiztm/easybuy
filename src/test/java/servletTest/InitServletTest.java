package servletTest;

import com.ztm.core.controller.InitServlet;
import org.junit.Test;

import javax.servlet.ServletException;

/**
 * Created by IDEA
 * User:    tiztm
 * Date:    2016/9/29.
 */
public class InitServletTest {

    @Test
    public void testInit() throws ServletException {
        InitServlet initServlet = new InitServlet();
        initServlet.init(null);
    }
}
