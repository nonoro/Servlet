package step07_ServletExam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class LoginServlet extends HttpServlet {

    String dbId = "jang", dbPwd = "1234";

    public LoginServlet() {
        System.out.println("LoginServlet 생성됨 ...");
    }

    @Override
    public void init() throws ServletException {
        System.out.println("LoginServlet의 init 호출됨...");
    }

    // service를 오버라이딩하면 doget dopost가 작동을안함


    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 넘어오는 값 3개를 받는다.
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String name = request.getParameter("userName");
        long accessTime = System.currentTimeMillis();
        PrintWriter out = response.getWriter();

        // id와 비번이 일치하는지 검사해서 일치하면 session에 이름과 아이디와 접속시간을 저장한다
        // LoginOk.jsp이동 - 이동방식은 redirect
        if (dbId.equals(userId) && dbPwd.equals(userPwd)) {
            HttpSession session = request.getSession();
            session.setAttribute("sessionId", userId);
            session.setAttribute("sessionName", name);
            session.setAttribute("sessionTime", new Date(accessTime).toLocaleString());
            response.sendRedirect("LoginOk.jsp");
        } else {
            out.println("<script>");
            out.println("alert('아이디 또는 비밀번호가 틀렸습니다')");
//            out.println("location.href = 'LoginForm.html'");
            out.println("history.back()");
            out.println("</script>");



        }

        // 아니면 메시지 출력하고 폼으로 이동한다.

    }

//    @Override
//    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=UTF-8");
//        System.out.println("LoginServlet의 doGet 호출됨...");
//        PrintWriter out = resp.getWriter();
//        out.println("<html>");
//        out.println("<head>");
//        out.println("<title>안녕하세요</title>");
//        out.println("</head>");
//        out.println("<body>");
//        out.println("<h3>제발요</h3>");
//        out.println("</body>");
//        out.println("</html>");
//    }
//
//    @Override
//    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("LoginServlet의 doPost 호출됨...");
//    }
}
