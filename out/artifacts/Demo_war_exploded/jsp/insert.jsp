<%@ page import="com.zxc.dao.Tb_BookImpl" %>
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
    <title>添加图书信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css">
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

        th {
            text-align: center;
        }

        td {
            height: 70px;
            text-align: center;
        }

        .tb1 {
            width: 240px;
        }

        .tb2 {
            width: 300px;
        }

        .tb3 {
            width: 180px;
        }

        .container {
            width: 100%;
        }

        button > span {
            color: black;
        }

        .col-md-2 > div {
            font-size: 80px;
            text-align: center;
        }

        .head {
            background-color: whitesmoke;
        }

        .myf {
            border: 4px black solid;
        }

        input {
            height: 80px;
            font-size: 20px;
            margin: -2px;
            border: 1px black solid;
            text-align: center;
        }

        .mybtn {
            margin-left: 5px;
            margin-top: -5px;
            width: 200px;
            height: 75px;
        }

        .headbtn {
            float: left;
            display: inline;
            height: 60px;
            width: 200px;
            font-size: 20px;
            margin: 12px 0px 12px 60px;
        }

        .search {
            display: inline;
            height: 60px;
            font-size: 18px;
        }

        .seainput {
            height: 60px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<nav class="nav navbar-header head">
    <div style="display: inline-block;" class="glyphicon glyphicon-bookBean"> Easy图书管理系统</div>
</nav>
<button class="btn btn-success headbtn" onclick="index()">首页</button>
<div class="input-group col-md-2" style="float:right; margin:12px 50px 12px 0px;">
    <input id="search" type="text" class="form-control seainput" placeholder="请输入书名关键字" onkeypress="key()">
    <span class="input-group-btn">
        <button id="key" class="btn btn-info btn-search glyphicon glyphicon-search search"
                onclick="search()">查找</button>
    </span>
</div>
<div class="panel panel-default">
    <div class="panel-body" style="margin:0px 15px 0px 15px;">
        <table class="table table-hover">
            <thead>
            <tr>
                <th class="tb1">编号</th>
                <th class="tb2">书名</th>
                <th class="tb2">作者</th>
                <th class="tb3">出版时间</th>
                <th class="tb2">类别</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
        <form action="${url}/Servlet_TbBook?what=Insert" method="post" class="myf">
            <input type="text" name="id" class="tb2">
            <input type="text" name="name" class="tb2">
            <input type="text" name="author" class="tb2">
            <input type="text" name="pub_time" class="tb2">
            <input type="text" name="type" class="tb2">
            <div style="text-align: center;">
                <input type="submit" class="mybtn btn btn-danger btn-lg" onclick="yes()" >
            </div>
        </form>

    </div>
</div>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/2.1.0/jquery.js"></script>
<script type="text/javascript">
    function yes() {
        var furl = "${url}/Servlet_TbBook?what=queryByPage&page="+<%=new Tb_BookImpl().getPageCount()%>;
        alert('添加成功！');
        window.location.href = furl;
    }
    function search() {
        var name = document.getElementById("search").value;
        var page = 1;
        var nurl = "${url}/Servlet_TbBook?what=queryByName&name=" + encodeURIComponent(name) + "&page=" + page;
        window.location.href = nurl;
    }
    function index() {
        var indexurl = "${url}/Servlet_TbBook?what=queryByPage&page=1";
        window.location.href = indexurl;
    }
    function key() {
        if (event.keyCode == 13) {
            document.getElementById("key").click();
        }
    }
</script>
</body>
</html>

<!--


-->