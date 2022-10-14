package kosta.servlet;

import kosta.dao.MemberDAO;
import kosta.dao.MemberDAOImpl;
import kosta.dto.Member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/read")
public class ReadServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 넘어오는 id를 받기
        String id = request.getParameter("id");
        MemberDAO dao = new MemberDAOImpl();
        Member member = dao.selectById(id);
        String url = "error.jsp";

        if (member == null) {

            request.setAttribute("errMsg", id + "에 해당하는 회원의 정보가 없습니다");
        } else {
            request.setAttribute("member", member);
            url = "read.jsp";
        }
        request.getRequestDispatcher(url).forward(request, response);

    }
}
