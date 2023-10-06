package filter;

import Model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns ={"/homes?action=addToCart"})
public class ClientFilter implements Filter {
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest)servletRequest).getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            ((HttpServletResponse)servletResponse).sendRedirect("/auth");
            return;
        }
        if(!user.getRole().getName().equals("client")){
            ((HttpServletResponse)servletResponse).sendRedirect("/auth");
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);

    }
}
