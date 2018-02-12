<%@ page contentType="text/html;charset=UTF-8" import="com.zxc.dao.Tb_BookImpl" language="java" %>

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
    <title>搜索结果</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">
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

        td {
            height: 70px;
        }

        .tb1 {
            width: 180px;
        }

        .tb2 {
            width: 350px;
        }
        button > span {
            color: black;
        }
        .head {
            background-color: whitesmoke;
        }

        .update {
        }
        .headbtn{
            float:left;
            display:inline;
            height:60px;
            width:200px;
            font-size:20px;
            margin:12px 0px 12px 60px;
        }
        .search{
            display:inline;
            height:60px;
            font-size:18px;
        }
        .seainput{
            height:60px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<nav class="nav navbar-header head">
    <div style="display: inline-block;" class="glyphicon glyphicon-bookBean"> Easy图书管理系统</div>
</nav>
<button class="btn btn-success headbtn"  onclick="index()">首页</button>
<button class="btn btn-info headbtn"  onclick="insert()">添加信息</button>

<div class="input-group col-md-2" style="float:right; margin:12px 50px 12px 0px;">
    <input id="search" type="text" class="form-control seainput" placeholder="请输入书名关键字" onkeypress="key()">
    <span class="input-group-btn">
        <button id="key" class="btn btn-info btn-search glyphicon glyphicon-search search"  onclick="search()" >查找</button>
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
                <th class="tb1">出版时间</th>
                <th class="tb1">类别</th>
                <th class="tb1">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${booklist}" var="bookBean">
                <tr>
                    <td>${bookBean.id}</td>
                    <td>${bookBean.name}</td>
                    <td>${bookBean.author}</td>
                    <td>${bookBean.pub_time}</td>
                    <td>${bookBean.type}</td>
                    <td>
                        <button class="update btn btn-warning btn-lg"
                                onclick="window.location.href='${url}/Servlet_TbBook?what=showUpdateDetail&id=${bookBean.id}&page=<%=request.getParameter("page")%>'">修改
                        </button>
                        <button class="btn btn-danger btn-lg"
                                onclick="window.location.href='${url}/Servlet_TbBook?what=showDeleteDetail&id=${bookBean.id}&page=<%=request.getParameter("page")%>'">删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<nav class="navbar nav-pills">
</nav>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/2.1.0/jquery.js"></script>
<script type="text/javascript">
    function search() {
        var name=document.getElementById("search").value;
        var page=1;
        var nurl = "${url}/Servlet_TbBook?what=queryByName&name=" +encodeURIComponent(name)+"&page="+page;
        window.location.href = nurl;
    }
    function index() {
        var indexurl="${url}/Servlet_TbBook?what=queryByPage&page=1";
        window.location.href=indexurl;
    }
    function key() {
        if (event.keyCode == 13) {
            document.getElementById("key").click();
        }
    }
    function insert() {
        window.location.href="${url}/jsp/insert.jsp";
    }
</script>
</body>
</html>

<!--


-->