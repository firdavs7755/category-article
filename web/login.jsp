<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 16.01.2020
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="admin/urls.jsp"%>
</head>
<body>
<style>
    <%if (request.getParameter("error")!=null){%>
    .card {
        /*background-color: red;*/
        animation-name: example;
        animation-duration: 2s;
        animation-delay: revert;
        animation-iteration-count: 20;
        animation-direction: alternate;
    }
    @-webkit-keyframes example {
        from {
            background-color: rgba(255, 0, 0, 0);
        }
        to {
            background-color: rgba(255, 10, 4, 0.64);
        }
    }
    <%}%>
</style>

<div class="container">
    <div class="row mt-5">
        <div class="col-md-5 offset-3">
            <div class="card">

                <h5 class="card-header info-color white-text text-center py-4">
                    <strong><%=request.getParameter("error")!=null?"Something Is Wrong!!!":"Login to Administration"%></strong>
                </h5>
                <div class="card-body px-lg-5 pt-0">
                    <form class="text-center" method="post" style="color: #757575;" action="/login">
                        <div class="md-form">
                            <label for="uname" class="float-left">Username</label>
                            <input type="text" name="userName" class="form-control" id="uname" placeholder="Enter Username">
                        </div>

                        <div class="md-form">
                            <label for="psw" class="float-left">Password</label>
                            <input type="password" name="password" class="form-control" id="psw"  placeholder="Enter Password" >
                        </div>
                        <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Login</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>




</body>
</html>
