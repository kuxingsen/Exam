<%@ page import="com.sql.SQL" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/3
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学生</title>
</head>
<body>
<%
    String name=request.getParameter("name");
    String id=request.getParameter("id");
    String password=request.getParameter("password");
    String major=request.getParameter("major");
%>
<form method="get" action="../modify_con.jsp">
    姓名：<input type="text" name="name" value=<%=name%>><br/>
    学号：<input type="text" name="id" value=<%=id%>><br/>
    密码：<input type="text" name="password" value=<%=password%>><br/>
    专业：
    <select name="major">
        <%
            SQL add_stu=new SQL();
            String sql="select distinct major_name from major";
            ResultSet rs=add_stu.executeQuery(sql);
            try {
                while (rs.next())
                {
                    if(rs.getString("major_name").equals(major))
                    {
                        out.println("<option selected='selected'>"+rs.getString("major_name")+"</option>");
                    }
                    else{
                        out.println("<option>"+rs.getString("major_name")+"</option>");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </select>
    <input type="hidden" name="kind" value="Student">
    <input type="hidden" name="old_id" value="<%=id%>">
    <input type="hidden" name="url" value="<%=request.getHeader("Referer")%>">
    <input type="submit" value="确认">
    <br/>
</form>
</body>
</html>
