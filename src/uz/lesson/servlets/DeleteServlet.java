package uz.lesson.servlets;

import uz.lesson.db.ArticleTable;
import uz.lesson.db.CategoryTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String kind = req.getParameter("kind");
        switch (kind){
            case "category":{
                int id = Integer.parseInt(req.getParameter("id"));
                CategoryTable.deleteCategory(id);
                resp.sendRedirect("/admin/categoryList.jsp");
                break;
            }
            case "article":{
                int articleId = Integer.parseInt(req.getParameter("id"));
                int categoryId = Integer.parseInt(req.getParameter("categoryid"));
                ArticleTable.deleteArticleById(articleId,categoryId);
                resp.sendRedirect("/admin/articleList.jsp");
                break;
            }
            default:{
                resp.sendRedirect("404.html");
                break;
            }
        }
    }
}
