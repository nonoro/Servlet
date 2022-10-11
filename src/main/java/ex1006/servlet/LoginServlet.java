package ex1006.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class LoginServlet extends HttpServlet {
    String dbId;
    String dbPwd;

    // init에 init-parame으로 저장해놓은 dbId와 dbPwd를 불러온다
    @Override
    public void init() throws ServletException {
//        ServletContext application = super.getServletContext();
        dbId = String.valueOf(getInitParameter("dbId"));
        dbPwd = String.valueOf(getInitParameter("dbPwd"));
    }

    // init에서 불러온 값을 loginForm.html에서 등록한 id, pwd와 비교하여 일치하면 session에 값을 저장하고
    // 일치하지 않으면 alert 메세지를 내보내고 다시 로그인 페이지를 보여준다
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        // 넘어오는 값 2개 받기
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        long accessTime = System.currentTimeMillis();

        if (dbId.equals(userId) && dbPwd.equals(userPwd)) {
            HttpSession session = request.getSession();
            session.setAttribute("sessionId", userId);
            session.setAttribute("sessionTime", new Date(accessTime).toLocaleString());

            out.println("<script>");
            out.println("window.parent.location.reload()");
            out.println("</script>");

        } else {
            out.println("<script>");
            out.println("alert('아이디 또는 비밀번호가 틀렸습니다')");
            out.println("history.back()");
            out.println("</script>");

        }

    }
}
