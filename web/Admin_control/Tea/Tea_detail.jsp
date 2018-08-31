<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/2
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>教师详细信息</title>
    <script>
        function modify(name,id,password,major_id,major) {
            // window.location.href="Stu_modify.jsp?name='"+name+"'&id='"+id+"'&password='"+password+"'&major='"+major+"'";
            // location.href="Students_infor.jsp";
            // open("Stu_modify.jsp?name='"+name+"'&id='"+id+"'&password='"+password+"'&major='"+major+"'");
            aha.innerText=name+id+password+major;
        }
    </script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="tea_detail" class="com.sql.SQL" scope="request"/>

<%
    String id="",name="",password="",major="",major_id="";
    // out.println(request.getParameter("stu_id"));
    try {
        String sql1 = "select * from Teacher where Tea_id = '"+request.getParameter("tea_id")+"'";
        ResultSet rs1 = tea_detail.executeQuery(sql1);
        if(rs1.next())
        {
            {
                id=rs1.getString("Tea_id");
                name=rs1.getString("Tea_name");
                password=rs1.getString("password");
            }
            out.println("学号："+id+"<br>");
            out.println("姓名："+name+"<br>");
            out.println("密码："+password+"<br>");
            out.println("<table border=\"1\" bgcolor=\"#6495ed\">\n" +
                    "    <tr>\n" +
                    "        <td>\n" +
                    "            专业\n" +
                    "        </td>\n" +
                    "        <td>\n" +
                    "            已上传考试\n" +
                    "        </td>\n" +
                    "    </tr>");
            ResultSet rs = tea_detail.executeQuery("select * from major where Tea_id='"+id+"'");
            while(rs.next()) {
                major = rs.getString("major_name");
                out.println("<tr><td><a href='../major_detail.jsp?major_id="+rs.getString("major_id")+"'>"+major + "</a></td><td>");

                String sql2 = "select * from Exam where major_id='" +rs.getString("major_id") + "' and "
                        + "OnloadTea_id='"+id+"'";
                // String sql2 = "select * from Teacher t ,major m where m.major_id='"+rs1.getString("major_id")+"'";
                ResultSet rs2 = tea_detail.executeQuery(sql2);
                while (rs2.next()) {
                    out.println("<a href='../Exam\\Exam_detail.jsp?Exam_id="+rs2.getString("Exam_id")+"'>"+rs2.getString("Exam_name") + "</a>&nbsp;&nbsp;");
                    // out.println(rs2.getString("major_name")+"<br>");
                }
                out.println("</td>");
            }
            out.println("</table>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    tea_detail.CloseDatabase();
%>
<br/>
<a href="Tea_modify.jsp?id=<%=id%>&name=<%=name%>&password=<%=password%>&major_id=''&major=''">
    <input type="button" value="修改">
</a>
<div id="aha"></div>
</body>
</html>
