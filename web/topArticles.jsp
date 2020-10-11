<%@ page import="uz.lesson.db.ArticleTable" %>
<%@ page import="uz.lesson.models.Article" %>
<%@ page import="uz.lesson.utils.DateUtils" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 17.01.2020
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Top</title>
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
        <div class="col-md-10 offset-1">
            <ul class="list-group list-unstyled">
                <%for (Article article : ArticleTable.getTopArticles()) {
                        if (!article.isPublished()) continue;%>
                <li>
                    <h3><%=article.getName()%></h3>
                    <span>
                        <span class="text-sm-right"><i class="fa fa-eye"></i>:<%=article.getSeenCount()%></span>
                        <span class="text-sm-right">  <i class="fa fa-clock-o"></i>:<%=DateUtils.formatDate(article.getCreatedAt())%></span>
                    </span>
                    <span class="clearfix"></span>
                    <div>
                        <p><%=article.getContent().length()>300?article.getContent().substring(0,300).concat(" ..."):article.getContent()%>
                            <br>
                            <a href="/view.jsp?c=<%=article.getCategoryId()%>&id=<%=article.getId()%>" class="btn btn-primary mt-1 dark place-right">More <i class="fa fa-hand-o-right"></i></a>
                            <span class="clear-fix"></span>
                    </div>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
