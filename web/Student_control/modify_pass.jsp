<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/8
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
</head>
<body>
<%
    String id=request.getParameter("Stu_id");
    String password=request.getParameter("password");
%>
<form name="modify_pass" method="post" action="modify_con.jsp">
    新密码<input name="new_pass" type="text" value="<%=password%>"><br/>
    <input hidden name="id" value="<%=id%>">
    <input hidden name="url" value="<%=request.getHeader("Referer")%>">
    <input type="submit" value="确定">
</form>
</body>
</html>
