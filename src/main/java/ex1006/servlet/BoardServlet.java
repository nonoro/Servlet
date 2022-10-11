package ex1006.servlet;

import ex1006.dto.BoardDTO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class BoardServlet extends HttpServlet {
    // 게시판의 내용을 담을 list를 생성
    List<BoardDTO> list;

    // servlet파일이 처음 실행될때 init메서드가 실행되어
    // web.xml파일에서 context-param으로 저장한 값들을 불러와 list에 저장한뒤 application영역에 저장한다.
    @Override
    public void init() throws ServletException {
        ServletContext application = super.getServletContext();
        list = new ArrayList<>();

        for (int i = 1; i <= 3; i++) {
            int no = Integer.parseInt(application.getInitParameter("no" + i));
            String subject = application.getInitParameter("subject" + i);
            String content = application.getInitParameter("content" + i);
            list.add(new BoardDTO(no, subject, content));
        }

        application.setAttribute("boardList", list);
    }

    // 로그인을 완료한뒤 게시판의 내용을 등록할때 실행되며 등록한 내용을 list에 추가한다
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter(); // out.println사용하기 위함
        int no = Integer.parseInt(request.getParameter("no"));
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");

        list.add(new BoardDTO(no, subject, content));

        // 게시판이 iframe영역이기 때문에 등록하고나서 전체창을 새로고침하여 최신정보를 update해주기위해
        // window.parent.location.reload()사용
        out.println("<script>");
        out.println("window.parent.location.reload()");
        out.println("</script>");


    }
}
