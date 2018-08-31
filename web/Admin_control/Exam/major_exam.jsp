<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/7
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专业考试</title>
</head>
<body>
<jsp:useBean id="majorExam" class="com.sql.SQL"/>
<%
    Map<String,String> Tea_name=new HashMap<String,String>();
    ResultSet Tea_rs=majorExam.executeQuery("select * from Teacher");
    try {
        while(Tea_rs.next())
        {
            Tea_name.put(Tea_rs.getString("Tea_id"),Tea_rs.getString("Tea_name"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    Map<String,String> Ma_name=new HashMap<String,String>();
    ResultSet Ma_rs=majorExam.executeQuery("select distinct major_id,major_name from major");
    try {
        while(Ma_rs.next())
        {
            Ma_name.put(Ma_rs.getString("major_id"),Ma_rs.getString("major_name"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<table bgcolor="#a9a9a9" border="1">
    <tr>
        <td>
            专业
        </td>
        <td>
            试卷号
        </td>
        <td>
            试卷名
        </td>
        <td>
            上传老师
        </td>
        <td>
            修改
        </td>
    </tr>
    <%
        String sql="select * from Exam where major_id='"+request.getParameter("major_id")+"'";
        ResultSet rs=majorExam.executeQuery(sql);
        try {
            while(rs.next())
            {
                out.println("<tr>");
                out.println("<td><a href='major_exam.jsp?major_id="+rs.getString("major_id")+"'>"+Ma_name.get(rs.getString("major_id"))+"</a></td>");
                out.println("<td>"+rs.getString("Exam_id")+"</td>");
                out.println("<td><a href='Exam_detail.jsp?Exam_id="+rs.getString("Exam_id")+"'>"+rs.getString("Exam_name")+"</a></td>");
                if(rs.getString("OnloadTea_id").equals("null"))
                    out.println("<td>暂无</td>");
                else
                    out.println("<td><a href='../Tea\\Tea_detail.jsp?tea_id="+rs.getString("OnloadTea_id")+"'>"+Tea_name.get(rs.getString("OnloadTea_id"))+"</a></td>");

                out.println("<td><a href='Exam_modify.jsp?id="+rs.getString("Exam_id")+"'>修改</a></td>");
                out.println("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
