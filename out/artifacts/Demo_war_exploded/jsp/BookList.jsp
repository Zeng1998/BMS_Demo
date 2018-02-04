<%--
  Created by IntelliJ IDEA.
  User: russell
  Date: 18-1-30
  Time: 下午1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!--    c标签要使用,那么就必须要有它 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--下载的jstl的jar包要放在tomcat的lib文件夹下-->
<c:set scope="page" var="url"
       value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>图书列表</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">

</head>
<body>
<div align="center"style="width: 400px; position: relative;left:450px;">
    <form action="${url}/Servlet_TbBook?what=queryAll" method="post" id="sub">
        <table border="1"  cellspacing="0">
            <thead>
            <tr><td>ID</td><td>书名</td><td>作者</td><td>出版时间</td><td>类别</td><td>操作</td></tr>
            </thead>
            <tbody>
            <c:forEach items="${booklist}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.author}</td>
                    <td>${user.pub_time}</td>
                    <td>${user.type}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <hr/>
    </form>
</div>
</body>
</html>