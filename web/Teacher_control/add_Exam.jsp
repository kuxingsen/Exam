<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/8
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加试卷</title>
</head>
<body>
<jsp:useBean id="add_bean" scope="page" class="com.sql.SQL"/>
<%
    String Tea_id=request.getParameter("Tea_id");
%>
<form method="get" action="add_Exam_con.jsp">
试卷名：<input type="text" name="Exam_name"><br/>
专业：
<%
    String sql="select * from major where Tea_id='"+Tea_id+"'";
    ResultSet rs=add_bean.executeQuery(sql);
    try {
        while(rs.next())
        {
            out.println("<input type='checkbox' name='major_id' value='"+rs.getString("major_id")+"'>"+rs.getString("major_name")+"&nbsp;&nbsp;");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
    <br/>
    <input hidden name="Tea_id" value="<%=Tea_id%>">
    <input hidden name="url" value="<%=request.getHeader("Referer")%>">
    <input type="submit" value="确定">
</form>
</body>
</html>
