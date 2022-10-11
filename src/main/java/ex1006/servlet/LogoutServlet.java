package ex1006.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

// 로그아웃 버튼을 누르면 세션의 값을 초기화하고 페이지를 새로고침한다
public class LogoutServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        session.invalidate();

        out.println("<script>");
        out.println("window.parent.location.reload()");
        out.println("</script>");

    }
}
