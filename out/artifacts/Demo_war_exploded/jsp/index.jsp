<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">

    <title>Easy图书管理系统</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <style type="text/css">
        body{
            background:url(../static/img/bg.jpeg);
            background-position:20% 120%;
        }
        form {
            position: absolute;
            width:250px;
            top:35%;
            left:55%;
            margin:-60px 0 0 -140px;
        }

        .divform {
            position: absolute;
            top: 50%;
            left:30%;
            margin: -150px 0 0 -200px;
            width: 400px;
            height: 250px;
            border: 1px solid #008800;
            background-color: lightgreen;
        }

        h1 {
            margin-top:80px;
            margin-left:200px;
            color:black;
            font-size:450%;
        }
        label{
            font-size:20px;
        }
        input{
            height:25px;
            padding-top: 10px;
            padding-bottom:10px;
        }
    </style>
</head>
<body>
<h1>${msg}</h1>   <!--对应servlet的msg-->
<h1>Easy图书管理系统</h1>
<div class="divform">
    <form action="login" method="post">     <!--在xml文件里有把checkcount映射到login-->
        <div class="form-group">
            <label for="username">用户名:</label>
            <input type="text" class="form-control" id="username" name="username">
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <button type="submit" class="btn btn-block" style="font-size:20px;">提交</button>
    </form>
</div>
</body>
</html>
