<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="uz.lesson.models.Category" %>
<%@ page import="uz.lesson.db.ArticleTable" %>
<%@ page import="uz.lesson.models.Article" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12.01.2020
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        int categoryId = -1;
        try {
            categoryId = CategoryTable.allCategories().iterator().next().getId();
        } catch (Exception e) {
        }
        try {
            categoryId = Integer.parseInt(request.getParameter("categoryid"));
        } catch (Exception r) {
        }
    %>
    <title>Article List</title>
    <%@include file="urls.jsp" %>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <%@include file="navbar.jsp"%>
        </div>
    </div>
    <div class="row">
        <div class="offset-1 col-md-3">
            <ul class="list-group list-unstyled">
                <%for (Category category : CategoryTable.allCategories()) {%>
                <li class="hover <%=categoryId==category.getId()?"btn btn-primary":""%> ">
                    <a href="/admin/articleList.jsp?categoryid=<%=category.getId()%>" class="">
                        <div>
                            <span class="text-<%=categoryId==category.getId()?"white":"dark"%>"><%=category.getName()%></span><br>
                            <span class="text-<%=categoryId==category.getId()?"white":"dark"%>">Article count: <%=ArticleTable.getArticlesCount(category.getId())%></span>
                            <hr>
                        </div>
                    </a></li>
                <%}%>
            </ul>
        </div>

        <div class="col-md-7">
            <h2>List of Articles</h2>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <td width="10%">ID</td>
                    <td >Name</td>
                    <td width="25%">Actions</td>
                    <td width="15%">Publish</td>
                </tr>
                </thead>
                <tbody>
                <%for (Article article : ArticleTable.allArticles(categoryId)) {%>
                <tr>
                    <td> <%=article.getId()%> </td>
                    <td> <%=article.getName()%> </td>
                    <td>
                        <a href="/admin/addEditArticle.jsp?id=<%=article.getId()%>&categoryid=<%=categoryId%>" class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
                        <a href="/delete?kind=article&id=<%=article.getId()%>&categoryid=<%=categoryId%>" onclick="return confirm('are you sure tou want to delete this item')" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</a>
                    </td>
                    <td>
                        <input type="checkbox"
                               class="publisher"
                               <%=article.isPublished()?"checked":""%>
                               class="ml-3 form-check-input float-right"
                               id="alert"
                               data-id="<%=article.getId()%>"
                               data-category-id="<%=categoryId%>">
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>

        <div class="col-md-1">
            <a href="/admin/addEditArticle.jsp" class="btn btn-primary"><i class="fa fa-plus"></i> Add</a>
        </div>
    </div>
</div>
</body>
<script>
    $('.publisher').on('change',function () {
        var published = $(this).is(':checked');
        var articleId = $(this).attr('data-id');
        var categoryId = $(this).attr("data-category-id");
        $.ajax({
            url:"/admin/publish",
            method:'get',
            data:{
                published:published,
                articleId:articleId,
                categoryId:categoryId
            }
        })
    })
</script>
</html>


<style>
    .hover:hover {
        background-color: rgba(58, 158, 255, 0.97);
    }
    .slow  .toggle-group { transition: left 0.7s; -webkit-transition: left 0.7s; }

</style>
