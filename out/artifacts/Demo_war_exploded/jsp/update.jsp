<%--
  Created by IntelliJ IDEA.
  User: russell
  Date: 18-2-1
  Time: 下午4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!-- c标签要使用,那么就必须要有它 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set scope="page" var="url"
       value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
    <title>修改图书信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../static/css/bootstrap.css">
    <style type="text/css">
        .nav {
            width: 100%;
            height: 100px;
        }

        .nav > div {
            font-size: 45px;
            margin: 20px 0 0 100px;
        }
        table {
            width: 100%;
            margin-top: 10px;
            border: 2px solid black;
            border-collapse: separate;
            padding: 0px;
        }
        th{
            text-align: center;
        }
        td{
            height:70px;
            text-align: center;
        }
        .tb1 {
            width: 240px;
        }

        .tb2 {
            width: 270px;
        }

        .tb3 {
            width: 180px;
        }
        .container {
            width: 100%;
        }
        button > span{
            color:black;
        }
        .col-md-2 > div{
            font-size:80px;
            text-align: center;
        }
        .head{
            background-color:whitesmoke;
        }
        .myf{
            border:4px black solid;
        }
        input{
            height:80px;
            font-size:20px;
            margin:-2px;
            border: 1px black solid;
            text-align: center;
        }
        .mybtn{
            margin-left:5px;
            margin-top:-5px;
            width:200px;
            height:75px;
        }
    </style>
</head>
<body>
<nav class="nav navbar-default head">
    <div>Easy图书管理系统</div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="tb1">编号</th>
                    <th class="tb2">书名</th>
                    <th class="tb2">作者</th>
                    <th class="tb2">出版时间</th>
                    <th class="tb3">类别</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody></tbody>
                    <tr>
                        <td><span>${book.id}</span>
                        <td><span>${book.name}</span>
                        <td><span>${book.author}</span>
                        <td><span>${book.pub_time}</span>
                        <td><span>${book.type}</span>
                        <td>修改前</td>
                    </tr>
                </tbody>
            </table>
            <form action="${url}/Servlet_TbBook?what=update" method="post" class="myf">
                <input type="text" value="${book.id}" name="id" class="tb1" readonly="readonly">
                <input type="text" value="${book.name}" name="name" class="tb2">
                <input type="text" value="${book.author}" name="author" class="tb2">
                <input type="text" value="${book.pub_time}" name="pub_time" class="tb2">
                <input type="text" value="${book.type}" name="type" class="tb3">
                <button  class="mybtn btn btn-danger btn-lg" onclick="alert('修改成功！')">提交</button>
            </form>

        </div>
    </div>
</div>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/2.1.0/jquery.js"></script>
<script type="text/javascript">
</script>
</body>
</html>

<!--



-->