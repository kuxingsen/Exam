<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/8
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专业学生</title>
</head>
<body>

<jsp:useBean id="stu_sql" class="com.sql.SQL" scope="request"/>
<h3>学生名单</h3>
    <table bgcolor="#f08080" border="1">
        <tr>
            <td>姓名</td>
            <td>学号</td>
            <td>专业</td>
            <td>考试成绩</td>
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
                    ResultSet rs2=stu_sql.executeQuery("select * from major where major_id='"+rs.getString("major_id")+"'");
                    rs2.next();
                    out.println("<td>"+rs2.getString("major_name")+"</td>");
                    out.println("<td>");
                    sql="select * from Exam where major_id='"+rs.getString("major_id")+"' and OnloadTea_id='"+request.getParameter("Tea_id")+"'";
                    rs2=stu_sql.executeQuery(sql);
                    while(rs2.next())
                    {
                        out.println(rs2.getString("Exam_name"));
                        sql="select Score from Score where Stu_id='"+rs.getString("Stu_id")+"' and Exam_id='"+rs2.getString("Exam_id")+"'";
                        ResultSet rs3=stu_sql.executeQuery(sql);
                        if(rs3.next())
                        {
                            out.println("&nbsp;&nbsp;"+rs3.getString("Score")+"<br/>");
                        }
                        else {
                            out.println("&nbsp;&nbsp;<span style='color:red'>未填</span><br>");
                        }

                    }
                    out.println("</td></tr>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            stu_sql.CloseDatabase();
        %>
    </table>

</body>
</html>
