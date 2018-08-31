<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/2
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师信息</title>
</head>
<body>
<jsp:useBean id="tea_sql" class="com.sql.SQL" scope="request"/>
<form action="../delete_con.jsp" method="post">
    <table bgcolor="#7fffd4" border="1" >
        <th>教师信息</th>
        <tr>
            <td>姓名</td>
            <td>工号</td>
            <td>密码</td>
            <td>其他</td>
            <td>删除</td>
            <td>修改</td>
        </tr>
        <%
            String sql = "select * from Teacher group by Tea_name,Tea_id,password";
            ResultSet rs = tea_sql.executeQuery(sql);
            try {
                while (rs.next())
                {
                    out.println("<tr>");
                    out.println("<td>"+rs.getString("Tea_name")+"</td>");
                    out.println("<td>"+rs.getString("Tea_id")+"</td>");
                    out.println("<td>"+rs.getString("password")+"</td>");
                    out.println("<td><a href='Tea_detail.jsp?tea_id="+rs.getString("Tea_id")+"'>详细</a></td>");
                    out.println("<td><input type='checkbox' name='del' value="+rs.getString("Tea_id")+"></td>");
                    out.println("<td><a href='Tea_modify.jsp?id="+rs.getString("Tea_id")+"&name="+rs.getString("Tea_name")+"&password="+rs.getString("password")+"&major=''&major_id='' >修改</a></td>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            tea_sql.CloseDatabase();
        %>
    </table>
    <input type="hidden" name="kind" value="Teacher">
    <input type="submit" name="DEL" value="删除">&nbsp;&nbsp;
    <input type="button" name="ADD" value="新增" onclick="location.href='add_tea.jsp'">
</form>
</body>
</html>
