<%@ page import="uz.lesson.models.Category" %>
<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="uz.lesson.db.ArticleTable" %>
<%@ page import="uz.lesson.models.Article" %>
<%@ page import="uz.lesson.utils.DateUtils" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 16.01.2020
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        int c = -1;
        try {
            c = Integer.parseInt(request.getParameter("c"));
        } catch (Exception e) {
        }
        if (c == -1) {
            try {
                c = CategoryTable.allCategories().iterator().next().getId();
            } catch (Exception e) {
            }
        }

    %>

    <style type="text/css">
        .divider{
            border-left: 1px solid rgba(10, 130, 191, 0.31);
            height: auto;
        }
    </style>

    <title>Articles</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-grid.css">
    <script src="js/jquery-1.11.3.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <%@include file="menuBar.jsp" %>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="list-group">
                <%for (Category category : CategoryTable.allCategories()) {%>
                <a href="articles.jsp?c=<%=category.getId()%>" class="list-group-item list-group-item-action
                <%=c==category.getId()?"active":""%>">
                     <%=category.getName()%>
                    <div class="float-right ml-auto">
                        <span class="badge"><%=ArticleTable.getArticlesCount(category.getId())%></span>
                    <i class="fa fa-hand-o-right"></i>
                    </div>
                </a>
                <%}%>
            </div>
        </div>
        <div class="divider">
        </div>
        <div class="col-md-8">
            <ul class="list-group list-unstyled">
                <%for (Article article : ArticleTable.allArticles(c)) {
                        if (!article.isPublished()) continue;%>
                <li>
                    <h5 class="mt-1"><%=article.getName()%></h5>
                    <span class="float-right">
                        <span><i class="fa fa-eye"></i>:<%=article.getSeenCount()%></span>
                        <span><i class="fa fa-clock-o"></i>:<%=DateUtils.formatDate(article.getCreatedAt())%></span>
                    <hr>
                    </span>
                    <span class="clearfix"></span>
                    <div class="">
                        <p class="mb-0"><%=article.getContent().length()>300?article.getContent().substring(0,250).concat(" ..."):article.getContent()%></p>
                        <br>
                        <a href="view.jsp?c=<%=c%>&a_id=<%=article.getId()%>" class="btn btn-primary float-right">More <i class="fa fa-hand-o-right"></i></a>
                    </div>
                </li>
                <hr class="divider2">
                <%}%>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
