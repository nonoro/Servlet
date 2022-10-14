package kosta.servlet;

import kosta.dao.MemberDAO;
import kosta.dao.MemberDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        MemberDAO dao = new MemberDAOImpl();
        if (dao.delete(id) == 0) {
            // 삭제안됨
            req.setAttribute("errMsg", id + "정보를 삭제할 수 없습니다.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        } else {
            // 삭제됨
            resp.sendRedirect("selectAll"); // 서블릿으로 이동

        }
    }
}
