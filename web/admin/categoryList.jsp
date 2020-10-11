<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="uz.lesson.models.Category" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12.01.2020
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>category List</title>
    <%@include file="urls.jsp" %>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <%@include file="navbar.jsp" %>
        </div>
    </div>
    <div class="row">
        <div class="offset-1 col-md-10">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                <tr>
                    <td width="15%">Id</td>
                    <td>Title</td>
                    <td width="25%">Actions</td>
                </tr>
                </thead>
                <tbody>
                <%for (Category category : CategoryTable.allCategories()) {%>
                <tr>
                    <td><%=category.getId()%></td>
                    <td><%=category.getName()%></td>
                    <td class="">
                        <a href="/admin/addEditCategory.jsp?id=<%=category.getId()%>" class="btn btn-warning"><i class="fa fa-edit"></i> Edit</a>
                        <a href="/delete?kind=category&id=<%=category.getId()%>" class="btn btn-danger" ><i class="fa fa-trash"></i> Delete</a>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
        <div class="col-md-1">
            <a href="/admin/addEditCategory.jsp" class="btn btn-primary"><i class="fa fa-plus"></i> Add</a>
        </div>
    </div>
</div>
</body>
</html>
