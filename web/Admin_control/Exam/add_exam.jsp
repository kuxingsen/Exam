<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/7
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息修改</title>
</head>
<body>
<jsp:useBean id="modify_bean" scope="page" class="com.sql.SQL"/>
<form name="exam_modify" method="get" action="../add_con.jsp">
    试卷号：<input name="id" type="text"><br>
    试卷名：<input type="text" name="name" ><br>
    教师：
    <select name="Tea">
        <%
            String sql="select distinct Tea_name,Tea_id from Teacher";
            ResultSet rs= modify_bean.executeQuery(sql);
            try {
                while (rs.next())
                {
                    out.println("<option>"+rs.getString("Tea_name")+"</option>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </select>
    专业：
    <select name="major">
        <%/*应该弄成联动的，但是不会，，，，*/
            sql="select distinct major_name,major_id from major";
            rs= modify_bean.executeQuery(sql);
            try {
                while (rs.next())
                {
                    out.println("<option>"+rs.getString("major_name")+"</option>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </select>
    <br>
    <input type="hidden" name="kind" value="Exam">
    <input type="hidden" name="url" value="<%=request.getHeader("Referer")%>">
    <input type="submit" value="确认">
    <br/>
</form>
</body>
</html>
