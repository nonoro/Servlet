package kosta.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebFilter(
        urlPatterns = {"/*"},
        initParams = {
                @WebInitParam(name = "encoding", value = "UTF-8")
        }
)
public class EncodingFilter implements Filter {
    private String encoding;
    public void init(FilterConfig config) throws ServletException {
        encoding = config.getInitParameter("encoding");
        System.out.println("EncodingFilter의 init메소드 입니다.");
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        // 사전처리
        request.setCharacterEncoding(encoding);

        chain.doFilter(request, response);
        // 사후처리
    }
}
