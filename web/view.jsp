<%@ page import="java.lang.reflect.ParameterizedType" %>
<%@ page import="uz.lesson.db.ArticleTable" %>
<%@ page import="uz.lesson.models.Article" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17.01.2020
  Time: 0:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-grid.css">
    <script src="js/jquery-1.11.3.min.js"></script>
</head>
<%
    int c = -1;
    int a_id = -1;
    try {
        c = Integer.parseInt(request.getParameter("c"));
        a_id = Integer.parseInt(request.getParameter("a_id"));
    }catch (Exception e){
        response.sendRedirect("/404.html");
    }
    Article article = ArticleTable.findArticleById(c,a_id);
    if (article == null){
        response.sendRedirect("/404.html");
    }
    article.setSeenCount(article.getSeenCount()+1);
%>
<style>
    #content-text{
        border: 1px gray solid;
        padding: 15px;
        text-align: justify;
        line-height: 1.5;
        font-size: 16px;
        box-shadow: 0 2px 8px rgba(52, 142, 229, 0.4);
        border-radius: 0px;
        margin-bottom: 20px;
        margin-top: 10px;
    }
</style>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <%@include file="menuBar.jsp" %>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10">
            <h1>
                <a onclick="window.history.back()" class="btn btn-primary"><i class="fa fa-hand-o-left"></i></a>
                <%=article.getName()%>
            </h1>
            <p id="content-text"><%=article.getContent()%></p>
        </div>
    </div>
</div>

</body>
</html>
