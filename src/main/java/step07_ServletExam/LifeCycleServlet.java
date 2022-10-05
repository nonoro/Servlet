package step07_ServletExam;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;



/*
* Servlet 작성방법
* 1) 반드시 public class
* 2) HttpServlet 상속
* 3) 필요한 메소드를 재정의한다
*
* 4) 실행을 위해서 등록을 한다
*   - web.xml에 등록
*   - @annotation 등록
* */

//@WebServlet(name = "Servlet", value = "/Servlet" ,loadOnStartup = 1)
public class LifeCycleServlet extends HttpServlet { // 필요한것만 재정의하면 되므로 상속만 받았다고 오류나지 x

    public LifeCycleServlet() {
        System.out.println("LifeCycleServlet의 생성자 호출...");
    }


    @Override
    public void init() throws ServletException {
        System.out.println("LifeCycleServlet의 init call...");

    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LifeCycleServlet의 service call...");
        // 문서 첫줄에 한글 인코딩 설정
        response.setContentType("text/html;charset=UTF-8");

        System.out.println("LifeCycleServlet의 doGet call...");

        // 브라우져에 출력
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Servlet 실습 중</title></head>");
        out.println("<body>");
        out.println("<h3 style='color:red'> Servlet 시작하기 </h3>");



        // HttpSession
        HttpSession session = request.getSession();
        session.setAttribute("name", "규정");

        // ServletContext
        ServletContext application = request.getServletContext();
        application.setAttribute("message", "servlet재미있다.");

        // Cookie 사용
        Cookie cookie = new Cookie("lastDate", System.currentTimeMillis() + "");
        response.addCookie(cookie);

        out.println("</body>");
        out.println("</html>");



    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 문서 첫줄에 한글 인코딩 설정
        response.setContentType("text/html;charset=UTF-8");

        System.out.println("LifeCycleServlet의 doGet call...");

        // 브라우져에 출력
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Servlet 실습 중</title></head>");
        out.println("<body>");
        out.println("<h3 style='color:red'> Servlet 시작하기 </h3>");



        // HttpSession
        HttpSession session = request.getSession();
        session.setAttribute("name", "규정");

        // ServletContext
        ServletContext application = request.getServletContext();
        application.setAttribute("message", "servlet재미있다.");

        // Cookie 사용
        Cookie cookie = new Cookie("lastDate", System.currentTimeMillis() + "");
        response.addCookie(cookie);

        out.println("</body>");
        out.println("</html>");



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("LifeCycleServlet의 doPost call...");

    }


    @Override
    public void destroy() {
        System.out.println("LifeCycleServlet의 destory call...");

    }

}
