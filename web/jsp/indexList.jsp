<%--
  Created by IntelliJ IDEA.
  User: russell
  Date: 18-1-31
  Time: 下午1:20
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
    <title>图书列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">
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
        td{
            height:70px;
        }
        .tb1 {
            width: 180px;
        }

        .tb2 {
            width: 350px;
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
        .update{

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
                    <th class="tb1">出版时间</th>
                    <th class="tb1">类别</th>
                    <th class="tb1">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${booklist}" var="book">
                    <tr>
                        <td><span id="id">${book.id}</span><input type="text" name="id" value="${book.id}" style="display:none; width:150px;"></td>
                        <td><span id="name">${book.name}</span><input type="text" name="id" value="${book.id}" style="display:none; width:180px;"></td>
                        <td><span id="author">${book.author}</span><input type="text" name="id" value="${book.id}" style="display:none; width:180px;"></td>
                        <td><span id="pub_time">${book.pub_time}</span><input type="text" name="id" value="${book.id}" style="display:none; width:180px;"></td>
                        <td><span id="type">${book.type}</span><input type="text" name="id" value="${book.id}" style="display:none; width:100px;"></td>
                        <td>
                            <button class="update btn btn-warning btn-lg" onclick="window.location.href='${url}/Servlet_TbBook?what=queryById&id=${book.id}'">修改</button>
                            <button class="btn btn-danger btn-lg">删除
                                <a href= "${url}/Servlet_TbBook?what=delete&id=${book.id}"></a>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-body">
        <table id="mytable">

        </table>
    </div>
</div>



</body>
</html>

<!--



-->