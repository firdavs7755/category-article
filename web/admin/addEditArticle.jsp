<%@ page import="uz.lesson.models.Category" %>
<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="uz.lesson.models.Article" %>
<%@ page import="uz.lesson.db.ArticleTable" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10.12.2019
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int id = -1;
    int categoryId=-1;
    try {
        id = Integer.parseInt(request.getParameter("id"));
        categoryId = Integer.parseInt(request.getParameter("categoryid"));//articleList dan keladi
    } catch (Exception e) {}

    if (request.getMethod().equalsIgnoreCase("post")) {
        String name = request.getParameter("name");
        categoryId = Integer.parseInt(request.getParameter("category_id"));
        String content = request.getParameter("content");
        Article article = new Article();
        article.setId(id);
        article.setName(name);
        article.setCategoryId(categoryId);
        article.setContent(content);

        if (id!=-1){
            int old_category_id = Integer.parseInt(request.getParameter("old_category_id"));
            Article old_article = ArticleTable.removeArticleById(old_category_id , id);
            article.setCreatedAt(old_article.getCreatedAt());
            article.setSeenCount(old_article.getSeenCount());
            article.setPublished(old_article.isPublished());
        }
        ArticleTable.saveArticle(article);
        response.sendRedirect("/admin/articleList.jsp?categoryid="+article.getCategoryId());
    }
%>

<html>
<head>
    <title>Title</title>
    <%@include file="urls.jsp"%>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <%@include file="navbar.jsp"%>
        </div>
    </div>
    <h4><%=id == -1 ? "Add" : "Edit"%> Article</h4>
    <label>Select Ariticle category</label>
    <form action="" method="post">
        <input type="hidden" name="id" value="<%=id%>">
        <div class="row">
            <div class="col-md-3 col-sm-12">
                <select data-role="select" id="category_id" name="category_id">
                    <%for (Category category : CategoryTable.allCategories()) {%>
                    <option value="<%=category.getId()%>"><%=category.getName()%></option>
                    <%}%>
                </select>
            </div>
            <div class="col-md-3 col-sm-12 ">
                <input type="hidden" name="id" value="<%=id%>">
                <input type="hidden" name="old_category_id" value="<%=categoryId%>">
                <input type="text" name="name" class="float-right"
                       value="<%=id==-1?"":ArticleTable.findArticleById(categoryId,id).getName()%>"
                       placeholder="<%=id==-1?"Enter":"Change"%> artice title">
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6 col-sm-12">
                <%if (id==-1){%>
                <textarea  name="content" class="textarea" rows="5" cols="70"></textarea>
                <%}else {%>
                <textarea  name="content" class="textarea" rows="5" cols="70"><%=ArticleTable.findArticleById(categoryId,id).getContent()%></textarea>
                <%}%>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-6 col-sm-12">
                <button type="submit" class="float-right btn btn-primary">save</button>
            </div>
        </div>
    </form>
</div>
</body>
<%if(id!=-1){%>
<script>
    $('#category_id').val(<%=categoryId%>);
</script>
<%}%>
</html>
