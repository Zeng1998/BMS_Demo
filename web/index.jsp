<%--
  Created by IntelliJ IDEA.
  User: russell
  Date: 18-1-30
  Time: 上午10:31
  To change this template use File | Settings | File Templates.
--%>
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
            background:url(static/img/bg.jpeg);
            background-position:20% 120%;
        }
        form {
            position: absolute;
            top:50%;
            left:50%;
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
            margin:10px;
        }
        input{
            width:200px;
            height:30px;
        }
    </style>
</head>
<body>
<h1>${msg}</h1>   <!--对应servlet的msg-->
<h1>Easy图书管理系统</h1>
<div class="divform">
    <form action="login" method="post">
        <table>
            <tr>
                <td><label>账号</label></td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td><label>密码</label></td>
                <td><input type="text" name="psw"></td>
            </tr>
            <tr>
                <td></td>
                <td><button type="submit" class="btn btn-block" style="font-size:20px;">提交</button></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
