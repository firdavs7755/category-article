<%@ page import="uz.lesson.models.Category" %>
<%@ page import="uz.lesson.db.CategoryTable" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12.01.2020
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        int id = -1;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        }catch (Exception e){}
        if(request.getMethod().equalsIgnoreCase("post")){
            Category category = new Category();
            category.setName(request.getParameter("name"));
            category.setId(id);
            CategoryTable.saveCategory(category);
            response.sendRedirect("/admin/categoryList.jsp");
        }
    %>
    <title>
        <%=id==-1?"Add":"Edit"%> Category
    </title>
    <%@include file="urls.jsp"%>

</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <%@include file="navbar.jsp"%>
            </div>
        </div>
        <div class="row mt-5">
          <div class="offset-2 col-md-4 col-sm-12">
              <form action="" method="post">
                  <input type="hidden" value="<%=id%>">
                  <div class="card">
                      <div class="card-header">
                          <%=id==-1?"Add":"Edit"%> Category
                      </div>
                      <div class="card-body">
                          <div class="form-group">
                              <label for="p">Category name:</label>
                              <input type="text" class="form-control" id="p" placeholder="Enter category" name="name"
                                     value="<%=id==-1?"":CategoryTable.findCategoryById(id).getName()%>"  >
                          </div>
                      </div>
                      <div class="card-footer">
                          <button type="submit" class="btn btn-primary float-right"><i class="fa fa-save"></i> Save</button>
                      </div>
                  </div>
              </form>
          </div>
        </div>
    </div>

    <i class="fa fa-align-left"></i>


</body>
</html>
