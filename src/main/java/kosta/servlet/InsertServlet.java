package kosta.servlet;

import kosta.dao.MemberDAO;
import kosta.dao.MemberDAOImpl;
import kosta.dto.Member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/insert")
public class InsertServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberDAO dao = new MemberDAOImpl();
        String errMsg = "등록에 실패하였습니다.";
        String url = "error.jsp";
        boolean isRedirect = false; // true이면 redirect방식이다, false이면 forward방식이다.

        // 넘어오는 값들 받기
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");



        // 유효성체크
        if (id == null || id.equals("") || pwd == null || pwd.equals("")
                || name == null || name.equals("") || age == null || age.equals("")
                || addr == null || addr.equals("") || phone == null || phone.equals("")) {

            // 오류가 있다
            errMsg = "입력값들의 정보가 충분하지 않습니다. \\n다시 확인해주세요";
        } else {
            // 중복체크
            if (dao.duplicateById(id)) {
                errMsg = id + "는 이미 사용중입니다.";
            } else {
                // 등록하기 ( 생성자 오버로딩 안할거라 joinDate null로 늠 어짜피 들어갈때 sysdate로 들어감 )
                Member member = new Member(id, pwd, name, Integer.parseInt(age), phone, addr, null);
                if (dao.insert(member) > 0) {
                    url = "selectAll";
                    isRedirect = true;
                }
            }
        }


        // 모든것이 성공하면 redirect 방식으로 selectAll 서블릿으로 이동
        // 오류가 있으면 오류메시지를 scope에 저장하고 foward방식으로 error.jsp로 이동
        if (isRedirect) {
            response.sendRedirect(url);
        } else {
            request.setAttribute("errMsg", errMsg);
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
}
