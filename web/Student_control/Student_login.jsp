<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/1
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生</title>
</head>
<body>
<h1>学生界面</h1>
<jsp:useBean id="Stu_sql" class="com.sql.SQL"/>
<%
    String id= (String) session.getAttribute("Student_id");
    String name="",major_id="",major_name="";
    String password="";
    ResultSet rs=Stu_sql.executeQuery("select * from Student where Stu_id='"+id+"'");
    try {
        if(rs.next())
        {
            name=rs.getString("Stu_name");
            major_id=rs.getString("major_id");
            password=rs.getString("password");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    rs=Stu_sql.executeQuery("select distinct major_name from major where major_id='"+major_id+"'");
    try {
        if(rs.next())
        {
            major_name=rs.getString("major_name");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }


%>
<h3>姓名：<%=name%></h3>
<h3>专业：<%=major_name%></h3>
<table border="1" bgcolor="#d3d3d3">
    <tr>
        <td>
            考试
        </td>
        <td>
            出卷老师
        </td>
        <td>
            分数
        </td>
        <td>
            查看正确答案
        </td>
    </tr>
<%
    String sql="select * from Exam where major_id ='"+major_id+"'";
    rs=Stu_sql.executeQuery(sql);
    try {
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td><a href='Exam_detail.jsp?Exam_id="+rs.getString("Exam_id")+"'>"+rs.getString("Exam_name")+"</a></td>");
            sql="select Tea_name from Teacher where Tea_id='"+rs.getString("OnloadTea_id")+"'";
            ResultSet rs1=Stu_sql.executeQuery(sql);
            if(rs1.next())
            {
                out.println("<td>"+rs1.getString("Tea_name")+"</td>");
            }
            sql="select * from Score where Exam_id='"+rs.getString("Exam_id")+"' and Stu_id='"+id+"'";
           // out.println(sql);
            ResultSet rs2=Stu_sql.executeQuery(sql);
            if(rs2.next())
            {
                out.println("<td>"+rs2.getString("Score")+"</td>");
                out.println("<td><a href='Exam_answer.jsp?Exam_id="+rs.getString("Exam_id")+"'>查看</a></td>");
            }
            else {
                out.println("<td><span style='color:red'>未做</span></td>");

                out.println("<td>不给</td>");
            }

            out.println("</tr>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</table>
&nbsp;&nbsp;<a href="modify_pass.jsp?Stu_id=<%=id%>&password=<%=password%>">修改密码</a>
</body>
</html>
