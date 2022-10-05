package step07_ServletExam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 모든 세션의 정보를 삭제하고
        HttpSession session = req.getSession();
        session.invalidate(); // 모든 세션의 정보 삭제

        // 폼으로 이동
        resp.sendRedirect("LoginForm.html");
    }
}
