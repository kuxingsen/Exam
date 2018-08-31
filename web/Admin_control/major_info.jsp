<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/6
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专业信息</title>
</head>
<body>
<jsp:useBean id="major_sql" scope="page" class="com.sql.SQL"/>
<h3>专业信息</h3>
<table bgcolor="#ff1493" border="1">
    <tr>
        <td>
            专业
        </td>
        <td>
            人数
        </td>
        <td>
            所有教师
        </td>
    </tr>
    <%
        String sql="select distinct major_name,major_id from major";
        ResultSet rs=major_sql.executeQuery(sql);
        try {
            while(rs.next())
            {
                out.println("<tr><td><a href='major_detail.jsp?major_id="+rs.getString("major_id")+"'>"+rs.getString("major_name")+"</td>");
                sql="select distinct Stu_id from Student where major_id='"+rs.getString("major_id")+"'";
                Integer sum=0;
                ResultSet rs2=major_sql.executeQuery(sql);
                while(rs2.next())
                {
                    sum++;
                }
                out.println("<td>"+sum+"人</td><td>");
                sql="select distinct Tea_id from major m where major_id='"+rs.getString("major_id")+"'";
                rs2=major_sql.executeQuery(sql);
                while (rs2.next())
                {
                    sql="select Tea_name from Teacher where Tea_id='"+rs2.getString("Tea_id")+"'";
                    ResultSet rs3=major_sql.executeQuery(sql);
                    rs3.next();
                    out.println("<a href='Tea\\Tea_detail.jsp?tea_id="+rs2.getString("Tea_id")+"'>"+rs3.getString("Tea_name")+"</a>&nbsp;&nbsp;");
                }
                out.println("</td></tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        major_sql.CloseDatabase();
    %>
</table>

</body>
</html>
