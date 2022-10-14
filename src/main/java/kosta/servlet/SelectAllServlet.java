package kosta.servlet;

import kosta.dao.MemberDAO;
import kosta.dao.MemberDAOImpl;
import kosta.dto.Member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/selectAll")
public class SelectAllServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberDAO dao = new MemberDAOImpl();
        List<Member> members = dao.selectAll();

        // list를 scope영역에 저장
        request.setAttribute("members", members);

        // memberSelect.jsp이동한다.
        request.getRequestDispatcher("memberSelect.jsp").forward(request, response);

    }
}
