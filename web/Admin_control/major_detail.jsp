<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/6
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专业详细信息</title>
</head>
<body>
<jsp:useBean id="stu_sql" class="com.sql.SQL" scope="request"/>
<h3>学生名单</h3>
<form action='delete_con.jsp' method="post">
<table bgcolor="#f08080" border="1">
    <tr>
        <td>姓名</td>
        <td>学号</td>
        <td>密码</td>
        <td>专业</td>
        <td>其他</td>
        <td>删除</td>
        <td>修改</td>
    </tr>
    <%
        String sql = "select * from Student where major_id='"+request.getParameter("major_id")+"'";
        ResultSet rs = stu_sql.executeQuery(sql);
        try {
            while (rs.next())
            {
                out.println("<tr>");
                out.println("<td>"+rs.getString("Stu_name")+"</td>");
                out.println("<td>"+rs.getString("Stu_id")+"</td>");
                out.println("<td>"+rs.getString("password")+"</td>");
                ResultSet rs2=stu_sql.executeQuery("select * from major where major_id='"+rs.getString("major_id")+"'");
                rs2.next();
                out.println("<td>"+rs2.getString("major_name")+"</td>");
                out.println("<td><a href='Stu\\Stu_detail.jsp?stu_id="+rs.getString("Stu_id")+"'>详细</a></td>");
                out.println("<td><input type='checkbox' name='del' value="+rs.getString("Stu_id")+"></td>");
                out.println("<td><a href='Stu\\Stu_modify.jsp?id="+rs.getString("Stu_id")+"&name="+rs.getString("Stu_name")+"&password="+rs.getString("password")+"&major="+rs2.getString("major_name")+"&major_id="+rs2.getString("major_id")+"' >修改</a></td>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        stu_sql.CloseDatabase();
    %>
</table>
<input type="hidden" name="kind" value="Student">
<input type="submit" name="DEL" value="删除">&nbsp;&nbsp;
<input type="button" name="ADD" value="新增" onclick="location.href='Stu\\add_stu.jsp'">
</form>


</body>
</html>
