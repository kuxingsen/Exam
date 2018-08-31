<%@ page import="com.sql.SQL" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/3
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增</title>
</head>
<body>
<form method="get" action="../add_con.jsp">
    姓名：<input type="text" name="name"><br/>
    学号：<input type="text" name="id"><br/>
    密码：<input type="text" name="password"><br/>
    专业：
    <%
        SQL add_stu=new SQL();
        String sql="select distinct major_name from major";
        ResultSet rs=add_stu.executeQuery(sql);
        try {
            while (rs.next())
            {
                out.println("<input type='checkbox' name='major_name' value='"+rs.getString("major_name")+"'/>"+rs.getString("major_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
    <input type="hidden" name="kind" value="Teacher">
    <input type="hidden" name="url" value="<%=request.getHeader("Referer")%>">
    <input type="submit" value="确认">
    <br/>
</form>
</body>
</html>
