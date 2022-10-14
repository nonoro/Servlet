package kosta.servlet;

import kosta.dao.MemberDAO;
import kosta.dao.MemberDAOImpl;
import kosta.dto.Member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyField = request.getParameter("keyField");
        String keyWord = request.getParameter("keyWord");

        MemberDAO dao = new MemberDAOImpl();
        List<Member> members = dao.searchByKeyWord(keyField, keyWord);

        // 얘는 selectAll이랑 name변수가 같음 이유는 같은 jsp를 이용하기 때문
        request.setAttribute("members", members);
        request.getRequestDispatcher("memberSelect.jsp").forward(request, response);
    }
}
