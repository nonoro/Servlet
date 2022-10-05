package ex1005.servlet;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class InitParamServlet extends HttpServlet {
    private String message, driverName, dbId, dbPwd;
    @Override
    public void init() throws ServletException {
        ServletContext application = super.getServletContext(); // 얘는 application에서 값을 구해옴

        // servletContext(application)에서 가져온 값
        message = application.getInitParameter("message");
        driverName = application.getInitParameter("driverName");


        dbId = super.getInitParameter("dbId"); // super. 생략가능
        dbPwd = getInitParameter("dbPwd");

        System.out.println("message : " + message + ", driverName : " + driverName + ", dbId : " + dbId + ", dbPwd : " + dbPwd);


    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("message : " + message + ", driverName : " + driverName + ", dbId : " + dbId + ", dbPwd : " + dbPwd);

    }
}
