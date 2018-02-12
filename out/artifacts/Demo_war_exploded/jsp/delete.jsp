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
    <title>删除图书信息</title>
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
            width: 270px;
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
                <th class="tb2">出版时间</th>
                <th class="tb3">类别</th>
            </tr>
            </thead>
            <tbody></tbody>
            <tr>
                <td><span>${bookBean.id}</span>
                <td><span>${bookBean.name}</span>
                <td><span>${bookBean.author}</span>
                <td><span>${bookBean.pub_time}</span>
                <td><span>${bookBean.type}</span>
            </tr>
            </tbody>
        </table>
        <div style="text-align: center;">
            <button class="btn btn-danger btn-lg" style="margin-right:100px;" onclick="yes()">确定删除</button>
            <button class="btn btn-success btn-lg" onclick="no()">取消并返回</button>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/2.1.0/jquery.js"></script>
<script type="text/javascript">
    function yes() {
        var i = parseInt(<%=request.getParameter("id")%>);
        var p = parseInt(<%=request.getParameter("page")%>);
        var furl = "${url}/Servlet_TbBook?what=delete&id=" + i + "&p=" + p;
        alert("删除成功！");
        window.location.href = furl;
    }

    function no() {
        var i = parseInt(<%=request.getParameter("page")%>);
        var murl = "${url}/Servlet_TbBook?what=queryByPage&page=" + i;
        window.location.href = murl;
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