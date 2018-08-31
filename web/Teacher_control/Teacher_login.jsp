<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/1
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师</title>
</head>
<body>
<h1>教师界面</h1>
<jsp:useBean id="Tea_sql" class="com.sql.SQL"/>
<%
    String id= (String) session.getAttribute("Teacher_id");
    String name="",major_id="",password="",major_name="";

    ResultSet rs=Tea_sql.executeQuery("select * from Teacher where Tea_id='"+id+"'");
    try {
        if(rs.next())
        {
            name=rs.getString("Tea_name");
            password=rs.getString("password");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<h3><%=name%></h3>
<table bgcolor="#d3d3d3" border="1">
    <tr>
        <td>
            专业
        </td>
        <td>
            已上传试卷
        </td>
    </tr>

<%
    rs=Tea_sql.executeQuery("select * from major where Tea_id='"+id+"'");
    try {
        while(rs.next())
        {
            major_id=rs.getString("major_id");
            major_name=rs.getString("major_name");
            out.println("<tr><td><a href='major_stu.jsp?major_id="+major_id+"&Tea_id="+id+"'>"+major_name+"</td><td>");
            String sql="select * from Exam where major_id='"+major_id+"' and OnloadTea_id='"+id+"'";
            ResultSet rs2=Tea_sql.executeQuery(sql);
            while(rs2.next())
            {
                out.println("<a href='Exam_detail.jsp?Exam_id="+rs2.getString("Exam_id")+"'>"+rs2.getString("Exam_name")+"</a>&nbsp;&nbsp;");
            }
            out.println("</td></tr>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>
</table>
<input type="button" value="添加试卷" onclick="location.href='add_Exam.jsp?Tea_id=<%=id%>'">
</body>
</html>
