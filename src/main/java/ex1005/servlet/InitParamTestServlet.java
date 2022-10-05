package ex1005.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class InitParamTestServlet extends HttpServlet {
    private String message, driverName, dbId;
    @Override
    public void init() throws ServletException {
//        super.getInitParameter() 얘는 Servlet 에서 값을 가져온다는 뜻
        ServletContext application = super.getServletContext(); // 얘는 application에서 값을 구해옴

        // servletContext(application)에서 가져온 값
        message = application.getInitParameter("message");
        driverName = application.getInitParameter("driverName");

        //servlet에서 가져온값 얜 여기선 아마 안나올거임
        dbId = super.getInitParameter("dbId");

        System.out.println("message : " + message + ", " + "driverName : " + driverName + ", " + "dbId : " + dbId);
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("message : " + message + ", " + "driverName : " + driverName + ", " + "dbId : " + dbId);
    }
}
