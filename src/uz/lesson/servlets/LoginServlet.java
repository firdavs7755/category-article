package uz.lesson.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        if (userName.equals("admin") && password.equals("123")){
            req.getSession().setAttribute("user",true);
            resp.sendRedirect("/admin");
        }else {
            resp.sendRedirect("/login.jsp?userName="+userName+"&error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("logout")!=null){
            req.getSession().removeAttribute("user");
            resp.sendRedirect("/");
        }
    }
}
