<%--
  Created by IntelliJ IDEA.
  User: russell
  Date: 18-1-30
  Time: ����1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!--    c��ǩҪʹ��,��ô�ͱ���Ҫ���� -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--���ص�jstl��jar��Ҫ����tomcat��lib�ļ�����-->
<c:set scope="page" var="url"
       value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>�����û�</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">


</head>

<body>
<div align="center"
     style="width: 400px; position: relative;left:450px">
    <form action="${url}/Servlet_TbBook?what=Insert" method="post">
        <h4>�����û�</h4>
        ����: <input type="text" name="name"><br>
        ����: <input type="text" name="author"><br>
        ����ʱ��:<input type="text" name="pub_time"><br>
        ���:<input type="text" name="type"><br>
        ID��<input type="text" name="id"><br>
        <input type="submit" value="����"/>
        <hr />
    </form>
</div>
<div align="center"style="width: 400px; position: relative;left:450px;">
    <form action="${url}/Servlet_TbBook?what=queryAll" method="post">
        <input type="submit" value="��ѯ���е�����" id="sub"> <br>
        <table border="1"  cellspacing="0">
            <thead>
            <tr><td>ID</td><td>����</td><td>����</td><td>����ʱ��</td><td>���</td><td>����</td></tr>
            </thead>
            <tbody>
            <c:forEach items="${booklist}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.author}</td>
                    <td>${user.pub_time}</td>
                    <td>${user.type}</td>
                    <td><a  href= "${url}/Servlet_TbBook?what=queryById&id=${user.id}"     style='text-decoration:none'    onclick='update(this)'   >�޸�&nbsp;</a>
                        <a    href= "${url}/Servlet_TbBook?what=delete&id=${user.id}"   style='text-decoration:none'     >ɾ��</a>  </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <hr />
    </form>
</div>
<div align="center"
     style="width: 400px; position: relative;left:450px">
    <form action="${url}/zhu/Servlet_TbUser?what=update" method="post">
        <h4>�޸�</h4>
        <input type="hidden"name="id"  value="${user.id }"/>
        ����: <input type="text" name="name" value="${user.name }"><br />
        ����: <input    type="text" name="password" value="${user.author }"><br>
        ����ʱ��: <input type="text" name="birthday" value="${user.pub_time }"><br>
        ���: <input    type="text" name="password" value="${user.type }"><br>
        ID: <input    type="text" name="password" value="${user.id }"><br>
        <input type="submit" value="�����޸�"/>
        <hr />
    </form>
</div>
</body>
</html>